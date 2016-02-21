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
	var NONE(default, null) : Int;
	var NORMAL(default, null) : Int;
	var UP_TO_DATE(default, null) : Int;
	var FASTFORWARD(default, null) : Int;
	var UNBORN(default, null) : Int;
}
extern class MergeFileFavor {
	var NORMAL(default, null) : Int;
	var OURS(default, null) : Int;
	var THEIRS(default, null) : Int;
	var UNION(default, null) : Int;
}
extern class MergeFileFlags {
	var FILE_DEFAULT(default, null) : Int;
	var FILE_STYLE_MERGE(default, null) : Int;
	var FILE_STYLE_DIFF3(default, null) : Int;
	var FILE_SIMPLIFY_ALNUM(default, null) : Int;
	var FILE_IGNORE_WHITESPACE(default, null) : Int;
	var FILE_IGNORE_WHITESPACE_CHANGE(default, null) : Int;
	var FILE_IGNORE_WHITESPACE_EOL(default, null) : Int;
	var FILE_DIFF_PATIENCE(default, null) : Int;
	var FILE_DIFF_MINIMAL(default, null) : Int;
}
extern class MergePreference {
	var NONE(default, null) : Int;
	var NO_FASTFORWARD(default, null) : Int;
	var FASTFORWARD_ONLY(default, null) : Int;
}
extern class MergeTreeFlag {
	var TREE_FIND_RENAMES(default, null) : Int;
}