package nodegit;
@:jsRequire("nodegit", "Merge") extern class Merge {
	static function base(repo:nodegit.Repository, one:nodegit.Oid, two:nodegit.Oid):js.Promise<nodegit.Oid>;
	static function bases(repo:nodegit.Repository, one:nodegit.Oid, two:nodegit.Oid):js.Promise<nodegit.Oidarray>;
	static function commits(repo:nodegit.Repository, ourCommit:nodegit.Commit, theirCommit:nodegit.Commit, ?options:nodegit.MergeOptions):Void;
	static function fileInitInput(opts:nodegit.MergeFileInput, version:Float):Float;
	static function initOptions(opts:nodegit.MergeOptions, version:Float):Float;
	static function merge(repo:nodegit.Repository, theirHead:nodegit.Commit, ?mergeOpts:nodegit.MergeOptions, ?checkoutOpts:nodegit.CheckoutOptions):Void;
	static function trees(repo:nodegit.Repository, ancestor_tree:nodegit.Tree, our_tree:nodegit.Tree, their_tree:nodegit.Tree, opts:nodegit.MergeOptions):js.Promise<nodegit.Index>;
	static var ANALYSIS : MergeAnalysis;
	static var FILE_FAVOR : MergeFileFavor;
	static var FILE_FLAGS : MergeFileFlags;
	static var PREFERENCE : MergePreference;
	static var TREE_FLAG : MergeTreeFlag;
}
extern class MergeAnalysis {
	var NONE : Int = 0;
	var NORMAL : Int = 1;
	var UP_TO_DATE : Int = 2;
	var FASTFORWARD : Int = 4;
	var UNBORN : Int = 8;
}
extern class MergeFileFavor {
	var NORMAL : Int = 0;
	var OURS : Int = 1;
	var THEIRS : Int = 2;
	var UNION : Int = 3;
}
extern class MergeFileFlags {
	var FILE_DEFAULT : Int = 0;
	var FILE_STYLE_MERGE : Int = 1;
	var FILE_STYLE_DIFF3 : Int = 2;
	var FILE_SIMPLIFY_ALNUM : Int = 4;
	var FILE_IGNORE_WHITESPACE : Int = 8;
	var FILE_IGNORE_WHITESPACE_CHANGE : Int = 16;
	var FILE_IGNORE_WHITESPACE_EOL : Int = 32;
	var FILE_DIFF_PATIENCE : Int = 64;
	var FILE_DIFF_MINIMAL : Int = 128;
}
extern class MergePreference {
	var NONE : Int = 0;
	var NO_FASTFORWARD : Int = 1;
	var FASTFORWARD_ONLY : Int = 2;
}
extern class MergeTreeFlag {
	var TREE_FIND_RENAMES : Int = 1;
}