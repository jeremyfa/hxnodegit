package nodegit;
@:jsRequire("nodegit", "Blame") extern class Blame {
	static function file(repo:nodegit.Repository, path:String, ?options:nodegit.BlameOptions):Void;
	static function initOptions(opts:nodegit.BlameOptions, version:Float):Float;
	function buffer(buffer:String, buffer_len:Float):js.Promise<nodegit.Blame>;
	function free():Void;
	function getHunkByIndex(index:Float):nodegit.BlameHunk;
	function getHunkByLine(lineno:Float):nodegit.BlameHunk;
	function getHunkCount():Float;
	static var FLAG : BlameFlag;
}
extern class BlameFlag {
	var NORMAL : Int = 0;
	var TRACK_COPIES_SAME_FILE : Int = 1;
	var TRACK_COPIES_SAME_COMMIT_MOVES : Int = 2;
	var TRACK_COPIES_SAME_COMMIT_COPIES : Int = 4;
	var TRACK_COPIES_ANY_COMMIT_COPIES : Int = 8;
	var FIRST_PARENT : Int = 16;
}