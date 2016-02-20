package nodegit;
@:jsRequire("nodegit", "Hashsig") extern class Hashsig {
	static function create(buf:String, buflen:Float, opts:Float):js.Promise<nodegit.Hashsig>;
	static function createFromFile(path:String, opts:Float):js.Promise<nodegit.Hashsig>;
	function compare(b:nodegit.Hashsig):Float;
	function free():Void;
	static var OPTION : Dynamic;
}