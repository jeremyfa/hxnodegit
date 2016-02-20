package nodegit;
@:jsRequire("nodegit", "Hashsig") extern class Hashsig {
	static function create(buf:String, buflen:Float, opts:Float):Promise<Dynamic>;
	static function createFromFile(path:String, opts:Float):Promise<Dynamic>;
	function compare(b:Dynamic):Float;
	function free():Void;
	static var OPTION : Dynamic;
}