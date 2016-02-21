package nodegit;
@:jsRequire("nodegit", "Libgit2") extern class Libgit2 {
	static function features():Float;
	static function init():Float;
	static function opts(option:Float):Float;
	static function shutdown():Dynamic;
	static function version(major:Float, minor:Float, rev:Float):Void;
	static var OPT(default, null) : Libgit2Opt;
}
extern class Libgit2Opt {
	var GET_MWINDOW_SIZE(default, null) : Int = 0;
	var SET_MWINDOW_SIZE(default, null) : Int = 1;
	var GET_MWINDOW_MAPPED_LIMIT(default, null) : Int = 2;
	var SET_MWINDOW_MAPPED_LIMIT(default, null) : Int = 3;
	var GET_SEARCH_PATH(default, null) : Int = 4;
	var SET_SEARCH_PATH(default, null) : Int = 5;
	var SET_CACHE_OBJECT_LIMIT(default, null) : Int = 6;
	var SET_CACHE_MAX_SIZE(default, null) : Int = 7;
	var ENABLE_CACHING(default, null) : Int = 8;
	var GET_CACHED_MEMORY(default, null) : Int = 9;
	var GET_TEMPLATE_PATH(default, null) : Int = 10;
	var SET_TEMPLATE_PATH(default, null) : Int = 11;
	var SET_SSL_CERT_LOCATIONS(default, null) : Int = 12;
}