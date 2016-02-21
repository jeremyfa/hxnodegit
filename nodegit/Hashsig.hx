package nodegit;
@:jsRequire("nodegit", "Hashsig") extern class Hashsig {
	static function create(buf:String, buflen:Float, opts:Float):js.Promise<nodegit.Hashsig>;
	static function createFromFile(path:String, opts:Float):js.Promise<nodegit.Hashsig>;
	function compare(b:nodegit.Hashsig):Float;
	function free():Void;
	static var OPTION(default, null) : HashsigOption;
}
extern class HashsigOption {
	var NORMAL(default, null) : Int = 0;
	var IGNORE_WHITESPACE(default, null) : Int = 1;
	var SMART_WHITESPACE(default, null) : Int = 2;
	var ALLOW_SMALL_FILES(default, null) : Int = 4;
}