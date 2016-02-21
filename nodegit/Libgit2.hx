package nodegit;
@:jsRequire("nodegit", "Libgit2") extern class Libgit2 {
	static function features():Float;
	static function init():Float;
	static function opts(option:Float):Float;
	static function shutdown():Dynamic;
	static function version(major:Float, minor:Float, rev:Float):Void;
	static var OPT : Libgit2Opt;
}
extern class Libgit2Opt {
	var GET_MWINDOW_SIZE : Int = 0;
	var SET_MWINDOW_SIZE : Int = 1;
	var GET_MWINDOW_MAPPED_LIMIT : Int = 2;
	var SET_MWINDOW_MAPPED_LIMIT : Int = 3;
	var GET_SEARCH_PATH : Int = 4;
	var SET_SEARCH_PATH : Int = 5;
	var SET_CACHE_OBJECT_LIMIT : Int = 6;
	var SET_CACHE_MAX_SIZE : Int = 7;
	var ENABLE_CACHING : Int = 8;
	var GET_CACHED_MEMORY : Int = 9;
	var GET_TEMPLATE_PATH : Int = 10;
	var SET_TEMPLATE_PATH : Int = 11;
	var SET_SSL_CERT_LOCATIONS : Int = 12;
}