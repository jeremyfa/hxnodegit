package nodegit;
@:jsRequire("nodegit", "Attr") extern class Attr {
	static function addMacro(repo:nodegit.Repository, name:String, values:String):Float;
	static function cacheFlush(repo:nodegit.Repository):Void;
	static function get(repo:nodegit.Repository, flags:Float, path:String, name:String):js.Promise<String>;
	static function getMany(repo:nodegit.Repository, flags:Float, path:String, num_attr:Float, names:String):Array<Dynamic>;
	static function value(attr:String):Float;
	static var STATES : AttrStates;
}
extern class AttrStates {
	var UNSPECIFIED_T : Int = 0;
	var TRUE_T : Int = 1;
	var FALSE_T : Int = 2;
	var VALUE_T : Int = 3;
}