package nodegit;
@:jsRequire("nodegit", "Object") extern class Object {
	static function lookup(repo:Dynamic, id:Dynamic, type:Float):Promise<Dynamic>;
	static function lookupPrefix(repo:Dynamic, id:Dynamic, len:Float, type:Float):Promise<Dynamic>;
	static function size(type:Float):Float;
	static function string2type(str:String):Float;
	static function type2string(type:Float):String;
	static function typeisloose(type:Float):Dynamic;
	function dup():Promise<Dynamic>;
	function free():Void;
	function id():Dynamic;
	function lookupByPath(path:String, type:Float):Promise<Dynamic>;
	function owner():Dynamic;
	function peel(target_type:Float):Promise<Dynamic>;
	function shortId():Promise<Dynamic>;
	function type():Float;
	static var TYPE : Dynamic;
}