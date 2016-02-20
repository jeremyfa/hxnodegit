
import Sys.println;

import js.JQuery;
import js.node.Http;
import js.node.Path.join;
import js.node.Path.dirname;
import js.node.Path.basename;

import sys.FileSystem;
import sys.io.File;

import haxe.Json;

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

    private static var api_url:String = 'http://www.nodegit.org/api/';

    private static var api_local_path:String = join(Sys.getCwd(), 'api');

    private static var modules:Array<Module> = [];

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

    static function _(value:Dynamic):JQuery {
        return new JQuery(value);
    }

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
                callback(data.substring(data.indexOf("<body>")+6, data.lastIndexOf("</body>")));
            });
        });

    } //get_contents

    static function extract_modules(html:String):Void {

        modules = [];

        var dom = _(('<div>'+html+'</div>').replace("\n",' '));

        dom.find('h2 a').each(function(index, el) {
            var a = _(el);
            if (a.attr('href') != null) {
                modules.push({
                    name: a.text().trim(),
                    href: a.attr('href').replace('/api/', '')
                });
            }
        });

    } //extract_modules

    static function download_single_module(index:Int) {

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

    static function local_html_api_ready() {

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

    } //local_html_api_ready

    static function extract_extended_module(path:String) {

        var html = File.getContent(path);

        var dom = _(('<div>'+html+'</div>').replace("\n",' '));

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

            var h2 = _(el);
            var a = h2.find('a').first();
            var prefix_span = h2.find('span').first();
            var tag_async = h2.find('.tags .async');
            var tag_enum = h2.find('.tags .enum');

            if (h2.text().trim() == 'Instance Variables') {

                var table = next_of_type_before(h2, 'table', 'h2');
                table.find('tbody tr').each(function(index, el) {

                    var td0 = _(_(el).find('td').get(0));
                    var td1 = _(_(el).find('td').get(1));

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

                            var td0 = _(_(el).find('td').get(0));
                            var td1 = _(_(el).find('td').get(1));

                            args.push({
                                name: td0.text().trim(),
                                type: td1.text().trim()
                            });
                        });
                    }
                    // Method return value
                    else if (table.find('thead tr th').first().text().trim() == 'Returns') {

                        table.find('tbody tr').each(function(index, el) {

                            var td0 = _(_(el).find('td').get(0));
                            var td1 = _(_(el).find('td').get(1));

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
                    is_async: tag_async.length > 0
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

                        var td0 = _(_(el).find('td').get(0));
                        var td1 = _(_(el).find('td').get(1));

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

    }

}
