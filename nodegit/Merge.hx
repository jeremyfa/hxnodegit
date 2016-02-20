package nodegit;
@:jsRequire("nodegit", "Merge") extern class Merge {
	static function base(repo:nodegit.Repository, one:nodegit.Oid, two:nodegit.Oid):js.Promise<nodegit.Oid>;
	static function bases(repo:nodegit.Repository, one:nodegit.Oid, two:nodegit.Oid):js.Promise<nodegit.Oidarray>;
	static function commits(repo:nodegit.Repository, ourCommit:nodegit.Commit, theirCommit:nodegit.Commit, [options]:nodegit.MergeOptions):Void;
	static function fileInitInput(opts:nodegit.MergeFileInput, version:Float):Float;
	static function initOptions(opts:nodegit.MergeOptions, version:Float):Float;
	static function merge(repo:nodegit.Repository, theirHead:nodegit.Commit, [mergeOpts]:nodegit.MergeOptions, [checkoutOpts]:nodegit.CheckoutOptions):Void;
	static function trees(repo:nodegit.Repository, ancestor_tree:nodegit.Tree, our_tree:nodegit.Tree, their_tree:nodegit.Tree, opts:nodegit.MergeOptions):js.Promise<nodegit.Index>;
	static var ANALYSIS : Dynamic;
	static var FILE_FAVOR : Dynamic;
	static var FILE_FLAGS : Dynamic;
	static var PREFERENCE : Dynamic;
	static var TREE_FLAG : Dynamic;
}