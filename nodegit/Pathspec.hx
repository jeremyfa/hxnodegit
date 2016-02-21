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
	static var FLAG : PathspecFlag;
}
extern class PathspecFlag {
	var DEFAULT : Int = 0;
	var IGNORE_CASE : Int = 1;
	var USE_CASE : Int = 2;
	var NO_GLOB : Int = 4;
	var NO_MATCH_ERROR : Int = 8;
	var FIND_FAILURES : Int = 16;
	var FAILURES_ONLY : Int = 32;
}