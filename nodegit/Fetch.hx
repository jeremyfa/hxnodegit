package nodegit;
@:jsRequire("nodegit", "Fetch") extern class Fetch {
	static function initOptions(opts:nodegit.FetchOptions, version:Float):Float;
	static var PRUNE : FetchPrune;
}
extern class FetchPrune {
	var GIT_FETCH_PRUNE_UNSPECIFIED : Int = 0;
	var GIT_FETCH_PRUNE : Int = 1;
	var GIT_FETCH_NO_PRUNE : Int = 2;
}