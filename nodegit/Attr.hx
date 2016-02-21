package nodegit;
@:jsRequire("nodegit", "Attr") extern class Attr {
	static function addMacro(repo:nodegit.Repository, name:String, values:String):Float;
	static function cacheFlush(repo:nodegit.Repository):Void;
	static function get(repo:nodegit.Repository, flags:Float, path:String, name:String):js.Promise<String>;
	static function getMany(repo:nodegit.Repository, flags:Float, path:String, num_attr:Float, names:String):Array<Dynamic>;
	static function value(attr:String):Float;
	static var STATES(default, null) : AttrStates;
}
extern class AttrStates {
	var UNSPECIFIED_T(default, null) : Int;
	var TRUE_T(default, null) : Int;
	var FALSE_T(default, null) : Int;
	var VALUE_T(default, null) : Int;
}