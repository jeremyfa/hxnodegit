package nodegit;
@:jsRequire("nodegit", "Blame") extern class Blame {
	static function file(repo:Dynamic, path:String, [options]:Dynamic):Void;
	static function initOptions(opts:Dynamic, version:Float):Float;
	function buffer(buffer:String, buffer_len:Float):Promise<Dynamic>;
	function free():Void;
	function getHunkByIndex(index:Float):Dynamic;
	function getHunkByLine(lineno:Float):Dynamic;
	function getHunkCount():Float;
	static var FLAG : Dynamic;
}