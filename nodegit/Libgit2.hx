package nodegit;
@:jsRequire("nodegit", "Libgit2") extern class Libgit2 {
	static function features():Float;
	static function init():Float;
	static function opts(option:Float):Float;
	static function shutdown():Dynamic;
	static function version(major:Float, minor:Float, rev:Float):Void;
	static var OPT : Dynamic;
}