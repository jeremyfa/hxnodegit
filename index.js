(function (console, $global) { "use strict";
var $estr = function() { return js_Boot.__string_rec(this,''); };
function $extend(from, fields) {
	function Inherit() {} Inherit.prototype = from; var proto = new Inherit();
	for (var name in fields) proto[name] = fields[name];
	if( fields.toString !== Object.prototype.toString ) proto.toString = fields.toString;
	return proto;
}
var EReg = function(r,opt) {
	opt = opt.split("u").join("");
	this.r = new RegExp(r,opt);
};
EReg.__name__ = true;
EReg.prototype = {
	match: function(s) {
		if(this.r.global) this.r.lastIndex = 0;
		this.r.m = this.r.exec(s);
		this.r.s = s;
		return this.r.m != null;
	}
	,matched: function(n) {
		if(this.r.m != null && n >= 0 && n < this.r.m.length) return this.r.m[n]; else throw new js__$Boot_HaxeError("EReg::matched");
	}
	,matchedPos: function() {
		if(this.r.m == null) throw new js__$Boot_HaxeError("No string matched");
		return { pos : this.r.m.index, len : this.r.m[0].length};
	}
	,matchSub: function(s,pos,len) {
		if(len == null) len = -1;
		if(this.r.global) {
			this.r.lastIndex = pos;
			this.r.m = this.r.exec(len < 0?s:HxOverrides.substr(s,0,pos + len));
			var b = this.r.m != null;
			if(b) this.r.s = s;
			return b;
		} else {
			var b1 = this.match(len < 0?HxOverrides.substr(s,pos,null):HxOverrides.substr(s,pos,len));
			if(b1) {
				this.r.s = s;
				this.r.m.index += pos;
			}
			return b1;
		}
	}
	,map: function(s,f) {
		var offset = 0;
		var buf = new StringBuf();
		do {
			if(offset >= s.length) break; else if(!this.matchSub(s,offset)) {
				buf.add(HxOverrides.substr(s,offset,null));
				break;
			}
			var p = this.matchedPos();
			buf.add(HxOverrides.substr(s,offset,p.pos - offset));
			buf.add(f(this));
			if(p.len == 0) {
				buf.add(HxOverrides.substr(s,p.pos,1));
				offset = p.pos + 1;
			} else offset = p.pos + p.len;
		} while(this.r.global);
		if(!this.r.global && offset > 0 && offset < s.length) buf.add(HxOverrides.substr(s,offset,null));
		return buf.b;
	}
	,__class__: EReg
};
var HxOverrides = function() { };
HxOverrides.__name__ = true;
HxOverrides.cca = function(s,index) {
	var x = s.charCodeAt(index);
	if(x != x) return undefined;
	return x;
};
HxOverrides.substr = function(s,pos,len) {
	if(pos != null && pos != 0 && len != null && len < 0) return "";
	if(len == null) len = s.length;
	if(pos < 0) {
		pos = s.length + pos;
		if(pos < 0) pos = 0;
	} else if(len < 0) len = s.length + len - pos;
	return s.substr(pos,len);
};
HxOverrides.iter = function(a) {
	return { cur : 0, arr : a, hasNext : function() {
		return this.cur < this.arr.length;
	}, next : function() {
		return this.arr[this.cur++];
	}};
};
var js_node_Path = require("path");
var Main = function() { };
Main.__name__ = true;
Main.main = function() {
	if(!sys_FileSystem.exists(Main.api_local_path)) Main.download(Main.api_url,js_node_Path.join(Main.api_local_path,"index.html"),function(html) {
		Main.extract_modules(html);
		Main.download_single_module(0);
	}); else Main.local_html_api_ready();
};
Main.download = function(url,destination,callback) {
	var dir = js_node_Path.dirname(destination);
	if(!sys_FileSystem.exists(dir)) sys_FileSystem.createDirectory(dir);
	Main.get_contents(url,function(html) {
		js_node_Fs.writeFileSync(destination,html);
		callback(html);
	});
};
Main.get_contents = function(url,callback) {
	process.stdout.write("download: " + url);
	process.stdout.write("\n");
	var data = "";
	js_node_Http.get(url,function(response) {
		response.on("data",function(chunk) {
			data += Std.string(chunk);
		});
		response.on("end",function() {
			callback(data);
		});
	});
};
Main.cleanup_html = function(html) {
	return html.substring(html.indexOf("<body>") + 6,html.lastIndexOf("</body>"));
};
Main.extract_modules = function(html) {
	html = Main.cleanup_html(html);
	Main.modules = [];
	var dom;
	var html1 = StringTools.replace("<div>" + html + "</div>","\n"," ");
	dom = js.JQuery(html1);
	dom.find("h2 a").each(function(index,el) {
		var a = js.JQuery(el);
		if(a.attr("href") != null) Main.modules.push({ name : StringTools.trim(a.text()), href : StringTools.replace(a.attr("href"),"/api/","")});
	});
};
Main.download_single_module = function(index) {
	var $module = Main.modules[index];
	Main.download(Main.api_url + $module.href,js_node_Path.join(Main.api_local_path,$module.href,"index.html"),function(html) {
		if(index < Main.modules.length - 1) Main.download_single_module(index + 1); else Main.local_html_api_ready();
	});
};
Main.local_html_api_ready = function() {
	if(!sys_FileSystem.exists(js_node_Path.join(Main.api_local_path,"api.json"))) {
		Main.modules = [];
		var _g = 0;
		var _g1 = js_node_Fs.readdirSync(Main.api_local_path);
		while(_g < _g1.length) {
			var name = _g1[_g];
			++_g;
			var dir = js_node_Path.join(Main.api_local_path,name);
			if(js_node_Fs.statSync(dir).isDirectory() && sys_FileSystem.exists(js_node_Path.join(dir,"index.html"))) Main.extract_extended_module(js_node_Path.join(dir,"index.html"));
		}
		process.stdout.write("save: api.json");
		process.stdout.write("\n");
		sys_io_File.saveContent(js_node_Path.join(Main.api_local_path,"api.json"),JSON.stringify({ modules : Main.modules},null,"    "));
	} else {
		process.stdout.write("load: api.json");
		process.stdout.write("\n");
		Main.modules = JSON.parse(sys_io_File.getContent(js_node_Path.join(Main.api_local_path,"api.json"))).modules;
	}
	Main.convert_to_haxe();
};
Main.extract_extended_module = function(path) {
	var html = js_node_Fs.readFileSync(path,{ encoding : "utf8"});
	html = Main.cleanup_html(html);
	var dom;
	var html1 = StringTools.replace("<div>" + html + "</div>","\n"," ");
	dom = js.JQuery(html1);
	var $module = { name : StringTools.trim(dom.find(".banner h2").first().text()), href : js_node_Path.basename(js_node_Path.dirname(path))};
	process.stdout.write("extract module: " + $module.name);
	process.stdout.write("\n");
	Main.modules.push($module);
	$module.methods = [];
	$module.properties = [];
	$module.enums = [];
	var code = StringTools.trim(dom.find(".page-content .highlight pre code").first().text());
	if(code.indexOf("= new " + $module.name + "();") != -1) $module.has_constructor = true;
	dom.find(".page-content h2").each(function(index,el) {
		var h2 = js.JQuery(el);
		var a = h2.find("a").first();
		var prefix_span = h2.find("span").first();
		var tag_async = h2.find(".tags .async");
		var tag_enum = h2.find(".tags .enum");
		if(StringTools.trim(h2.text()) == "Instance Variables") {
			var table = Main.next_of_type_before(h2,"table","h2");
			table.find("tbody tr").each(function(index1,el1) {
				var td0;
				var html2 = js.JQuery(el1).find("td").get(0);
				td0 = js.JQuery(html2);
				var td1;
				var html3 = js.JQuery(el1).find("td").get(1);
				td1 = js.JQuery(html3);
				var property = { name : StringTools.trim(td0.text()), type : StringTools.trim(td1.text())};
				$module.properties.push(property);
			});
		} else if(tag_enum.length == 0) {
			var type = null;
			var description = null;
			var args = [];
			var table1 = Main.next_of_type_before(h2,"table","h2");
			while(table1.length > 0) {
				if(StringTools.trim(table1.find("thead tr th").first().text()) == "Parameters") table1.find("tbody tr").each(function(index2,el2) {
					var td01;
					var html4 = js.JQuery(el2).find("td").get(0);
					td01 = js.JQuery(html4);
					var td11;
					var html5 = js.JQuery(el2).find("td").get(1);
					td11 = js.JQuery(html5);
					args.push({ name : StringTools.trim(StringTools.replace(StringTools.replace(td01.text(),"[",""),"]","")), type : StringTools.trim(td11.text()), is_optional : td01.text().indexOf("[") != -1});
				}); else if(StringTools.trim(table1.find("thead tr th").first().text()) == "Returns") table1.find("tbody tr").each(function(index3,el3) {
					var td02;
					var html6 = js.JQuery(el3).find("td").get(0);
					td02 = js.JQuery(html6);
					var td12;
					var html7 = js.JQuery(el3).find("td").get(1);
					td12 = js.JQuery(html7);
					type = StringTools.trim(td02.text());
					description = StringTools.trim(td12.text());
					if(description.length == 0) description = null;
				});
				table1 = Main.next_of_type_before(table1,"table","h2");
			}
			var method = { name : a.attr("name"), type : type, args : args, is_static : !StringTools.endsWith(StringTools.trim(prefix_span.text()),"#"), is_async : tag_async.length > 0};
			$module.methods.push(method);
		} else {
			var flags = [];
			var table2 = Main.next_of_type_before(h2,"table","h2");
			if(StringTools.trim(table2.find("thead tr th").first().text()) == "Flag") table2.find("tbody tr").each(function(index4,el4) {
				var td03;
				var html8 = js.JQuery(el4).find("td").get(0);
				td03 = js.JQuery(html8);
				var td13;
				var html9 = js.JQuery(el4).find("td").get(1);
				td13 = js.JQuery(html9);
				flags.push({ name : (function($this) {
					var $r;
					var _this = StringTools.trim(td03.text());
					var pos = StringTools.trim(td03.text()).lastIndexOf(".") + 1;
					$r = HxOverrides.substr(_this,pos,null);
					return $r;
				}(this)), value : Std.parseInt(StringTools.trim(td13.text()))});
			});
			var enum_ = { name : a.attr("name"), flags : flags};
			$module.enums.push(enum_);
		}
	});
};
Main.next_of_type_before = function(el,type,stop) {
	var orig_el = el;
	while(true) {
		if(el.next(stop).length > 0) return orig_el.next(type);
		var target_el = el.next(type);
		if(target_el.length > 0) return target_el;
		el = el.next();
		if(el.length == 0) return orig_el.next(type);
	}
	return orig_el.next(type);
};
Main.convert_to_haxe = function() {
	if(!sys_FileSystem.exists(Main.haxe_code_path)) sys_FileSystem.createDirectory(Main.haxe_code_path);
	var _g = 0;
	var _g1 = Main.modules;
	while(_g < _g1.length) {
		var $module = _g1[_g];
		++_g;
		Main.module_types.set($module.name,true);
	}
	var printer = new haxe_macro_Printer();
	var _g2 = 0;
	var _g11 = Main.modules;
	while(_g2 < _g11.length) {
		var module1 = _g11[_g2];
		++_g2;
		process.stdout.write("convert: nodegit." + module1.name);
		process.stdout.write("\n");
		var fields = [];
		var _g21 = 0;
		var _g3 = module1.properties;
		while(_g21 < _g3.length) {
			var property = _g3[_g21];
			++_g21;
			fields.push(Main.convert_property(property));
		}
		if(module1.has_constructor) fields.push({ pos : Main.pos, name : "new", kind : haxe_macro_FieldType.FFun({ args : [], ret : null, expr : null}), access : []});
		var _g22 = 0;
		var _g31 = module1.methods;
		while(_g22 < _g31.length) {
			var method = _g31[_g22];
			++_g22;
			fields.push(Main.convert_method(method));
		}
		var _g23 = 0;
		var _g32 = module1.enums;
		while(_g23 < _g32.length) {
			var enum_ = _g32[_g23];
			++_g23;
			fields.push(Main.convert_enum_property(enum_,module1));
		}
		var output = printer.printTypeDefinition({ pos : Main.pos, pack : ["nodegit"], name : module1.name, isExtern : true, kind : haxe_macro_TypeDefKind.TDClass(null), fields : fields, meta : [{ name : ":jsRequire", params : [{ expr : haxe_macro_ExprDef.EConst(haxe_macro_Constant.CString("nodegit")), pos : Main.pos},{ expr : haxe_macro_ExprDef.EConst(haxe_macro_Constant.CString(module1.name)), pos : Main.pos}], pos : Main.pos}]},true);
		var _g24 = 0;
		var _g33 = module1.enums;
		while(_g24 < _g33.length) {
			var enum_1 = _g33[_g24];
			++_g24;
			output += "\n" + printer.printTypeDefinition(Main.convert_enum_class(enum_1,module1),false);
		}
		sys_io_File.saveContent(js_node_Path.join(Main.haxe_code_path,module1.name + ".hx"),output);
	}
};
Main.convert_property = function(property) {
	return { pos : Main.pos, name : property.name, kind : haxe_macro_FieldType.FVar(Main.convert_type(property.type,{ allow_void : true, is_async : false})), access : property.is_static?[haxe_macro_Access.AStatic]:[]};
};
Main.convert_method = function(method) {
	var args = [];
	var _g = 0;
	var _g1 = method.args;
	while(_g < _g1.length) {
		var arg = _g1[_g];
		++_g;
		args.push({ name : arg.name, type : Main.convert_type(arg.type,{ allow_void : false, is_async : false}), opt : arg.is_optional});
	}
	return { pos : Main.pos, name : method.name, kind : haxe_macro_FieldType.FFun({ args : args, ret : Main.convert_type(method.type,{ allow_void : true, is_async : method.is_async}), expr : null}), access : method.is_static?[haxe_macro_Access.AStatic]:[]};
};
Main.convert_enum_property = function(enum_,module) {
	return { pos : Main.pos, name : enum_.name, kind : haxe_macro_FieldType.FProp("default","null",haxe_macro_ComplexType.TPath({ pack : [], name : module.name + Main.camelize(enum_.name)})), access : [haxe_macro_Access.AStatic]};
};
Main.convert_enum_class = function(enum_,module) {
	var fields = [];
	var _g = 0;
	var _g1 = enum_.flags;
	while(_g < _g1.length) {
		var flag = _g1[_g];
		++_g;
		fields.push({ pos : Main.pos, name : flag.name, kind : haxe_macro_FieldType.FProp("default","null",haxe_macro_ComplexType.TPath({ pack : [], name : "Int", params : []}),{ expr : haxe_macro_ExprDef.EConst(haxe_macro_Constant.CInt("" + flag.value)), pos : Main.pos}), access : []});
	}
	return { pos : Main.pos, pack : ["nodegit"], name : module.name + Main.camelize(enum_.name), isExtern : true, kind : haxe_macro_TypeDefKind.TDClass(null), fields : fields, meta : []};
};
Main.convert_type = function(raw_type,options) {
	if(raw_type == null) {
		if(options.allow_void) {
			if(options.is_async) return haxe_macro_ComplexType.TPath({ pack : ["js"], name : "Promise", params : [haxe_macro_TypeParam.TPType(haxe_macro_ComplexType.TPath({ pack : [], name : "Void", params : []}))]}); else return haxe_macro_ComplexType.TPath({ pack : [], name : "Void", params : []});
		} else if(options.is_async) return haxe_macro_ComplexType.TPath({ pack : ["js"], name : "Promise", params : [haxe_macro_TypeParam.TPType(haxe_macro_ComplexType.TPath({ pack : [], name : "Dynamic", params : []}))]}); else return haxe_macro_ComplexType.TPath({ pack : [], name : "Dynamic", params : []});
	} else switch(raw_type) {
	case "String":
		if(options.is_async) return haxe_macro_ComplexType.TPath({ pack : ["js"], name : "Promise", params : [haxe_macro_TypeParam.TPType(haxe_macro_ComplexType.TPath({ pack : [], name : "String", params : []}))]}); else return haxe_macro_ComplexType.TPath({ pack : [], name : "String", params : []});
		break;
	case "Bool":case "Boolean":case "bool":case "boolean":
		if(options.is_async) return haxe_macro_ComplexType.TPath({ pack : ["js"], name : "Promise", params : [haxe_macro_TypeParam.TPType(haxe_macro_ComplexType.TPath({ pack : [], name : "Bool", params : []}))]}); else return haxe_macro_ComplexType.TPath({ pack : [], name : "Bool", params : []});
		break;
	case "Number":
		if(options.is_async) return haxe_macro_ComplexType.TPath({ pack : ["js"], name : "Promise", params : [haxe_macro_TypeParam.TPType(haxe_macro_ComplexType.TPath({ pack : [], name : "Float", params : []}))]}); else return haxe_macro_ComplexType.TPath({ pack : [], name : "Float", params : []});
		break;
	case "Integer":case "int":
		if(options.is_async) return haxe_macro_ComplexType.TPath({ pack : ["js"], name : "Promise", params : [haxe_macro_TypeParam.TPType(haxe_macro_ComplexType.TPath({ pack : [], name : "Int", params : []}))]}); else return haxe_macro_ComplexType.TPath({ pack : [], name : "Int", params : []});
		break;
	case "Array":
		if(options.is_async) return haxe_macro_ComplexType.TPath({ pack : ["js"], name : "Promise", params : [haxe_macro_TypeParam.TPType(haxe_macro_ComplexType.TPath({ pack : [], name : "Array", params : [haxe_macro_TypeParam.TPType(haxe_macro_ComplexType.TPath({ pack : [], name : "Dynamic", params : []}))]}))]}); else return haxe_macro_ComplexType.TPath({ pack : [], name : "Array", params : [haxe_macro_TypeParam.TPType(haxe_macro_ComplexType.TPath({ pack : [], name : "Dynamic", params : []}))]});
		break;
	default:
		if(StringTools.startsWith(raw_type,"Array<")) {
			var collection_type = raw_type.substring(6,raw_type.lastIndexOf(">"));
			if(Main.module_types.exists(collection_type)) {
				if(options.is_async) return haxe_macro_ComplexType.TPath({ pack : ["js"], name : "Promise", params : [haxe_macro_TypeParam.TPType(haxe_macro_ComplexType.TPath({ pack : ["nodegit"], name : raw_type}))]}); else return haxe_macro_ComplexType.TPath({ pack : ["nodegit"], name : raw_type});
			} else switch(collection_type) {
			case "String":
				if(options.is_async) return haxe_macro_ComplexType.TPath({ pack : ["js"], name : "Promise", params : [haxe_macro_TypeParam.TPType(haxe_macro_ComplexType.TPath({ pack : [], name : "Array", params : [haxe_macro_TypeParam.TPType(haxe_macro_ComplexType.TPath({ pack : [], name : "String", params : []}))]}))]}); else return haxe_macro_ComplexType.TPath({ pack : [], name : "Array", params : [haxe_macro_TypeParam.TPType(haxe_macro_ComplexType.TPath({ pack : [], name : "String", params : []}))]});
				break;
			case "Bool":case "Boolean":case "bool":case "boolean":
				if(options.is_async) return haxe_macro_ComplexType.TPath({ pack : ["js"], name : "Promise", params : [haxe_macro_TypeParam.TPType(haxe_macro_ComplexType.TPath({ pack : [], name : "Array", params : [haxe_macro_TypeParam.TPType(haxe_macro_ComplexType.TPath({ pack : [], name : "Bool", params : []}))]}))]}); else return haxe_macro_ComplexType.TPath({ pack : [], name : "Array", params : [haxe_macro_TypeParam.TPType(haxe_macro_ComplexType.TPath({ pack : [], name : "Bool", params : []}))]});
				break;
			case "Number":
				if(options.is_async) return haxe_macro_ComplexType.TPath({ pack : ["js"], name : "Promise", params : [haxe_macro_TypeParam.TPType(haxe_macro_ComplexType.TPath({ pack : [], name : "Array", params : [haxe_macro_TypeParam.TPType(haxe_macro_ComplexType.TPath({ pack : [], name : "Float", params : []}))]}))]}); else return haxe_macro_ComplexType.TPath({ pack : [], name : "Array", params : [haxe_macro_TypeParam.TPType(haxe_macro_ComplexType.TPath({ pack : [], name : "Float", params : []}))]});
				break;
			case "Integer":case "int":
				if(options.is_async) return haxe_macro_ComplexType.TPath({ pack : ["js"], name : "Promise", params : [haxe_macro_TypeParam.TPType(haxe_macro_ComplexType.TPath({ pack : [], name : "Array", params : [haxe_macro_TypeParam.TPType(haxe_macro_ComplexType.TPath({ pack : [], name : "Int", params : []}))]}))]}); else return haxe_macro_ComplexType.TPath({ pack : [], name : "Array", params : [haxe_macro_TypeParam.TPType(haxe_macro_ComplexType.TPath({ pack : [], name : "Int", params : []}))]});
				break;
			default:
				if(options.is_async) return haxe_macro_ComplexType.TPath({ pack : ["js"], name : "Promise", params : [haxe_macro_TypeParam.TPType(haxe_macro_ComplexType.TPath({ pack : [], name : "Array", params : [haxe_macro_TypeParam.TPType(haxe_macro_ComplexType.TPath({ pack : [], name : "Dynamic", params : []}))]}))]}); else return haxe_macro_ComplexType.TPath({ pack : [], name : "Array", params : [haxe_macro_TypeParam.TPType(haxe_macro_ComplexType.TPath({ pack : [], name : "Dynamic", params : []}))]});
			}
		} else if(Main.module_types.exists(raw_type)) {
			if(options.is_async) return haxe_macro_ComplexType.TPath({ pack : ["js"], name : "Promise", params : [haxe_macro_TypeParam.TPType(haxe_macro_ComplexType.TPath({ pack : ["nodegit"], name : raw_type}))]}); else return haxe_macro_ComplexType.TPath({ pack : ["nodegit"], name : raw_type});
		} else if(options.is_async) return haxe_macro_ComplexType.TPath({ pack : ["js"], name : "Promise", params : [haxe_macro_TypeParam.TPType(haxe_macro_ComplexType.TPath({ pack : [], name : "Dynamic", params : []}))]}); else return haxe_macro_ComplexType.TPath({ pack : [], name : "Dynamic", params : []});
	}
};
Main.camelize = function(str) {
	str = str.toLowerCase();
	str = new EReg("(?:^|[-_])(\\w)","g").map(str,function(regex) {
		var c = regex.matched(1);
		if(c != null && c.length > 0) return c.toUpperCase();
		return "";
	});
	return str;
};
Math.__name__ = true;
var Std = function() { };
Std.__name__ = true;
Std.string = function(s) {
	return js_Boot.__string_rec(s,"");
};
Std.parseInt = function(x) {
	var v = parseInt(x,10);
	if(v == 0 && (HxOverrides.cca(x,1) == 120 || HxOverrides.cca(x,1) == 88)) v = parseInt(x);
	if(isNaN(v)) return null;
	return v;
};
var StringBuf = function() {
	this.b = "";
};
StringBuf.__name__ = true;
StringBuf.prototype = {
	add: function(x) {
		this.b += Std.string(x);
	}
	,__class__: StringBuf
};
var StringTools = function() { };
StringTools.__name__ = true;
StringTools.startsWith = function(s,start) {
	return s.length >= start.length && HxOverrides.substr(s,0,start.length) == start;
};
StringTools.endsWith = function(s,end) {
	var elen = end.length;
	var slen = s.length;
	return slen >= elen && HxOverrides.substr(s,slen - elen,elen) == end;
};
StringTools.isSpace = function(s,pos) {
	var c = HxOverrides.cca(s,pos);
	return c > 8 && c < 14 || c == 32;
};
StringTools.ltrim = function(s) {
	var l = s.length;
	var r = 0;
	while(r < l && StringTools.isSpace(s,r)) r++;
	if(r > 0) return HxOverrides.substr(s,r,l - r); else return s;
};
StringTools.rtrim = function(s) {
	var l = s.length;
	var r = 0;
	while(r < l && StringTools.isSpace(s,l - r - 1)) r++;
	if(r > 0) return HxOverrides.substr(s,0,l - r); else return s;
};
StringTools.trim = function(s) {
	return StringTools.ltrim(StringTools.rtrim(s));
};
StringTools.replace = function(s,sub,by) {
	return s.split(sub).join(by);
};
var haxe_IMap = function() { };
haxe_IMap.__name__ = true;
var haxe__$Int64__$_$_$Int64 = function(high,low) {
	this.high = high;
	this.low = low;
};
haxe__$Int64__$_$_$Int64.__name__ = true;
haxe__$Int64__$_$_$Int64.prototype = {
	__class__: haxe__$Int64__$_$_$Int64
};
var haxe_ds_StringMap = function() {
	this.h = { };
};
haxe_ds_StringMap.__name__ = true;
haxe_ds_StringMap.__interfaces__ = [haxe_IMap];
haxe_ds_StringMap.prototype = {
	set: function(key,value) {
		if(__map_reserved[key] != null) this.setReserved(key,value); else this.h[key] = value;
	}
	,exists: function(key) {
		if(__map_reserved[key] != null) return this.existsReserved(key);
		return this.h.hasOwnProperty(key);
	}
	,setReserved: function(key,value) {
		if(this.rh == null) this.rh = { };
		this.rh["$" + key] = value;
	}
	,existsReserved: function(key) {
		if(this.rh == null) return false;
		return this.rh.hasOwnProperty("$" + key);
	}
	,__class__: haxe_ds_StringMap
};
var haxe_io_Error = { __ename__ : true, __constructs__ : ["Blocked","Overflow","OutsideBounds","Custom"] };
haxe_io_Error.Blocked = ["Blocked",0];
haxe_io_Error.Blocked.toString = $estr;
haxe_io_Error.Blocked.__enum__ = haxe_io_Error;
haxe_io_Error.Overflow = ["Overflow",1];
haxe_io_Error.Overflow.toString = $estr;
haxe_io_Error.Overflow.__enum__ = haxe_io_Error;
haxe_io_Error.OutsideBounds = ["OutsideBounds",2];
haxe_io_Error.OutsideBounds.toString = $estr;
haxe_io_Error.OutsideBounds.__enum__ = haxe_io_Error;
haxe_io_Error.Custom = function(e) { var $x = ["Custom",3,e]; $x.__enum__ = haxe_io_Error; $x.toString = $estr; return $x; };
var haxe_io_FPHelper = function() { };
haxe_io_FPHelper.__name__ = true;
haxe_io_FPHelper.i32ToFloat = function(i) {
	var sign = 1 - (i >>> 31 << 1);
	var exp = i >>> 23 & 255;
	var sig = i & 8388607;
	if(sig == 0 && exp == 0) return 0.0;
	return sign * (1 + Math.pow(2,-23) * sig) * Math.pow(2,exp - 127);
};
haxe_io_FPHelper.floatToI32 = function(f) {
	if(f == 0) return 0;
	var af;
	if(f < 0) af = -f; else af = f;
	var exp = Math.floor(Math.log(af) / 0.6931471805599453);
	if(exp < -127) exp = -127; else if(exp > 128) exp = 128;
	var sig = Math.round((af / Math.pow(2,exp) - 1) * 8388608) & 8388607;
	return (f < 0?-2147483648:0) | exp + 127 << 23 | sig;
};
haxe_io_FPHelper.i64ToDouble = function(low,high) {
	var sign = 1 - (high >>> 31 << 1);
	var exp = (high >> 20 & 2047) - 1023;
	var sig = (high & 1048575) * 4294967296. + (low >>> 31) * 2147483648. + (low & 2147483647);
	if(sig == 0 && exp == -1023) return 0.0;
	return sign * (1.0 + Math.pow(2,-52) * sig) * Math.pow(2,exp);
};
haxe_io_FPHelper.doubleToI64 = function(v) {
	var i64 = haxe_io_FPHelper.i64tmp;
	if(v == 0) {
		i64.low = 0;
		i64.high = 0;
	} else {
		var av;
		if(v < 0) av = -v; else av = v;
		var exp = Math.floor(Math.log(av) / 0.6931471805599453);
		var sig;
		var v1 = (av / Math.pow(2,exp) - 1) * 4503599627370496.;
		sig = Math.round(v1);
		var sig_l = sig | 0;
		var sig_h = sig / 4294967296.0 | 0;
		i64.low = sig_l;
		i64.high = (v < 0?-2147483648:0) | exp + 1023 << 20 | sig_h;
	}
	return i64;
};
var haxe_macro_Constant = { __ename__ : true, __constructs__ : ["CInt","CFloat","CString","CIdent","CRegexp"] };
haxe_macro_Constant.CInt = function(v) { var $x = ["CInt",0,v]; $x.__enum__ = haxe_macro_Constant; $x.toString = $estr; return $x; };
haxe_macro_Constant.CFloat = function(f) { var $x = ["CFloat",1,f]; $x.__enum__ = haxe_macro_Constant; $x.toString = $estr; return $x; };
haxe_macro_Constant.CString = function(s) { var $x = ["CString",2,s]; $x.__enum__ = haxe_macro_Constant; $x.toString = $estr; return $x; };
haxe_macro_Constant.CIdent = function(s) { var $x = ["CIdent",3,s]; $x.__enum__ = haxe_macro_Constant; $x.toString = $estr; return $x; };
haxe_macro_Constant.CRegexp = function(r,opt) { var $x = ["CRegexp",4,r,opt]; $x.__enum__ = haxe_macro_Constant; $x.toString = $estr; return $x; };
var haxe_macro_Binop = { __ename__ : true, __constructs__ : ["OpAdd","OpMult","OpDiv","OpSub","OpAssign","OpEq","OpNotEq","OpGt","OpGte","OpLt","OpLte","OpAnd","OpOr","OpXor","OpBoolAnd","OpBoolOr","OpShl","OpShr","OpUShr","OpMod","OpAssignOp","OpInterval","OpArrow"] };
haxe_macro_Binop.OpAdd = ["OpAdd",0];
haxe_macro_Binop.OpAdd.toString = $estr;
haxe_macro_Binop.OpAdd.__enum__ = haxe_macro_Binop;
haxe_macro_Binop.OpMult = ["OpMult",1];
haxe_macro_Binop.OpMult.toString = $estr;
haxe_macro_Binop.OpMult.__enum__ = haxe_macro_Binop;
haxe_macro_Binop.OpDiv = ["OpDiv",2];
haxe_macro_Binop.OpDiv.toString = $estr;
haxe_macro_Binop.OpDiv.__enum__ = haxe_macro_Binop;
haxe_macro_Binop.OpSub = ["OpSub",3];
haxe_macro_Binop.OpSub.toString = $estr;
haxe_macro_Binop.OpSub.__enum__ = haxe_macro_Binop;
haxe_macro_Binop.OpAssign = ["OpAssign",4];
haxe_macro_Binop.OpAssign.toString = $estr;
haxe_macro_Binop.OpAssign.__enum__ = haxe_macro_Binop;
haxe_macro_Binop.OpEq = ["OpEq",5];
haxe_macro_Binop.OpEq.toString = $estr;
haxe_macro_Binop.OpEq.__enum__ = haxe_macro_Binop;
haxe_macro_Binop.OpNotEq = ["OpNotEq",6];
haxe_macro_Binop.OpNotEq.toString = $estr;
haxe_macro_Binop.OpNotEq.__enum__ = haxe_macro_Binop;
haxe_macro_Binop.OpGt = ["OpGt",7];
haxe_macro_Binop.OpGt.toString = $estr;
haxe_macro_Binop.OpGt.__enum__ = haxe_macro_Binop;
haxe_macro_Binop.OpGte = ["OpGte",8];
haxe_macro_Binop.OpGte.toString = $estr;
haxe_macro_Binop.OpGte.__enum__ = haxe_macro_Binop;
haxe_macro_Binop.OpLt = ["OpLt",9];
haxe_macro_Binop.OpLt.toString = $estr;
haxe_macro_Binop.OpLt.__enum__ = haxe_macro_Binop;
haxe_macro_Binop.OpLte = ["OpLte",10];
haxe_macro_Binop.OpLte.toString = $estr;
haxe_macro_Binop.OpLte.__enum__ = haxe_macro_Binop;
haxe_macro_Binop.OpAnd = ["OpAnd",11];
haxe_macro_Binop.OpAnd.toString = $estr;
haxe_macro_Binop.OpAnd.__enum__ = haxe_macro_Binop;
haxe_macro_Binop.OpOr = ["OpOr",12];
haxe_macro_Binop.OpOr.toString = $estr;
haxe_macro_Binop.OpOr.__enum__ = haxe_macro_Binop;
haxe_macro_Binop.OpXor = ["OpXor",13];
haxe_macro_Binop.OpXor.toString = $estr;
haxe_macro_Binop.OpXor.__enum__ = haxe_macro_Binop;
haxe_macro_Binop.OpBoolAnd = ["OpBoolAnd",14];
haxe_macro_Binop.OpBoolAnd.toString = $estr;
haxe_macro_Binop.OpBoolAnd.__enum__ = haxe_macro_Binop;
haxe_macro_Binop.OpBoolOr = ["OpBoolOr",15];
haxe_macro_Binop.OpBoolOr.toString = $estr;
haxe_macro_Binop.OpBoolOr.__enum__ = haxe_macro_Binop;
haxe_macro_Binop.OpShl = ["OpShl",16];
haxe_macro_Binop.OpShl.toString = $estr;
haxe_macro_Binop.OpShl.__enum__ = haxe_macro_Binop;
haxe_macro_Binop.OpShr = ["OpShr",17];
haxe_macro_Binop.OpShr.toString = $estr;
haxe_macro_Binop.OpShr.__enum__ = haxe_macro_Binop;
haxe_macro_Binop.OpUShr = ["OpUShr",18];
haxe_macro_Binop.OpUShr.toString = $estr;
haxe_macro_Binop.OpUShr.__enum__ = haxe_macro_Binop;
haxe_macro_Binop.OpMod = ["OpMod",19];
haxe_macro_Binop.OpMod.toString = $estr;
haxe_macro_Binop.OpMod.__enum__ = haxe_macro_Binop;
haxe_macro_Binop.OpAssignOp = function(op) { var $x = ["OpAssignOp",20,op]; $x.__enum__ = haxe_macro_Binop; $x.toString = $estr; return $x; };
haxe_macro_Binop.OpInterval = ["OpInterval",21];
haxe_macro_Binop.OpInterval.toString = $estr;
haxe_macro_Binop.OpInterval.__enum__ = haxe_macro_Binop;
haxe_macro_Binop.OpArrow = ["OpArrow",22];
haxe_macro_Binop.OpArrow.toString = $estr;
haxe_macro_Binop.OpArrow.__enum__ = haxe_macro_Binop;
var haxe_macro_Unop = { __ename__ : true, __constructs__ : ["OpIncrement","OpDecrement","OpNot","OpNeg","OpNegBits"] };
haxe_macro_Unop.OpIncrement = ["OpIncrement",0];
haxe_macro_Unop.OpIncrement.toString = $estr;
haxe_macro_Unop.OpIncrement.__enum__ = haxe_macro_Unop;
haxe_macro_Unop.OpDecrement = ["OpDecrement",1];
haxe_macro_Unop.OpDecrement.toString = $estr;
haxe_macro_Unop.OpDecrement.__enum__ = haxe_macro_Unop;
haxe_macro_Unop.OpNot = ["OpNot",2];
haxe_macro_Unop.OpNot.toString = $estr;
haxe_macro_Unop.OpNot.__enum__ = haxe_macro_Unop;
haxe_macro_Unop.OpNeg = ["OpNeg",3];
haxe_macro_Unop.OpNeg.toString = $estr;
haxe_macro_Unop.OpNeg.__enum__ = haxe_macro_Unop;
haxe_macro_Unop.OpNegBits = ["OpNegBits",4];
haxe_macro_Unop.OpNegBits.toString = $estr;
haxe_macro_Unop.OpNegBits.__enum__ = haxe_macro_Unop;
var haxe_macro_ExprDef = { __ename__ : true, __constructs__ : ["EConst","EArray","EBinop","EField","EParenthesis","EObjectDecl","EArrayDecl","ECall","ENew","EUnop","EVars","EFunction","EBlock","EFor","EIn","EIf","EWhile","ESwitch","ETry","EReturn","EBreak","EContinue","EUntyped","EThrow","ECast","EDisplay","EDisplayNew","ETernary","ECheckType","EMeta"] };
haxe_macro_ExprDef.EConst = function(c) { var $x = ["EConst",0,c]; $x.__enum__ = haxe_macro_ExprDef; $x.toString = $estr; return $x; };
haxe_macro_ExprDef.EArray = function(e1,e2) { var $x = ["EArray",1,e1,e2]; $x.__enum__ = haxe_macro_ExprDef; $x.toString = $estr; return $x; };
haxe_macro_ExprDef.EBinop = function(op,e1,e2) { var $x = ["EBinop",2,op,e1,e2]; $x.__enum__ = haxe_macro_ExprDef; $x.toString = $estr; return $x; };
haxe_macro_ExprDef.EField = function(e,field) { var $x = ["EField",3,e,field]; $x.__enum__ = haxe_macro_ExprDef; $x.toString = $estr; return $x; };
haxe_macro_ExprDef.EParenthesis = function(e) { var $x = ["EParenthesis",4,e]; $x.__enum__ = haxe_macro_ExprDef; $x.toString = $estr; return $x; };
haxe_macro_ExprDef.EObjectDecl = function(fields) { var $x = ["EObjectDecl",5,fields]; $x.__enum__ = haxe_macro_ExprDef; $x.toString = $estr; return $x; };
haxe_macro_ExprDef.EArrayDecl = function(values) { var $x = ["EArrayDecl",6,values]; $x.__enum__ = haxe_macro_ExprDef; $x.toString = $estr; return $x; };
haxe_macro_ExprDef.ECall = function(e,params) { var $x = ["ECall",7,e,params]; $x.__enum__ = haxe_macro_ExprDef; $x.toString = $estr; return $x; };
haxe_macro_ExprDef.ENew = function(t,params) { var $x = ["ENew",8,t,params]; $x.__enum__ = haxe_macro_ExprDef; $x.toString = $estr; return $x; };
haxe_macro_ExprDef.EUnop = function(op,postFix,e) { var $x = ["EUnop",9,op,postFix,e]; $x.__enum__ = haxe_macro_ExprDef; $x.toString = $estr; return $x; };
haxe_macro_ExprDef.EVars = function(vars) { var $x = ["EVars",10,vars]; $x.__enum__ = haxe_macro_ExprDef; $x.toString = $estr; return $x; };
haxe_macro_ExprDef.EFunction = function(name,f) { var $x = ["EFunction",11,name,f]; $x.__enum__ = haxe_macro_ExprDef; $x.toString = $estr; return $x; };
haxe_macro_ExprDef.EBlock = function(exprs) { var $x = ["EBlock",12,exprs]; $x.__enum__ = haxe_macro_ExprDef; $x.toString = $estr; return $x; };
haxe_macro_ExprDef.EFor = function(it,expr) { var $x = ["EFor",13,it,expr]; $x.__enum__ = haxe_macro_ExprDef; $x.toString = $estr; return $x; };
haxe_macro_ExprDef.EIn = function(e1,e2) { var $x = ["EIn",14,e1,e2]; $x.__enum__ = haxe_macro_ExprDef; $x.toString = $estr; return $x; };
haxe_macro_ExprDef.EIf = function(econd,eif,eelse) { var $x = ["EIf",15,econd,eif,eelse]; $x.__enum__ = haxe_macro_ExprDef; $x.toString = $estr; return $x; };
haxe_macro_ExprDef.EWhile = function(econd,e,normalWhile) { var $x = ["EWhile",16,econd,e,normalWhile]; $x.__enum__ = haxe_macro_ExprDef; $x.toString = $estr; return $x; };
haxe_macro_ExprDef.ESwitch = function(e,cases,edef) { var $x = ["ESwitch",17,e,cases,edef]; $x.__enum__ = haxe_macro_ExprDef; $x.toString = $estr; return $x; };
haxe_macro_ExprDef.ETry = function(e,catches) { var $x = ["ETry",18,e,catches]; $x.__enum__ = haxe_macro_ExprDef; $x.toString = $estr; return $x; };
haxe_macro_ExprDef.EReturn = function(e) { var $x = ["EReturn",19,e]; $x.__enum__ = haxe_macro_ExprDef; $x.toString = $estr; return $x; };
haxe_macro_ExprDef.EBreak = ["EBreak",20];
haxe_macro_ExprDef.EBreak.toString = $estr;
haxe_macro_ExprDef.EBreak.__enum__ = haxe_macro_ExprDef;
haxe_macro_ExprDef.EContinue = ["EContinue",21];
haxe_macro_ExprDef.EContinue.toString = $estr;
haxe_macro_ExprDef.EContinue.__enum__ = haxe_macro_ExprDef;
haxe_macro_ExprDef.EUntyped = function(e) { var $x = ["EUntyped",22,e]; $x.__enum__ = haxe_macro_ExprDef; $x.toString = $estr; return $x; };
haxe_macro_ExprDef.EThrow = function(e) { var $x = ["EThrow",23,e]; $x.__enum__ = haxe_macro_ExprDef; $x.toString = $estr; return $x; };
haxe_macro_ExprDef.ECast = function(e,t) { var $x = ["ECast",24,e,t]; $x.__enum__ = haxe_macro_ExprDef; $x.toString = $estr; return $x; };
haxe_macro_ExprDef.EDisplay = function(e,isCall) { var $x = ["EDisplay",25,e,isCall]; $x.__enum__ = haxe_macro_ExprDef; $x.toString = $estr; return $x; };
haxe_macro_ExprDef.EDisplayNew = function(t) { var $x = ["EDisplayNew",26,t]; $x.__enum__ = haxe_macro_ExprDef; $x.toString = $estr; return $x; };
haxe_macro_ExprDef.ETernary = function(econd,eif,eelse) { var $x = ["ETernary",27,econd,eif,eelse]; $x.__enum__ = haxe_macro_ExprDef; $x.toString = $estr; return $x; };
haxe_macro_ExprDef.ECheckType = function(e,t) { var $x = ["ECheckType",28,e,t]; $x.__enum__ = haxe_macro_ExprDef; $x.toString = $estr; return $x; };
haxe_macro_ExprDef.EMeta = function(s,e) { var $x = ["EMeta",29,s,e]; $x.__enum__ = haxe_macro_ExprDef; $x.toString = $estr; return $x; };
var haxe_macro_ComplexType = { __ename__ : true, __constructs__ : ["TPath","TFunction","TAnonymous","TParent","TExtend","TOptional"] };
haxe_macro_ComplexType.TPath = function(p) { var $x = ["TPath",0,p]; $x.__enum__ = haxe_macro_ComplexType; $x.toString = $estr; return $x; };
haxe_macro_ComplexType.TFunction = function(args,ret) { var $x = ["TFunction",1,args,ret]; $x.__enum__ = haxe_macro_ComplexType; $x.toString = $estr; return $x; };
haxe_macro_ComplexType.TAnonymous = function(fields) { var $x = ["TAnonymous",2,fields]; $x.__enum__ = haxe_macro_ComplexType; $x.toString = $estr; return $x; };
haxe_macro_ComplexType.TParent = function(t) { var $x = ["TParent",3,t]; $x.__enum__ = haxe_macro_ComplexType; $x.toString = $estr; return $x; };
haxe_macro_ComplexType.TExtend = function(p,fields) { var $x = ["TExtend",4,p,fields]; $x.__enum__ = haxe_macro_ComplexType; $x.toString = $estr; return $x; };
haxe_macro_ComplexType.TOptional = function(t) { var $x = ["TOptional",5,t]; $x.__enum__ = haxe_macro_ComplexType; $x.toString = $estr; return $x; };
var haxe_macro_TypeParam = { __ename__ : true, __constructs__ : ["TPType","TPExpr"] };
haxe_macro_TypeParam.TPType = function(t) { var $x = ["TPType",0,t]; $x.__enum__ = haxe_macro_TypeParam; $x.toString = $estr; return $x; };
haxe_macro_TypeParam.TPExpr = function(e) { var $x = ["TPExpr",1,e]; $x.__enum__ = haxe_macro_TypeParam; $x.toString = $estr; return $x; };
var haxe_macro_Access = { __ename__ : true, __constructs__ : ["APublic","APrivate","AStatic","AOverride","ADynamic","AInline","AMacro"] };
haxe_macro_Access.APublic = ["APublic",0];
haxe_macro_Access.APublic.toString = $estr;
haxe_macro_Access.APublic.__enum__ = haxe_macro_Access;
haxe_macro_Access.APrivate = ["APrivate",1];
haxe_macro_Access.APrivate.toString = $estr;
haxe_macro_Access.APrivate.__enum__ = haxe_macro_Access;
haxe_macro_Access.AStatic = ["AStatic",2];
haxe_macro_Access.AStatic.toString = $estr;
haxe_macro_Access.AStatic.__enum__ = haxe_macro_Access;
haxe_macro_Access.AOverride = ["AOverride",3];
haxe_macro_Access.AOverride.toString = $estr;
haxe_macro_Access.AOverride.__enum__ = haxe_macro_Access;
haxe_macro_Access.ADynamic = ["ADynamic",4];
haxe_macro_Access.ADynamic.toString = $estr;
haxe_macro_Access.ADynamic.__enum__ = haxe_macro_Access;
haxe_macro_Access.AInline = ["AInline",5];
haxe_macro_Access.AInline.toString = $estr;
haxe_macro_Access.AInline.__enum__ = haxe_macro_Access;
haxe_macro_Access.AMacro = ["AMacro",6];
haxe_macro_Access.AMacro.toString = $estr;
haxe_macro_Access.AMacro.__enum__ = haxe_macro_Access;
var haxe_macro_FieldType = { __ename__ : true, __constructs__ : ["FVar","FFun","FProp"] };
haxe_macro_FieldType.FVar = function(t,e) { var $x = ["FVar",0,t,e]; $x.__enum__ = haxe_macro_FieldType; $x.toString = $estr; return $x; };
haxe_macro_FieldType.FFun = function(f) { var $x = ["FFun",1,f]; $x.__enum__ = haxe_macro_FieldType; $x.toString = $estr; return $x; };
haxe_macro_FieldType.FProp = function(get,set,t,e) { var $x = ["FProp",2,get,set,t,e]; $x.__enum__ = haxe_macro_FieldType; $x.toString = $estr; return $x; };
var haxe_macro_TypeDefKind = { __ename__ : true, __constructs__ : ["TDEnum","TDStructure","TDClass","TDAlias","TDAbstract"] };
haxe_macro_TypeDefKind.TDEnum = ["TDEnum",0];
haxe_macro_TypeDefKind.TDEnum.toString = $estr;
haxe_macro_TypeDefKind.TDEnum.__enum__ = haxe_macro_TypeDefKind;
haxe_macro_TypeDefKind.TDStructure = ["TDStructure",1];
haxe_macro_TypeDefKind.TDStructure.toString = $estr;
haxe_macro_TypeDefKind.TDStructure.__enum__ = haxe_macro_TypeDefKind;
haxe_macro_TypeDefKind.TDClass = function(superClass,interfaces,isInterface) { var $x = ["TDClass",2,superClass,interfaces,isInterface]; $x.__enum__ = haxe_macro_TypeDefKind; $x.toString = $estr; return $x; };
haxe_macro_TypeDefKind.TDAlias = function(t) { var $x = ["TDAlias",3,t]; $x.__enum__ = haxe_macro_TypeDefKind; $x.toString = $estr; return $x; };
haxe_macro_TypeDefKind.TDAbstract = function(tthis,from,to) { var $x = ["TDAbstract",4,tthis,from,to]; $x.__enum__ = haxe_macro_TypeDefKind; $x.toString = $estr; return $x; };
var haxe_macro_Printer = function(tabString) {
	if(tabString == null) tabString = "\t";
	this.tabs = "";
	this.tabString = tabString;
};
haxe_macro_Printer.__name__ = true;
haxe_macro_Printer.prototype = {
	printUnop: function(op) {
		switch(op[1]) {
		case 0:
			return "++";
		case 1:
			return "--";
		case 2:
			return "!";
		case 3:
			return "-";
		case 4:
			return "~";
		}
	}
	,printBinop: function(op) {
		switch(op[1]) {
		case 0:
			return "+";
		case 1:
			return "*";
		case 2:
			return "/";
		case 3:
			return "-";
		case 4:
			return "=";
		case 5:
			return "==";
		case 6:
			return "!=";
		case 7:
			return ">";
		case 8:
			return ">=";
		case 9:
			return "<";
		case 10:
			return "<=";
		case 11:
			return "&";
		case 12:
			return "|";
		case 13:
			return "^";
		case 14:
			return "&&";
		case 15:
			return "||";
		case 16:
			return "<<";
		case 17:
			return ">>";
		case 18:
			return ">>>";
		case 19:
			return "%";
		case 21:
			return "...";
		case 22:
			return "=>";
		case 20:
			var op1 = op[2];
			return this.printBinop(op1) + "=";
		}
	}
	,escapeString: function(s,delim) {
		return delim + StringTools.replace(StringTools.replace(StringTools.replace(StringTools.replace(s,"\n","\\n"),"\t","\\t"),"'","\\'"),"\"","\\\"") + delim;
	}
	,printString: function(s) {
		return this.escapeString(s,"\"");
	}
	,printConstant: function(c) {
		switch(c[1]) {
		case 2:
			var s = c[2];
			return this.printString(s);
		case 3:
			var s1 = c[2];
			return s1;
		case 0:
			var s2 = c[2];
			return s2;
		case 1:
			var s3 = c[2];
			return s3;
		case 4:
			var opt = c[3];
			var s4 = c[2];
			return "~/" + s4 + "/" + opt;
		}
	}
	,printTypeParam: function(param) {
		switch(param[1]) {
		case 0:
			var ct = param[2];
			return this.printComplexType(ct);
		case 1:
			var e = param[2];
			return this.printExpr(e);
		}
	}
	,printTypePath: function(tp) {
		return (tp.pack.length > 0?tp.pack.join(".") + ".":"") + tp.name + (tp.sub != null?"." + tp.sub:"") + (tp.params == null?"":tp.params.length > 0?"<" + tp.params.map($bind(this,this.printTypeParam)).join(", ") + ">":"");
	}
	,printComplexType: function(ct) {
		switch(ct[1]) {
		case 0:
			var tp = ct[2];
			return this.printTypePath(tp);
		case 1:
			var ret = ct[3];
			var args = ct[2];
			return (args.length > 0?args.map($bind(this,this.printComplexType)).join(" -> "):"Void") + " -> " + this.printComplexType(ret);
		case 2:
			var fields = ct[2];
			return "{ " + ((function($this) {
				var $r;
				var _g = [];
				{
					var _g1 = 0;
					while(_g1 < fields.length) {
						var f = fields[_g1];
						++_g1;
						_g.push($this.printField(f) + "; ");
					}
				}
				$r = _g;
				return $r;
			}(this))).join("") + "}";
		case 3:
			var ct1 = ct[2];
			return "(" + this.printComplexType(ct1) + ")";
		case 5:
			var ct2 = ct[2];
			return "?" + this.printComplexType(ct2);
		case 4:
			var fields1 = ct[3];
			var tpl = ct[2];
			return "{> " + tpl.map($bind(this,this.printTypePath)).join(" >, ") + ", " + fields1.map($bind(this,this.printField)).join(", ") + " }";
		}
	}
	,printMetadata: function(meta) {
		return "@" + meta.name + (meta.params != null && meta.params.length > 0?"(" + this.printExprs(meta.params,", ") + ")":"");
	}
	,printAccess: function(access) {
		switch(access[1]) {
		case 2:
			return "static";
		case 0:
			return "public";
		case 1:
			return "private";
		case 3:
			return "override";
		case 5:
			return "inline";
		case 4:
			return "dynamic";
		case 6:
			return "macro";
		}
	}
	,printField: function(field) {
		return (field.doc != null && field.doc != ""?"/**\n" + this.tabs + this.tabString + StringTools.replace(field.doc,"\n","\n" + this.tabs + this.tabString) + "\n" + this.tabs + "**/\n" + this.tabs:"") + (field.meta != null && field.meta.length > 0?field.meta.map($bind(this,this.printMetadata)).join("\n" + this.tabs) + ("\n" + this.tabs):"") + (field.access != null && field.access.length > 0?field.access.map($bind(this,this.printAccess)).join(" ") + " ":"") + (function($this) {
			var $r;
			var _g = field.kind;
			$r = (function($this) {
				var $r;
				switch(_g[1]) {
				case 0:
					$r = (function($this) {
						var $r;
						var eo = _g[3];
						var t = _g[2];
						$r = "var " + field.name + $this.opt(t,$bind($this,$this.printComplexType)," : ") + $this.opt(eo,$bind($this,$this.printExpr)," = ");
						return $r;
					}($this));
					break;
				case 2:
					$r = (function($this) {
						var $r;
						var eo1 = _g[5];
						var t1 = _g[4];
						var set = _g[3];
						var get = _g[2];
						$r = "var " + field.name + "(" + get + ", " + set + ")" + $this.opt(t1,$bind($this,$this.printComplexType)," : ") + $this.opt(eo1,$bind($this,$this.printExpr)," = ");
						return $r;
					}($this));
					break;
				case 1:
					$r = (function($this) {
						var $r;
						var func = _g[2];
						$r = "function " + field.name + $this.printFunction(func);
						return $r;
					}($this));
					break;
				}
				return $r;
			}($this));
			return $r;
		}(this));
	}
	,printTypeParamDecl: function(tpd) {
		return tpd.name + (tpd.params != null && tpd.params.length > 0?"<" + tpd.params.map($bind(this,this.printTypeParamDecl)).join(", ") + ">":"") + (tpd.constraints != null && tpd.constraints.length > 0?":(" + tpd.constraints.map($bind(this,this.printComplexType)).join(", ") + ")":"");
	}
	,printFunctionArg: function(arg) {
		return (arg.opt?"?":"") + arg.name + this.opt(arg.type,$bind(this,this.printComplexType),":") + this.opt(arg.value,$bind(this,this.printExpr)," = ");
	}
	,printFunction: function(func) {
		return (func.params == null?"":func.params.length > 0?"<" + func.params.map($bind(this,this.printTypeParamDecl)).join(", ") + ">":"") + "(" + func.args.map($bind(this,this.printFunctionArg)).join(", ") + ")" + this.opt(func.ret,$bind(this,this.printComplexType),":") + this.opt(func.expr,$bind(this,this.printExpr)," ");
	}
	,printVar: function(v) {
		return v.name + this.opt(v.type,$bind(this,this.printComplexType),":") + this.opt(v.expr,$bind(this,this.printExpr)," = ");
	}
	,printExpr: function(e) {
		var _g1 = this;
		if(e == null) return "#NULL"; else {
			var _g = e.expr;
			switch(_g[1]) {
			case 0:
				var c = _g[2];
				return this.printConstant(c);
			case 1:
				var e2 = _g[3];
				var e1 = _g[2];
				return "" + this.printExpr(e1) + "[" + this.printExpr(e2) + "]";
			case 2:
				var e21 = _g[4];
				var e11 = _g[3];
				var op = _g[2];
				return "" + this.printExpr(e11) + " " + this.printBinop(op) + " " + this.printExpr(e21);
			case 3:
				var n = _g[3];
				var e12 = _g[2];
				return "" + this.printExpr(e12) + "." + n;
			case 4:
				var e13 = _g[2];
				return "(" + this.printExpr(e13) + ")";
			case 5:
				var fl = _g[2];
				return "{ " + fl.map(function(fld) {
					return "" + fld.field + " : " + _g1.printExpr(fld.expr);
				}).join(", ") + " }";
			case 6:
				var el = _g[2];
				return "[" + this.printExprs(el,", ") + "]";
			case 7:
				var el1 = _g[3];
				var e14 = _g[2];
				return "" + this.printExpr(e14) + "(" + this.printExprs(el1,", ") + ")";
			case 8:
				var el2 = _g[3];
				var tp = _g[2];
				return "new " + this.printTypePath(tp) + "(" + this.printExprs(el2,", ") + ")";
			case 9:
				switch(_g[3]) {
				case true:
					var e15 = _g[4];
					var op1 = _g[2];
					return this.printExpr(e15) + this.printUnop(op1);
				case false:
					var e16 = _g[4];
					var op2 = _g[2];
					return this.printUnop(op2) + this.printExpr(e16);
				}
				break;
			case 11:
				var func = _g[3];
				var no = _g[2];
				if(no != null) return "function " + no + this.printFunction(func); else {
					var func1 = _g[3];
					return "function" + this.printFunction(func1);
				}
				break;
			case 10:
				var vl = _g[2];
				return "var " + vl.map($bind(this,this.printVar)).join(", ");
			case 12:
				var el3 = _g[2];
				switch(_g[2].length) {
				case 0:
					return "{ }";
				default:
					var old = this.tabs;
					this.tabs += this.tabString;
					var s = "{\n" + this.tabs + this.printExprs(el3,";\n" + this.tabs);
					this.tabs = old;
					return s + (";\n" + this.tabs + "}");
				}
				break;
			case 13:
				var e22 = _g[3];
				var e17 = _g[2];
				return "for (" + this.printExpr(e17) + ") " + this.printExpr(e22);
			case 14:
				var e23 = _g[3];
				var e18 = _g[2];
				return "" + this.printExpr(e18) + " in " + this.printExpr(e23);
			case 15:
				var eelse = _g[4];
				if(_g[4] == null) {
					var econd = _g[2];
					var eif = _g[3];
					return "if (" + this.printExpr(econd) + ") " + this.printExpr(eif);
				} else switch(_g[4]) {
				default:
					var econd1 = _g[2];
					var eif1 = _g[3];
					return "if (" + this.printExpr(econd1) + ") " + this.printExpr(eif1) + " else " + this.printExpr(eelse);
				}
				break;
			case 16:
				switch(_g[4]) {
				case true:
					var econd2 = _g[2];
					var e19 = _g[3];
					return "while (" + this.printExpr(econd2) + ") " + this.printExpr(e19);
				case false:
					var econd3 = _g[2];
					var e110 = _g[3];
					return "do " + this.printExpr(e110) + " while (" + this.printExpr(econd3) + ")";
				}
				break;
			case 17:
				var edef = _g[4];
				var cl = _g[3];
				var e111 = _g[2];
				var old1 = this.tabs;
				this.tabs += this.tabString;
				var s1 = "switch " + this.printExpr(e111) + " {\n" + this.tabs + cl.map(function(c1) {
					return "case " + _g1.printExprs(c1.values,", ") + (c1.guard != null?" if (" + _g1.printExpr(c1.guard) + "):":":") + (c1.expr != null?_g1.opt(c1.expr,$bind(_g1,_g1.printExpr)) + ";":"");
				}).join("\n" + this.tabs);
				if(edef != null) s1 += "\n" + this.tabs + "default:" + (edef.expr == null?"":this.printExpr(edef) + ";");
				this.tabs = old1;
				return s1 + ("\n" + this.tabs + "}");
			case 18:
				var cl1 = _g[3];
				var e112 = _g[2];
				return "try " + this.printExpr(e112) + cl1.map(function(c2) {
					return " catch(" + c2.name + ":" + _g1.printComplexType(c2.type) + ") " + _g1.printExpr(c2.expr);
				}).join("");
			case 19:
				var eo = _g[2];
				return "return" + this.opt(eo,$bind(this,this.printExpr)," ");
			case 20:
				return "break";
			case 21:
				return "continue";
			case 22:
				var e113 = _g[2];
				return "untyped " + this.printExpr(e113);
			case 23:
				var e114 = _g[2];
				return "throw " + this.printExpr(e114);
			case 24:
				var cto = _g[3];
				var e115 = _g[2];
				if(cto != null) return "cast(" + this.printExpr(e115) + ", " + this.printComplexType(cto) + ")"; else {
					var e116 = _g[2];
					return "cast " + this.printExpr(e116);
				}
				break;
			case 25:
				var e117 = _g[2];
				return "#DISPLAY(" + this.printExpr(e117) + ")";
			case 26:
				var tp1 = _g[2];
				return "#DISPLAY(" + this.printTypePath(tp1) + ")";
			case 27:
				var eelse1 = _g[4];
				var eif2 = _g[3];
				var econd4 = _g[2];
				return "" + this.printExpr(econd4) + " ? " + this.printExpr(eif2) + " : " + this.printExpr(eelse1);
			case 28:
				var ct = _g[3];
				var e118 = _g[2];
				return "(" + this.printExpr(e118) + " : " + this.printComplexType(ct) + ")";
			case 29:
				var e119 = _g[3];
				var meta = _g[2];
				return this.printMetadata(meta) + " " + this.printExpr(e119);
			}
		}
	}
	,printExprs: function(el,sep) {
		return el.map($bind(this,this.printExpr)).join(sep);
	}
	,printExtension: function(tpl,fields) {
		return "{\n" + this.tabs + ">" + tpl.map($bind(this,this.printTypePath)).join(",\n" + this.tabs + ">") + "," + (fields.length > 0?"\n" + this.tabs + fields.map($bind(this,this.printField)).join(";\n" + this.tabs) + ";\n}":"\n}");
	}
	,printStructure: function(fields) {
		if(fields.length == 0) return "{ }"; else return "{\n" + this.tabs + fields.map($bind(this,this.printField)).join(";\n" + this.tabs) + ";\n}";
	}
	,printTypeDefinition: function(t,printPackage) {
		if(printPackage == null) printPackage = true;
		var old = this.tabs;
		this.tabs = this.tabString;
		var str;
		if(t == null) str = "#NULL"; else str = (printPackage && t.pack.length > 0 && t.pack[0] != ""?"package " + t.pack.join(".") + ";\n":"") + (t.meta != null && t.meta.length > 0?t.meta.map($bind(this,this.printMetadata)).join(" ") + " ":"") + (t.isExtern?"extern ":"") + (function($this) {
			var $r;
			var _g = t.kind;
			$r = (function($this) {
				var $r;
				switch(_g[1]) {
				case 0:
					$r = "enum " + t.name + (t.params.length > 0?"<" + t.params.map($bind($this,$this.printTypeParamDecl)).join(", ") + ">":"") + " {\n" + ((function($this) {
						var $r;
						var _g1 = [];
						{
							var _g2 = 0;
							var _g3 = t.fields;
							while(_g2 < _g3.length) {
								var field = _g3[_g2];
								++_g2;
								_g1.push($this.tabs + (field.doc != null && field.doc != ""?"/**\n" + $this.tabs + $this.tabString + StringTools.replace(field.doc,"\n","\n" + $this.tabs + $this.tabString) + "\n" + $this.tabs + "**/\n" + $this.tabs:"") + (field.meta != null && field.meta.length > 0?field.meta.map($bind($this,$this.printMetadata)).join(" ") + " ":"") + (function($this) {
									var $r;
									var _g4 = field.kind;
									$r = (function($this) {
										var $r;
										switch(_g4[1]) {
										case 0:
											$r = (function($this) {
												var $r;
												var t1 = _g4[2];
												$r = field.name + $this.opt(t1,$bind($this,$this.printComplexType),":");
												return $r;
											}($this));
											break;
										case 2:
											$r = (function($this) {
												var $r;
												throw new js__$Boot_HaxeError("FProp is invalid for TDEnum.");
												return $r;
											}($this));
											break;
										case 1:
											$r = (function($this) {
												var $r;
												var func = _g4[2];
												$r = field.name + $this.printFunction(func);
												return $r;
											}($this));
											break;
										}
										return $r;
									}($this));
									return $r;
								}($this)) + ";");
							}
						}
						$r = _g1;
						return $r;
					}($this))).join("\n") + "\n}";
					break;
				case 1:
					$r = "typedef " + t.name + (t.params.length > 0?"<" + t.params.map($bind($this,$this.printTypeParamDecl)).join(", ") + ">":"") + " = {\n" + ((function($this) {
						var $r;
						var _g11 = [];
						{
							var _g21 = 0;
							var _g31 = t.fields;
							while(_g21 < _g31.length) {
								var f = _g31[_g21];
								++_g21;
								_g11.push($this.tabs + $this.printField(f) + ";");
							}
						}
						$r = _g11;
						return $r;
					}($this))).join("\n") + "\n}";
					break;
				case 2:
					$r = (function($this) {
						var $r;
						var isInterface = _g[4];
						var interfaces = _g[3];
						var superClass = _g[2];
						$r = (isInterface?"interface ":"class ") + t.name + (t.params != null && t.params.length > 0?"<" + t.params.map($bind($this,$this.printTypeParamDecl)).join(", ") + ">":"") + (superClass != null?" extends " + $this.printTypePath(superClass):"") + (interfaces != null?(isInterface?(function($this) {
							var $r;
							var _g12 = [];
							{
								var _g22 = 0;
								while(_g22 < interfaces.length) {
									var tp = interfaces[_g22];
									++_g22;
									_g12.push(" extends " + $this.printTypePath(tp));
								}
							}
							$r = _g12;
							return $r;
						}($this)):(function($this) {
							var $r;
							var _g23 = [];
							{
								var _g32 = 0;
								while(_g32 < interfaces.length) {
									var tp1 = interfaces[_g32];
									++_g32;
									_g23.push(" implements " + $this.printTypePath(tp1));
								}
							}
							$r = _g23;
							return $r;
						}($this))).join(""):"") + " {\n" + ((function($this) {
							var $r;
							var _g33 = [];
							{
								var _g41 = 0;
								var _g5 = t.fields;
								while(_g41 < _g5.length) {
									var f1 = _g5[_g41];
									++_g41;
									_g33.push((function($this) {
										var $r;
										var fstr = $this.printField(f1);
										$r = $this.tabs + fstr + (function($this) {
											var $r;
											var _g6 = f1.kind;
											$r = (function($this) {
												var $r;
												switch(_g6[1]) {
												case 0:case 2:
													$r = ";";
													break;
												case 1:
													$r = _g6[2].expr == null?";":(function($this) {
														var $r;
														switch(_g6[2].expr.expr[1]) {
														case 12:
															$r = "";
															break;
														default:
															$r = ";";
														}
														return $r;
													}($this));
													break;
												}
												return $r;
											}($this));
											return $r;
										}($this));
										return $r;
									}($this)));
								}
							}
							$r = _g33;
							return $r;
						}($this))).join("\n") + "\n}";
						return $r;
					}($this));
					break;
				case 3:
					$r = (function($this) {
						var $r;
						var ct = _g[2];
						$r = "typedef " + t.name + (t.params.length > 0?"<" + t.params.map($bind($this,$this.printTypeParamDecl)).join(", ") + ">":"") + " = " + (function($this) {
							var $r;
							switch(ct[1]) {
							case 4:
								$r = (function($this) {
									var $r;
									var fields = ct[3];
									var tpl = ct[2];
									$r = $this.printExtension(tpl,fields);
									return $r;
								}($this));
								break;
							case 2:
								$r = (function($this) {
									var $r;
									var fields1 = ct[2];
									$r = $this.printStructure(fields1);
									return $r;
								}($this));
								break;
							default:
								$r = $this.printComplexType(ct);
							}
							return $r;
						}($this)) + ";";
						return $r;
					}($this));
					break;
				case 4:
					$r = (function($this) {
						var $r;
						var to = _g[4];
						var from = _g[3];
						var tthis = _g[2];
						$r = "abstract " + t.name + (t.params.length > 0?"<" + t.params.map($bind($this,$this.printTypeParamDecl)).join(", ") + ">":"") + (tthis == null?"":"(" + $this.printComplexType(tthis) + ")") + (from == null?"":((function($this) {
							var $r;
							var _g13 = [];
							{
								var _g24 = 0;
								while(_g24 < from.length) {
									var f2 = from[_g24];
									++_g24;
									_g13.push(" from " + $this.printComplexType(f2));
								}
							}
							$r = _g13;
							return $r;
						}($this))).join("")) + (to == null?"":((function($this) {
							var $r;
							var _g25 = [];
							{
								var _g34 = 0;
								while(_g34 < to.length) {
									var t2 = to[_g34];
									++_g34;
									_g25.push(" to " + $this.printComplexType(t2));
								}
							}
							$r = _g25;
							return $r;
						}($this))).join("")) + " {\n" + ((function($this) {
							var $r;
							var _g35 = [];
							{
								var _g42 = 0;
								var _g51 = t.fields;
								while(_g42 < _g51.length) {
									var f3 = _g51[_g42];
									++_g42;
									_g35.push((function($this) {
										var $r;
										var fstr1 = $this.printField(f3);
										$r = $this.tabs + fstr1 + (function($this) {
											var $r;
											var _g61 = f3.kind;
											$r = (function($this) {
												var $r;
												switch(_g61[1]) {
												case 0:case 2:
													$r = ";";
													break;
												case 1:
													$r = (function($this) {
														var $r;
														var func1 = _g61[2];
														$r = func1.expr == null?";":"";
														return $r;
													}($this));
													break;
												default:
													$r = "";
												}
												return $r;
											}($this));
											return $r;
										}($this));
										return $r;
									}($this)));
								}
							}
							$r = _g35;
							return $r;
						}($this))).join("\n") + "\n}";
						return $r;
					}($this));
					break;
				}
				return $r;
			}($this));
			return $r;
		}(this));
		this.tabs = old;
		return str;
	}
	,opt: function(v,f,prefix) {
		if(prefix == null) prefix = "";
		if(v == null) return ""; else return prefix + f(v);
	}
	,__class__: haxe_macro_Printer
};
var js__$Boot_HaxeError = function(val) {
	Error.call(this);
	this.val = val;
	this.message = String(val);
	if(Error.captureStackTrace) Error.captureStackTrace(this,js__$Boot_HaxeError);
};
js__$Boot_HaxeError.__name__ = true;
js__$Boot_HaxeError.__super__ = Error;
js__$Boot_HaxeError.prototype = $extend(Error.prototype,{
	__class__: js__$Boot_HaxeError
});
var js_Boot = function() { };
js_Boot.__name__ = true;
js_Boot.getClass = function(o) {
	if((o instanceof Array) && o.__enum__ == null) return Array; else {
		var cl = o.__class__;
		if(cl != null) return cl;
		var name = js_Boot.__nativeClassName(o);
		if(name != null) return js_Boot.__resolveNativeClass(name);
		return null;
	}
};
js_Boot.__string_rec = function(o,s) {
	if(o == null) return "null";
	if(s.length >= 5) return "<...>";
	var t = typeof(o);
	if(t == "function" && (o.__name__ || o.__ename__)) t = "object";
	switch(t) {
	case "object":
		if(o instanceof Array) {
			if(o.__enum__) {
				if(o.length == 2) return o[0];
				var str2 = o[0] + "(";
				s += "\t";
				var _g1 = 2;
				var _g = o.length;
				while(_g1 < _g) {
					var i1 = _g1++;
					if(i1 != 2) str2 += "," + js_Boot.__string_rec(o[i1],s); else str2 += js_Boot.__string_rec(o[i1],s);
				}
				return str2 + ")";
			}
			var l = o.length;
			var i;
			var str1 = "[";
			s += "\t";
			var _g2 = 0;
			while(_g2 < l) {
				var i2 = _g2++;
				str1 += (i2 > 0?",":"") + js_Boot.__string_rec(o[i2],s);
			}
			str1 += "]";
			return str1;
		}
		var tostr;
		try {
			tostr = o.toString;
		} catch( e ) {
			if (e instanceof js__$Boot_HaxeError) e = e.val;
			return "???";
		}
		if(tostr != null && tostr != Object.toString && typeof(tostr) == "function") {
			var s2 = o.toString();
			if(s2 != "[object Object]") return s2;
		}
		var k = null;
		var str = "{\n";
		s += "\t";
		var hasp = o.hasOwnProperty != null;
		for( var k in o ) {
		if(hasp && !o.hasOwnProperty(k)) {
			continue;
		}
		if(k == "prototype" || k == "__class__" || k == "__super__" || k == "__interfaces__" || k == "__properties__") {
			continue;
		}
		if(str.length != 2) str += ", \n";
		str += s + k + " : " + js_Boot.__string_rec(o[k],s);
		}
		s = s.substring(1);
		str += "\n" + s + "}";
		return str;
	case "function":
		return "<function>";
	case "string":
		return o;
	default:
		return String(o);
	}
};
js_Boot.__interfLoop = function(cc,cl) {
	if(cc == null) return false;
	if(cc == cl) return true;
	var intf = cc.__interfaces__;
	if(intf != null) {
		var _g1 = 0;
		var _g = intf.length;
		while(_g1 < _g) {
			var i = _g1++;
			var i1 = intf[i];
			if(i1 == cl || js_Boot.__interfLoop(i1,cl)) return true;
		}
	}
	return js_Boot.__interfLoop(cc.__super__,cl);
};
js_Boot.__instanceof = function(o,cl) {
	if(cl == null) return false;
	switch(cl) {
	case Int:
		return (o|0) === o;
	case Float:
		return typeof(o) == "number";
	case Bool:
		return typeof(o) == "boolean";
	case String:
		return typeof(o) == "string";
	case Array:
		return (o instanceof Array) && o.__enum__ == null;
	case Dynamic:
		return true;
	default:
		if(o != null) {
			if(typeof(cl) == "function") {
				if(o instanceof cl) return true;
				if(js_Boot.__interfLoop(js_Boot.getClass(o),cl)) return true;
			} else if(typeof(cl) == "object" && js_Boot.__isNativeObj(cl)) {
				if(o instanceof cl) return true;
			}
		} else return false;
		if(cl == Class && o.__name__ != null) return true;
		if(cl == Enum && o.__ename__ != null) return true;
		return o.__enum__ == cl;
	}
};
js_Boot.__nativeClassName = function(o) {
	var name = js_Boot.__toStr.call(o).slice(8,-1);
	if(name == "Object" || name == "Function" || name == "Math" || name == "JSON") return null;
	return name;
};
js_Boot.__isNativeObj = function(o) {
	return js_Boot.__nativeClassName(o) != null;
};
js_Boot.__resolveNativeClass = function(name) {
	return $global[name];
};
var js_html_compat_ArrayBuffer = function(a) {
	if((a instanceof Array) && a.__enum__ == null) {
		this.a = a;
		this.byteLength = a.length;
	} else {
		var len = a;
		this.a = [];
		var _g = 0;
		while(_g < len) {
			var i = _g++;
			this.a[i] = 0;
		}
		this.byteLength = len;
	}
};
js_html_compat_ArrayBuffer.__name__ = true;
js_html_compat_ArrayBuffer.sliceImpl = function(begin,end) {
	var u = new Uint8Array(this,begin,end == null?null:end - begin);
	var result = new ArrayBuffer(u.byteLength);
	var resultArray = new Uint8Array(result);
	resultArray.set(u);
	return result;
};
js_html_compat_ArrayBuffer.prototype = {
	slice: function(begin,end) {
		return new js_html_compat_ArrayBuffer(this.a.slice(begin,end));
	}
	,__class__: js_html_compat_ArrayBuffer
};
var js_html_compat_DataView = function(buffer,byteOffset,byteLength) {
	this.buf = buffer;
	if(byteOffset == null) this.offset = 0; else this.offset = byteOffset;
	if(byteLength == null) this.length = buffer.byteLength - this.offset; else this.length = byteLength;
	if(this.offset < 0 || this.length < 0 || this.offset + this.length > buffer.byteLength) throw new js__$Boot_HaxeError(haxe_io_Error.OutsideBounds);
};
js_html_compat_DataView.__name__ = true;
js_html_compat_DataView.prototype = {
	getInt8: function(byteOffset) {
		var v = this.buf.a[this.offset + byteOffset];
		if(v >= 128) return v - 256; else return v;
	}
	,getUint8: function(byteOffset) {
		return this.buf.a[this.offset + byteOffset];
	}
	,getInt16: function(byteOffset,littleEndian) {
		var v = this.getUint16(byteOffset,littleEndian);
		if(v >= 32768) return v - 65536; else return v;
	}
	,getUint16: function(byteOffset,littleEndian) {
		if(littleEndian) return this.buf.a[this.offset + byteOffset] | this.buf.a[this.offset + byteOffset + 1] << 8; else return this.buf.a[this.offset + byteOffset] << 8 | this.buf.a[this.offset + byteOffset + 1];
	}
	,getInt32: function(byteOffset,littleEndian) {
		var p = this.offset + byteOffset;
		var a = this.buf.a[p++];
		var b = this.buf.a[p++];
		var c = this.buf.a[p++];
		var d = this.buf.a[p++];
		if(littleEndian) return a | b << 8 | c << 16 | d << 24; else return d | c << 8 | b << 16 | a << 24;
	}
	,getUint32: function(byteOffset,littleEndian) {
		var v = this.getInt32(byteOffset,littleEndian);
		if(v < 0) return v + 4294967296.; else return v;
	}
	,getFloat32: function(byteOffset,littleEndian) {
		return haxe_io_FPHelper.i32ToFloat(this.getInt32(byteOffset,littleEndian));
	}
	,getFloat64: function(byteOffset,littleEndian) {
		var a = this.getInt32(byteOffset,littleEndian);
		var b = this.getInt32(byteOffset + 4,littleEndian);
		return haxe_io_FPHelper.i64ToDouble(littleEndian?a:b,littleEndian?b:a);
	}
	,setInt8: function(byteOffset,value) {
		if(value < 0) this.buf.a[byteOffset + this.offset] = value + 128 & 255; else this.buf.a[byteOffset + this.offset] = value & 255;
	}
	,setUint8: function(byteOffset,value) {
		this.buf.a[byteOffset + this.offset] = value & 255;
	}
	,setInt16: function(byteOffset,value,littleEndian) {
		this.setUint16(byteOffset,value < 0?value + 65536:value,littleEndian);
	}
	,setUint16: function(byteOffset,value,littleEndian) {
		var p = byteOffset + this.offset;
		if(littleEndian) {
			this.buf.a[p] = value & 255;
			this.buf.a[p++] = value >> 8 & 255;
		} else {
			this.buf.a[p++] = value >> 8 & 255;
			this.buf.a[p] = value & 255;
		}
	}
	,setInt32: function(byteOffset,value,littleEndian) {
		this.setUint32(byteOffset,value,littleEndian);
	}
	,setUint32: function(byteOffset,value,littleEndian) {
		var p = byteOffset + this.offset;
		if(littleEndian) {
			this.buf.a[p++] = value & 255;
			this.buf.a[p++] = value >> 8 & 255;
			this.buf.a[p++] = value >> 16 & 255;
			this.buf.a[p++] = value >>> 24;
		} else {
			this.buf.a[p++] = value >>> 24;
			this.buf.a[p++] = value >> 16 & 255;
			this.buf.a[p++] = value >> 8 & 255;
			this.buf.a[p++] = value & 255;
		}
	}
	,setFloat32: function(byteOffset,value,littleEndian) {
		this.setUint32(byteOffset,haxe_io_FPHelper.floatToI32(value),littleEndian);
	}
	,setFloat64: function(byteOffset,value,littleEndian) {
		var i64 = haxe_io_FPHelper.doubleToI64(value);
		if(littleEndian) {
			this.setUint32(byteOffset,i64.low);
			this.setUint32(byteOffset,i64.high);
		} else {
			this.setUint32(byteOffset,i64.high);
			this.setUint32(byteOffset,i64.low);
		}
	}
	,__class__: js_html_compat_DataView
};
var js_html_compat_Uint8Array = function() { };
js_html_compat_Uint8Array.__name__ = true;
js_html_compat_Uint8Array._new = function(arg1,offset,length) {
	var arr;
	if(typeof(arg1) == "number") {
		arr = [];
		var _g = 0;
		while(_g < arg1) {
			var i = _g++;
			arr[i] = 0;
		}
		arr.byteLength = arr.length;
		arr.byteOffset = 0;
		arr.buffer = new js_html_compat_ArrayBuffer(arr);
	} else if(js_Boot.__instanceof(arg1,js_html_compat_ArrayBuffer)) {
		var buffer = arg1;
		if(offset == null) offset = 0;
		if(length == null) length = buffer.byteLength - offset;
		if(offset == 0) arr = buffer.a; else arr = buffer.a.slice(offset,offset + length);
		arr.byteLength = arr.length;
		arr.byteOffset = offset;
		arr.buffer = buffer;
	} else if((arg1 instanceof Array) && arg1.__enum__ == null) {
		arr = arg1.slice();
		arr.byteLength = arr.length;
		arr.byteOffset = 0;
		arr.buffer = new js_html_compat_ArrayBuffer(arr);
	} else throw new js__$Boot_HaxeError("TODO " + Std.string(arg1));
	arr.subarray = js_html_compat_Uint8Array._subarray;
	arr.set = js_html_compat_Uint8Array._set;
	return arr;
};
js_html_compat_Uint8Array._set = function(arg,offset) {
	var t = this;
	if(js_Boot.__instanceof(arg.buffer,js_html_compat_ArrayBuffer)) {
		var a = arg;
		if(arg.byteLength + offset > t.byteLength) throw new js__$Boot_HaxeError("set() outside of range");
		var _g1 = 0;
		var _g = arg.byteLength;
		while(_g1 < _g) {
			var i = _g1++;
			t[i + offset] = a[i];
		}
	} else if((arg instanceof Array) && arg.__enum__ == null) {
		var a1 = arg;
		if(a1.length + offset > t.byteLength) throw new js__$Boot_HaxeError("set() outside of range");
		var _g11 = 0;
		var _g2 = a1.length;
		while(_g11 < _g2) {
			var i1 = _g11++;
			t[i1 + offset] = a1[i1];
		}
	} else throw new js__$Boot_HaxeError("TODO");
};
js_html_compat_Uint8Array._subarray = function(start,end) {
	var t = this;
	var a = js_html_compat_Uint8Array._new(t.slice(start,end));
	a.byteOffset = start;
	return a;
};
var js_node_Fs = require("fs");
var js_node_Http = require("http");
var sys_FileSystem = function() { };
sys_FileSystem.__name__ = true;
sys_FileSystem.exists = function(path) {
	try {
		js_node_Fs.accessSync(path);
		return true;
	} catch( _ ) {
		if (_ instanceof js__$Boot_HaxeError) _ = _.val;
		return false;
	}
};
sys_FileSystem.createDirectory = function(path) {
	try {
		js_node_Fs.mkdirSync(path);
	} catch( e ) {
		if (e instanceof js__$Boot_HaxeError) e = e.val;
		if(e.code == "ENOENT") {
			sys_FileSystem.createDirectory(js_node_Path.dirname(path));
			js_node_Fs.mkdirSync(path);
		} else {
			var stat;
			try {
				stat = js_node_Fs.statSync(path);
			} catch( _ ) {
				if (_ instanceof js__$Boot_HaxeError) _ = _.val;
				throw e;
			}
			if(!stat.isDirectory()) throw e;
		}
	}
};
var sys_io_File = function() { };
sys_io_File.__name__ = true;
sys_io_File.getContent = function(path) {
	return js_node_Fs.readFileSync(path,{ encoding : "utf8"});
};
sys_io_File.saveContent = function(path,content) {
	js_node_Fs.writeFileSync(path,content);
};
function $iterator(o) { if( o instanceof Array ) return function() { return HxOverrides.iter(o); }; return typeof(o.iterator) == 'function' ? $bind(o,o.iterator) : o.iterator; }
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
String.prototype.__class__ = String;
String.__name__ = true;
Array.__name__ = true;
var Int = { __name__ : ["Int"]};
var Dynamic = { __name__ : ["Dynamic"]};
var Float = Number;
Float.__name__ = ["Float"];
var Bool = Boolean;
Bool.__ename__ = ["Bool"];
var Class = { __name__ : ["Class"]};
var Enum = { };
if(Array.prototype.map == null) Array.prototype.map = function(f) {
	var a = [];
	var _g1 = 0;
	var _g = this.length;
	while(_g1 < _g) {
		var i = _g1++;
		a[i] = f(this[i]);
	}
	return a;
};
var __map_reserved = {}
var q = require("jquery")(require("jsdom").jsdom().defaultView);
var js = js || {}
js.JQuery = q;
var ArrayBuffer = $global.ArrayBuffer || js_html_compat_ArrayBuffer;
if(ArrayBuffer.prototype.slice == null) ArrayBuffer.prototype.slice = js_html_compat_ArrayBuffer.sliceImpl;
var DataView = $global.DataView || js_html_compat_DataView;
var Uint8Array = $global.Uint8Array || js_html_compat_Uint8Array._new;
Main.pos = { min : 0, max : 0, file : ""};
Main.api_url = "http://www.nodegit.org/api/";
Main.api_local_path = js_node_Path.join(process.cwd(),"api");
Main.haxe_code_path = js_node_Path.join(process.cwd(),"nodegit");
Main.modules = [];
Main.module_types = new haxe_ds_StringMap();
haxe_io_FPHelper.i64tmp = (function($this) {
	var $r;
	var x = new haxe__$Int64__$_$_$Int64(0,0);
	$r = x;
	return $r;
}(this));
js_Boot.__toStr = {}.toString;
js_html_compat_Uint8Array.BYTES_PER_ELEMENT = 1;
Main.main();
})(typeof console != "undefined" ? console : {log:function(){}}, typeof window != "undefined" ? window : typeof global != "undefined" ? global : typeof self != "undefined" ? self : this);
