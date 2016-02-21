package nodegit;
@:jsRequire("nodegit", "Merge") extern class Merge {
	static function base(repo:nodegit.Repository, one:nodegit.Oid, two:nodegit.Oid):js.Promise<nodegit.Oid>;
	static function bases(repo:nodegit.Repository, one:nodegit.Oid, two:nodegit.Oid):js.Promise<nodegit.Oidarray>;
	static function commits(repo:nodegit.Repository, ourCommit:nodegit.Commit, theirCommit:nodegit.Commit, ?options:nodegit.MergeOptions):Void;
	static function fileInitInput(opts:nodegit.MergeFileInput, version:Float):Float;
	static function initOptions(opts:nodegit.MergeOptions, version:Float):Float;
	static function merge(repo:nodegit.Repository, theirHead:nodegit.Commit, ?mergeOpts:nodegit.MergeOptions, ?checkoutOpts:nodegit.CheckoutOptions):Void;
	static function trees(repo:nodegit.Repository, ancestor_tree:nodegit.Tree, our_tree:nodegit.Tree, their_tree:nodegit.Tree, opts:nodegit.MergeOptions):js.Promise<nodegit.Index>;
	static var ANALYSIS(default, null) : MergeAnalysis;
	static var FILE_FAVOR(default, null) : MergeFileFavor;
	static var FILE_FLAGS(default, null) : MergeFileFlags;
	static var PREFERENCE(default, null) : MergePreference;
	static var TREE_FLAG(default, null) : MergeTreeFlag;
}
extern class MergeAnalysis {
	var NONE(default, null) : Int = 0;
	var NORMAL(default, null) : Int = 1;
	var UP_TO_DATE(default, null) : Int = 2;
	var FASTFORWARD(default, null) : Int = 4;
	var UNBORN(default, null) : Int = 8;
}
extern class MergeFileFavor {
	var NORMAL(default, null) : Int = 0;
	var OURS(default, null) : Int = 1;
	var THEIRS(default, null) : Int = 2;
	var UNION(default, null) : Int = 3;
}
extern class MergeFileFlags {
	var FILE_DEFAULT(default, null) : Int = 0;
	var FILE_STYLE_MERGE(default, null) : Int = 1;
	var FILE_STYLE_DIFF3(default, null) : Int = 2;
	var FILE_SIMPLIFY_ALNUM(default, null) : Int = 4;
	var FILE_IGNORE_WHITESPACE(default, null) : Int = 8;
	var FILE_IGNORE_WHITESPACE_CHANGE(default, null) : Int = 16;
	var FILE_IGNORE_WHITESPACE_EOL(default, null) : Int = 32;
	var FILE_DIFF_PATIENCE(default, null) : Int = 64;
	var FILE_DIFF_MINIMAL(default, null) : Int = 128;
}
extern class MergePreference {
	var NONE(default, null) : Int = 0;
	var NO_FASTFORWARD(default, null) : Int = 1;
	var FASTFORWARD_ONLY(default, null) : Int = 2;
}
extern class MergeTreeFlag {
	var TREE_FIND_RENAMES(default, null) : Int = 1;
}