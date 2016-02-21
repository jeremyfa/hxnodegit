package nodegit;
@:jsRequire("nodegit", "Hashsig") extern class Hashsig {
	static function create(buf:String, buflen:Float, opts:Float):js.Promise<nodegit.Hashsig>;
	static function createFromFile(path:String, opts:Float):js.Promise<nodegit.Hashsig>;
	function compare(b:nodegit.Hashsig):Float;
	function free():Void;
	static var OPTION(default, null) : HashsigOption;
}
extern class HashsigOption {
	var NORMAL(default, null) : Int;
	var IGNORE_WHITESPACE(default, null) : Int;
	var SMART_WHITESPACE(default, null) : Int;
	var ALLOW_SMALL_FILES(default, null) : Int;
}