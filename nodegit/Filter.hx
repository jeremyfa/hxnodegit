package nodegit;
@:jsRequire("nodegit", "Filter") extern class Filter {
	var attributes : String;
	var stream : Dynamic;
	var version : Float;
	static function listContains(filters:Dynamic, name:String):Float;
	static function listLength(fl:Dynamic):Float;
	static function listNew(repo:nodegit.Repository, mode:Float, options:Float):js.Promise<Dynamic>;
	static function listStreamBlob(filters:Dynamic, blob:nodegit.Blob, target:Dynamic):Float;
	static function listStreamData(filters:Dynamic, data:nodegit.Buf, target:Dynamic):Float;
	static function listStreamFile(filters:Dynamic, repo:nodegit.Repository, path:String, target:Dynamic):Float;
	static function unregister(name:String):Float;
	function lookup(name:String):nodegit.Filter;
	function register(name:String, priority:Float):Float;
	static var FLAG(default, null) : FilterFlag;
	static var MODE(default, null) : FilterMode;
}
extern class FilterFlag {
	var DEFAULT(default, null) : Int;
	var ALLOW_UNSAFE(default, null) : Int;
}
extern class FilterMode {
	var TO_WORKTREE(default, null) : Int;
	var SMUDGE(default, null) : Int;
	var TO_ODB(default, null) : Int;
	var CLEAN(default, null) : Int;
}