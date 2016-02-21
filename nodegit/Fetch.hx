package nodegit;
@:jsRequire("nodegit", "Fetch") extern class Fetch {
	static function initOptions(opts:nodegit.FetchOptions, version:Float):Float;
	static var PRUNE(default, null) : FetchPrune;
}
extern class FetchPrune {
	var GIT_FETCH_PRUNE_UNSPECIFIED(default, null) : Int = 0;
	var GIT_FETCH_PRUNE(default, null) : Int = 1;
	var GIT_FETCH_NO_PRUNE(default, null) : Int = 2;
}