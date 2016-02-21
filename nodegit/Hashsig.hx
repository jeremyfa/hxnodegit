package nodegit;
@:jsRequire("nodegit", "Hashsig") extern class Hashsig {
	static function create(buf:String, buflen:Float, opts:Float):js.Promise<nodegit.Hashsig>;
	static function createFromFile(path:String, opts:Float):js.Promise<nodegit.Hashsig>;
	function compare(b:nodegit.Hashsig):Float;
	function free():Void;
	static var OPTION : HashsigOption;
}
extern class HashsigOption {
	var NORMAL : Int = 0;
	var IGNORE_WHITESPACE : Int = 1;
	var SMART_WHITESPACE : Int = 2;
	var ALLOW_SMALL_FILES : Int = 4;
}