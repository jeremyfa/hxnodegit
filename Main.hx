
import Sys.println;

import js.JQuery;
import js.JQuery.JQueryHelper.J;
import js.Promise;
import js.node.Http;
import js.node.Path.join;
import js.node.Path.dirname;
import js.node.Path.basename;

import sys.FileSystem;
import sys.io.File;

import haxe.Json;
import haxe.macro.Expr;
import haxe.macro.Printer;

using haxe.macro.Tools;

using StringTools;

typedef Module = {

    var name:String;

    var href:String;

    @:optional var methods:Array<ModuleMethod>;

    @:optional var properties:Array<ModuleProperty>;

    @:optional var enums:Array<ModuleEnum>;
}

typedef ModuleMethod = {

    var name:String;

    var type:String;

    var args:Array<ModuleMethodArg>;

    @:optional var is_static:Bool;

    @:optional var is_async:Bool;
}

typedef ModuleMethodArg = {

    var name:String;

    var type:String;

    var is_optional:Bool;
}

typedef ModuleProperty = {

    var name:String;

    var type:String;

    @:optional var is_static:Bool;

}

typedef ModuleEnum = {

    var name:String;

    var flags:Array<ModuleEnumFlag>;

}

typedef ModuleEnumFlag = {

    var name:String;

    var value:Int;
}

class Main {

    static var pos = {min: 0, max: 0, file: ""};

    static var api_url:String = 'http://www.nodegit.org/api/';

    static var api_local_path:String = join(Sys.getCwd(), 'api');

    static var haxe_code_path:String = join(Sys.getCwd(), 'nodegit');

    static var modules:Array<Module> = [];

    static var module_types:Map<String,Bool> = new Map<String,Bool>();

    public static function main():Void {

        // Download files if not done already
        if (!FileSystem.exists(api_local_path)) {

            download(api_url, join(api_local_path, 'index.html'), function(html) {

                extract_modules(html);

                download_single_module(0);
            });

        } else {

            local_html_api_ready();
        }

    } //main


    /// Generate api.json from html API docs

    static function download(url:String, destination:String, callback:String->Void):Void {

        // Create directory (if needed)
        var dir = dirname(destination);
        if (!FileSystem.exists(dir)) {
            FileSystem.createDirectory(dir);
        }

        // Get contents
        get_contents(url, function(html) {

            // Save content
            File.saveContent(destination, html);

            // Next
            callback(html);
        });

    } //download

    static function get_contents(url:String, callback:String->Void):Void {

        println('download: ' + url);

        var data:String = '';

        Http.get(url, function(response) {
            response.on('data', function(chunk:Dynamic) {
                data += chunk;
            });
            response.on('end', function() {
                callback(data);
            });
        });

    } //get_contents

    static function cleanup_html(html:String):String {

        return html.substring(html.indexOf("<body>")+6, html.lastIndexOf("</body>"));

    } //cleanup_html

    static function extract_modules(html:String):Void {

        html = cleanup_html(html);

        modules = [];

        var dom = J(('<div>'+html+'</div>').replace("\n",' '));

        dom.find('h2 a').each(function(index, el) {
            var a = J(el);
            if (a.attr('href') != null) {
                modules.push({
                    name: a.text().trim(),
                    href: a.attr('href').replace('/api/', '')
                });
            }
        });

    } //extract_modules

    static function download_single_module(index:Int):Void {

        // Get module info
        var module = modules[index];

        // Download module
        download(api_url + module.href, join(api_local_path, module.href, 'index.html'), function(html) {

            // Download next module (if any)
            if (index < modules.length - 1) {
                download_single_module(index + 1);
            }
            // Or move to next step
            else {
                local_html_api_ready();
            }
        });

    } //download_single_module

    static function local_html_api_ready():Void {

        if (!FileSystem.exists(join(api_local_path, 'api.json'))) {

            modules = [];

            for (name in FileSystem.readDirectory(api_local_path)) {

                var dir = join(api_local_path, name);

                if (FileSystem.isDirectory(dir) && FileSystem.exists(join(dir, 'index.html'))) {

                    extract_extended_module(join(dir, 'index.html'));
                }
            }

            // Save modules API data as JSON
            println('save: api.json');
            File.saveContent(join(api_local_path, 'api.json'), Json.stringify({modules: modules}, null, '    '));

        } else {

            // Retrieve modules API data from saved JSON
            println('load: api.json');
            modules = Json.parse(File.getContent(join(api_local_path, 'api.json'))).modules;

        }

        // Start conversion to haxe
        convert_to_haxe();

    } //local_html_api_ready

    static function extract_extended_module(path:String):Void {

        var html = File.getContent(path);
        html = cleanup_html(html);

        var dom = J(('<div>'+html+'</div>').replace("\n",' '));

        var module:Module = {
            name: dom.find('.banner h2').first().text().trim(),
            href: basename(dirname(path))
        };

        println('extract module: ' + module.name);

        modules.push(module);

        module.methods = [];
        module.properties = [];
        module.enums = [];

        dom.find('.page-content h2').each(function(index, el) {

            var h2 = J(el);
            var a = h2.find('a').first();
            var prefix_span = h2.find('span').first();
            var tag_async = h2.find('.tags .async');
            var tag_enum = h2.find('.tags .enum');

            if (h2.text().trim() == 'Instance Variables') {

                var table = next_of_type_before(h2, 'table', 'h2');
                table.find('tbody tr').each(function(index, el) {

                    var td0 = J(J(el).find('td').get(0));
                    var td1 = J(J(el).find('td').get(1));

                    // Property
                    var property:ModuleProperty = {
                        name: td0.text().trim(),
                        type: td1.text().trim()
                    };

                    module.properties.push(property);
                });

            }
            else if (tag_enum.length == 0) {

                var type = null;
                var description = null;
                var args = [];

                // Look for a table after the h2, and before any other h2
                var table = next_of_type_before(h2, 'table', 'h2');

                while (table.length > 0) {

                    // Method parameters
                    if (table.find('thead tr th').first().text().trim() == 'Parameters') {

                        table.find('tbody tr').each(function(index, el) {

                            var td0 = J(J(el).find('td').get(0));
                            var td1 = J(J(el).find('td').get(1));

                            args.push({
                                name: td0.text().replace('[','').replace(']','').trim(),
                                type: td1.text().trim(),
                                is_optional: td0.text().indexOf('[') != -1
                            });
                        });
                    }
                    // Method return value
                    else if (table.find('thead tr th').first().text().trim() == 'Returns') {

                        table.find('tbody tr').each(function(index, el) {

                            var td0 = J(J(el).find('td').get(0));
                            var td1 = J(J(el).find('td').get(1));

                            type = td0.text().trim();
                            description = td1.text().trim();
                            if (description.length == 0) description = null;
                        });
                    }

                    // Look for another table after this one, before any h2
                    table = next_of_type_before(table, 'table', 'h2');
                }

                // Method
                var method:ModuleMethod = {
                    name: a.attr('name'),
                    type: type,
                    args: args,
                    is_static: !prefix_span.text().trim().endsWith('#'),
                    is_async: tag_async.length > 0,
                };

                module.methods.push(method);
            }
            else {

                var flags = [];

                // Look for a table after the h2, and before any other h2
                var table = next_of_type_before(h2, 'table', 'h2');

                // Enum flags
                if (table.find('thead tr th').first().text().trim() == 'Flag') {

                    table.find('tbody tr').each(function(index, el) {

                        var td0 = J(J(el).find('td').get(0));
                        var td1 = J(J(el).find('td').get(1));

                        flags.push({
                            name: td0.text().trim().substr(td0.text().trim().lastIndexOf('.') + 1),
                            value: Std.parseInt(td1.text().trim())
                        });
                    });
                }

                // Enum
                var enum_:ModuleEnum = {
                    name: a.attr('name'),
                    flags: flags
                };

                module.enums.push(enum_);

            }
        });

    } //extract_extended_module

    static function next_of_type_before(el:JQuery, type:String, stop:String):JQuery {

        var orig_el = el;

        while (true) {

            if (el.next(stop).length > 0) return orig_el.next(type);

            var target_el = el.next(type);
            if (target_el.length > 0) return target_el;

            el = el.next();

            if (el.length == 0) return orig_el.next(type);
        }

        return orig_el.next(type);

    } //next_of_type_before


    /// Conversion to haxe

    static function convert_to_haxe():Void {

        // Create destination directory if needed
        if (!FileSystem.exists(haxe_code_path)) {
            FileSystem.createDirectory(haxe_code_path);
        }

        // Keep a mapping of all available module types
        for (module in modules) {
            module_types.set(module.name, true);
        }

        var printer = new Printer();
        for (module in modules) {

            println('convert: nodegit.' + module.name);

            var fields:Array<Field> = [];

            for (property in module.properties) {
                fields.push(convert_property(property));
            }

            for (method in module.methods) {
                fields.push(convert_method(method));
            }

            for (enum_ in module.enums) {
                fields.push(convert_enum_property(enum_, module));
            }

            var output = printer.printTypeDefinition({
                pos: pos,
                pack: ['nodegit'],
                name: module.name,
                isExtern: true,
                kind: TDClass(null),
                fields: fields,
                meta: [
                    {name: ':jsRequire', params: [{expr: EConst(CString("nodegit")), pos: pos}, {expr: EConst(CString(module.name)), pos: pos}], pos: pos}
                ]
            }, true);

            for (enum_ in module.enums) {
                output += "\n" + printer.printTypeDefinition(convert_enum_class(enum_, module), false);
            }

            File.saveContent(join(haxe_code_path, module.name + '.hx'), output);

        }

    } //convert_to_haxe

    static function convert_property(property:ModuleProperty):Field {

        return {
            pos: pos,
            name: property.name,
            kind: FVar(convert_type(property.type, {allow_void: true, is_async: false})),
            access: property.is_static ? [AStatic] : []
        };

    } //convert_property

    static function convert_method(method:ModuleMethod):Field {

        var args:Array<FunctionArg> = [];
        for (arg in method.args) {
            args.push({name: arg.name, type: convert_type(arg.type, {allow_void: false, is_async: false}), opt: arg.is_optional});
        }

        return {
            pos: pos,
            name: method.name,
            kind: FFun({
                args: args,
                ret: convert_type(method.type, {allow_void: true, is_async: method.is_async}),
                expr: null
            }),
            access: method.is_static ? [AStatic] : []
        };

    } //convert_method

    static function convert_enum_property(enum_:ModuleEnum, module:Module):Field {

        return {
            pos: pos,
            name: enum_.name,
            kind: FProp('default', 'null', TPath({pack: [], name: module.name + camelize(enum_.name)})),
            access: [AStatic]
        };

    } //convert_enum_property

    static function convert_enum_class(enum_:ModuleEnum, module:Module):TypeDefinition {

        var fields:Array<Field> = [];

        for (flag in enum_.flags) {

            fields.push({
                pos: pos,
                name: flag.name,
                kind: FProp('default', 'null', macro :Int, {expr: EConst(CInt(''+flag.value)), pos: pos}),
                access: []
            });
        }

        return {
            pos: pos,
            pack: ['nodegit'],
            name: module.name + camelize(enum_.name),
            isExtern: true,
            kind: TDClass(null),
            fields: fields,
            meta: []
        };

    } //convert_enum_class

    static function convert_type(raw_type:String, options:{?is_async: Bool, ?allow_void: Bool}):ComplexType {

        return switch (raw_type) {
        case null:
            if (options.allow_void) {
                if (options.is_async)
                    macro :js.Promise<Void>
                else
                    macro :Void;
            } else {
                if (options.is_async)
                    macro :js.Promise<Dynamic>
                else
                    macro :Dynamic;
            }
        case 'String':
            if (options.is_async)
                macro :js.Promise<String>
            else
                macro :String;
        case 'Bool', 'Boolean', 'bool', 'boolean':
            if (options.is_async)
                macro :js.Promise<Bool>
            else
                macro :Bool;
        case 'Number':
            if (options.is_async)
                macro :js.Promise<Float>
            else
                macro :Float;
        case 'Integer', 'int':
            if (options.is_async)
                macro :js.Promise<Int>
            else
                macro :Int;
        case 'Array':
            if (options.is_async)
                macro :js.Promise<Array<Dynamic>>
            else
                macro :Array<Dynamic>;
        default:
            if (raw_type.startsWith("Array<")) {
                var collection_type = raw_type.substring(6, raw_type.lastIndexOf('>'));
                if (module_types.exists(collection_type)) {
                    if (options.is_async)
                        TPath({pack: ['js'], name: 'Promise', params: [TPType(TPath({pack: ['nodegit'], name: raw_type}))]});
                    else
                        TPath({pack: ['nodegit'], name: raw_type});
                } else {
                    switch (collection_type) {
                    case 'String':
                        if (options.is_async)
                            macro :js.Promise<Array<String>>
                        else
                            macro :Array<String>;
                    case 'Bool', 'Boolean', 'bool', 'boolean':
                        if (options.is_async)
                            macro :js.Promise<Array<Bool>>
                        else
                            macro :Array<Bool>;
                    case 'Number':
                        if (options.is_async)
                            macro :js.Promise<Array<Float>>
                        else
                            macro :Array<Float>;
                    case 'Integer', 'int':
                        if (options.is_async)
                            macro :js.Promise<Array<Int>>
                        else
                            macro :Array<Int>;
                    default:
                        if (options.is_async)
                            macro :js.Promise<Array<Dynamic>>
                        else
                            macro :Array<Dynamic>;
                    }
                }
            }
            else if (module_types.exists(raw_type)) {
                if (options.is_async)
                    TPath({pack: ['js'], name: 'Promise', params: [TPType(TPath({pack: ['nodegit'], name: raw_type}))]});
                else
                    TPath({pack: ['nodegit'], name: raw_type});
            }
            else {
                if (options.is_async)
                    macro :js.Promise<Dynamic>
                else
                    macro :Dynamic;
            }
        }

    } //convert_type

    static function camelize(str:String):String {

        str = str.toLowerCase();

        str = ~/(?:^|[-_])(\w)/g.map(str, function(regex:EReg):String {
            var c = regex.matched(1);
            if (c != null && c.length > 0) return c.toUpperCase();
            return '';
        });

        return str;

    } //camelize

}
