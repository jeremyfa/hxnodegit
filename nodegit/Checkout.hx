package nodegit;
@:jsRequire("nodegit", "Checkout") extern class Checkout {
	static function head(repo:nodegit.Repository, ?options:nodegit.CheckoutOptions):js.Promise<Void>;
	static function index(repo:nodegit.Repository, The:nodegit.Index, ?options:nodegit.CheckoutOptions):js.Promise<Void>;
	static function initOptions(opts:nodegit.CheckoutOptions, version:Float):Float;
	static function tree(repo:nodegit.Repository, treeish:Dynamic, ?options:nodegit.CheckoutOptions):js.Promise<Void>;
	static var NOTIFY : CheckoutNotify;
	static var STRATEGY : CheckoutStrategy;
}
extern class CheckoutNotify {
	var NONE : Int = 0;
	var CONFLICT : Int = 1;
	var DIRTY : Int = 2;
	var UPDATED : Int = 4;
	var UNTRACKED : Int = 8;
	var IGNORED : Int = 16;
	var ALL : Int = 65535;
}
extern class CheckoutStrategy {
	var NONE : Int = 0;
	var SAFE : Int = 1;
	var FORCE : Int = 2;
	var RECREATE_MISSING : Int = 4;
	var ALLOW_CONFLICTS : Int = 16;
	var REMOVE_UNTRACKED : Int = 32;
	var REMOVE_IGNORED : Int = 64;
	var UPDATE_ONLY : Int = 128;
	var DONT_UPDATE_INDEX : Int = 256;
	var NO_REFRESH : Int = 512;
	var SKIP_UNMERGED : Int = 1024;
	var USE_OURS : Int = 2048;
	var USE_THEIRS : Int = 4096;
	var DISABLE_PATHSPEC_MATCH : Int = 8192;
	var SKIP_LOCKED_DIRECTORIES : Int = 262144;
	var DONT_OVERWRITE_IGNORED : Int = 524288;
	var CONFLICT_STYLE_MERGE : Int = 1048576;
	var CONFLICT_STYLE_DIFF3 : Int = 2097152;
	var DONT_REMOVE_EXISTING : Int = 4194304;
	var DONT_WRITE_INDEX : Int = 8388608;
	var UPDATE_SUBMODULES : Int = 65536;
	var UPDATE_SUBMODULES_IF_CHANGED : Int = 131072;
}