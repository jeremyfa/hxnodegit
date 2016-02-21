package nodegit;
@:jsRequire("nodegit", "Pathspec") extern class Pathspec {
	static function create(pathspec:nodegit.Strarray):nodegit.Pathspec;
	static function matchListDiffEntry(m:Dynamic, pos:Float):nodegit.DiffDelta;
	static function matchListEntry(m:Dynamic, pos:Float):String;
	static function matchListEntrycount(m:Dynamic):Float;
	static function matchListFailedEntry(m:Dynamic, pos:Float):String;
	static function matchListFailedEntrycount(m:Dynamic):Float;
	function free():Void;
	function matchDiff(diff:nodegit.Diff, flags:Float):js.Promise<Dynamic>;
	function matchIndex(index:nodegit.Index, flags:Float):js.Promise<Dynamic>;
	function matchTree(tree:nodegit.Tree, flags:Float):js.Promise<Dynamic>;
	function matchWorkdir(repo:nodegit.Repository, flags:Float):js.Promise<Dynamic>;
	function matchesPath(flags:Float, path:String):Float;
	static var FLAG(default, null) : PathspecFlag;
}
extern class PathspecFlag {
	var DEFAULT(default, null) : Int;
	var IGNORE_CASE(default, null) : Int;
	var USE_CASE(default, null) : Int;
	var NO_GLOB(default, null) : Int;
	var NO_MATCH_ERROR(default, null) : Int;
	var FIND_FAILURES(default, null) : Int;
	var FAILURES_ONLY(default, null) : Int;
}