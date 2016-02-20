package nodegit;
@:jsRequire("nodegit", "Blame") extern class Blame {
	static function file(repo:nodegit.Repository, path:String, [options]:nodegit.BlameOptions):Void;
	static function initOptions(opts:nodegit.BlameOptions, version:Float):Float;
	function buffer(buffer:String, buffer_len:Float):js.Promise<nodegit.Blame>;
	function free():Void;
	function getHunkByIndex(index:Float):nodegit.BlameHunk;
	function getHunkByLine(lineno:Float):nodegit.BlameHunk;
	function getHunkCount():Float;
	static var FLAG : Dynamic;
}