package nodegit;
@:jsRequire("nodegit", "Blame") extern class Blame {
	static function file(repo:nodegit.Repository, path:String, ?options:nodegit.BlameOptions):Void;
	static function initOptions(opts:nodegit.BlameOptions, version:Float):Float;
	function buffer(buffer:String, buffer_len:Float):js.Promise<nodegit.Blame>;
	function free():Void;
	function getHunkByIndex(index:Float):nodegit.BlameHunk;
	function getHunkByLine(lineno:Float):nodegit.BlameHunk;
	function getHunkCount():Float;
	static var FLAG(default, null) : BlameFlag;
}
extern class BlameFlag {
	var NORMAL(default, null) : Int;
	var TRACK_COPIES_SAME_FILE(default, null) : Int;
	var TRACK_COPIES_SAME_COMMIT_MOVES(default, null) : Int;
	var TRACK_COPIES_SAME_COMMIT_COPIES(default, null) : Int;
	var TRACK_COPIES_ANY_COMMIT_COPIES(default, null) : Int;
	var FIRST_PARENT(default, null) : Int;
}