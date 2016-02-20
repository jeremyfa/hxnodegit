package nodegit;
@:jsRequire("nodegit", "Attr") extern class Attr {
	static function addMacro(repo:Dynamic, name:String, values:String):Float;
	static function cacheFlush(repo:Dynamic):Void;
	static function get(repo:Dynamic, flags:Float, path:String, name:String):Promise<String>;
	static function getMany(repo:Dynamic, flags:Float, path:String, num_attr:Float, names:String):Array<Dynamic>;
	static function value(attr:String):Float;
	static var STATES : Dynamic;
}