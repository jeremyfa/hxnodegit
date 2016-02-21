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
	var NONE(default, null) : Int = 0;
	var CONFLICT(default, null) : Int = 1;
	var DIRTY(default, null) : Int = 2;
	var UPDATED(default, null) : Int = 4;
	var UNTRACKED(default, null) : Int = 8;
	var IGNORED(default, null) : Int = 16;
	var ALL(default, null) : Int = 65535;
}
extern class CheckoutStrategy {
	var NONE(default, null) : Int = 0;
	var SAFE(default, null) : Int = 1;
	var FORCE(default, null) : Int = 2;
	var RECREATE_MISSING(default, null) : Int = 4;
	var ALLOW_CONFLICTS(default, null) : Int = 16;
	var REMOVE_UNTRACKED(default, null) : Int = 32;
	var REMOVE_IGNORED(default, null) : Int = 64;
	var UPDATE_ONLY(default, null) : Int = 128;
	var DONT_UPDATE_INDEX(default, null) : Int = 256;
	var NO_REFRESH(default, null) : Int = 512;
	var SKIP_UNMERGED(default, null) : Int = 1024;
	var USE_OURS(default, null) : Int = 2048;
	var USE_THEIRS(default, null) : Int = 4096;
	var DISABLE_PATHSPEC_MATCH(default, null) : Int = 8192;
	var SKIP_LOCKED_DIRECTORIES(default, null) : Int = 262144;
	var DONT_OVERWRITE_IGNORED(default, null) : Int = 524288;
	var CONFLICT_STYLE_MERGE(default, null) : Int = 1048576;
	var CONFLICT_STYLE_DIFF3(default, null) : Int = 2097152;
	var DONT_REMOVE_EXISTING(default, null) : Int = 4194304;
	var DONT_WRITE_INDEX(default, null) : Int = 8388608;
	var UPDATE_SUBMODULES(default, null) : Int = 65536;
	var UPDATE_SUBMODULES_IF_CHANGED(default, null) : Int = 131072;
}