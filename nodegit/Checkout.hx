package nodegit;
@:jsRequire("nodegit", "Checkout") extern class Checkout {
	static function head(repo:nodegit.Repository, ?options:nodegit.CheckoutOptions):js.Promise<Void>;
	static function index(repo:nodegit.Repository, The:nodegit.Index, ?options:nodegit.CheckoutOptions):js.Promise<Void>;
	static function initOptions(opts:nodegit.CheckoutOptions, version:Float):Float;
	static function tree(repo:nodegit.Repository, treeish:Dynamic, ?options:nodegit.CheckoutOptions):js.Promise<Void>;
	static var NOTIFY(default, null) : CheckoutNotify;
	static var STRATEGY(default, null) : CheckoutStrategy;
}
extern class CheckoutNotify {
	var NONE(default, null) : Int;
	var CONFLICT(default, null) : Int;
	var DIRTY(default, null) : Int;
	var UPDATED(default, null) : Int;
	var UNTRACKED(default, null) : Int;
	var IGNORED(default, null) : Int;
	var ALL(default, null) : Int;
}
extern class CheckoutStrategy {
	var NONE(default, null) : Int;
	var SAFE(default, null) : Int;
	var FORCE(default, null) : Int;
	var RECREATE_MISSING(default, null) : Int;
	var ALLOW_CONFLICTS(default, null) : Int;
	var REMOVE_UNTRACKED(default, null) : Int;
	var REMOVE_IGNORED(default, null) : Int;
	var UPDATE_ONLY(default, null) : Int;
	var DONT_UPDATE_INDEX(default, null) : Int;
	var NO_REFRESH(default, null) : Int;
	var SKIP_UNMERGED(default, null) : Int;
	var USE_OURS(default, null) : Int;
	var USE_THEIRS(default, null) : Int;
	var DISABLE_PATHSPEC_MATCH(default, null) : Int;
	var SKIP_LOCKED_DIRECTORIES(default, null) : Int;
	var DONT_OVERWRITE_IGNORED(default, null) : Int;
	var CONFLICT_STYLE_MERGE(default, null) : Int;
	var CONFLICT_STYLE_DIFF3(default, null) : Int;
	var DONT_REMOVE_EXISTING(default, null) : Int;
	var DONT_WRITE_INDEX(default, null) : Int;
	var UPDATE_SUBMODULES(default, null) : Int;
	var UPDATE_SUBMODULES_IF_CHANGED(default, null) : Int;
}