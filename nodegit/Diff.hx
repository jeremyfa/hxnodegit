package nodegit;
@:jsRequire("nodegit", "Diff") extern class Diff {
	static function blobToBuffer(old_blob:nodegit.Blob, old_as_path:String, buffer:String, buffer_len:Float, buffer_as_path:String, options:nodegit.DiffOptions, file_cb:Dynamic, binary_cb:Dynamic, hunk_cb:Dynamic, line_cb:Dynamic, payload:Dynamic):js.Promise<Float>;
	static function indexToWorkdir(repo:nodegit.Repository, index:nodegit.Index, opts:nodegit.DiffOptions):js.Promise<nodegit.Diff>;
	static function treeToIndex(repo:nodegit.Repository, old_tree:nodegit.Tree, index:nodegit.Index, opts:nodegit.DiffOptions):js.Promise<nodegit.Diff>;
	static function treeToTree(repo:nodegit.Repository, old_tree:nodegit.Tree, new_tree:nodegit.Tree, opts:nodegit.DiffOptions):js.Promise<nodegit.Diff>;
	static function treeToWorkdir(repo:nodegit.Repository, old_tree:nodegit.Tree, opts:nodegit.DiffOptions):js.Promise<nodegit.Diff>;
	static function treeToWorkdirWithIndex(repo:nodegit.Repository, old_tree:nodegit.Tree, opts:nodegit.DiffOptions):js.Promise<nodegit.Diff>;
	function findSimilar(options:nodegit.DiffFindOptions):js.Promise<Float>;
	function getDelta(idx:Float):nodegit.DiffDelta;
	function getPerfdata():js.Promise<nodegit.DiffPerfdata>;
	function numDeltas():Float;
	function patches():js.Promise<Array<nodegit.ConvenientPatch>>;
	static var DELTA(default, null) : DiffDelta;
	static var FIND(default, null) : DiffFind;
	static var FLAG(default, null) : DiffFlag;
	static var FORMAT(default, null) : DiffFormat;
	static var FORMAT_EMAIL_FLAGS(default, null) : DiffFormatEmailFlags;
	static var LINE(default, null) : DiffLine;
	static var OPTION(default, null) : DiffOption;
	static var STATS_FORMAT(default, null) : DiffStatsFormat;
}
extern class DiffDelta {
	var UNMODIFIED(default, null) : Int;
	var ADDED(default, null) : Int;
	var DELETED(default, null) : Int;
	var MODIFIED(default, null) : Int;
	var RENAMED(default, null) : Int;
	var COPIED(default, null) : Int;
	var IGNORED(default, null) : Int;
	var UNTRACKED(default, null) : Int;
	var TYPECHANGE(default, null) : Int;
	var UNREADABLE(default, null) : Int;
	var CONFLICTED(default, null) : Int;
}
extern class DiffFind {
	var BY_CONFIG(default, null) : Int;
	var RENAMES(default, null) : Int;
	var RENAMES_FROM_REWRITES(default, null) : Int;
	var COPIES(default, null) : Int;
	var COPIES_FROM_UNMODIFIED(default, null) : Int;
	var REWRITES(default, null) : Int;
	var BREAK_REWRITES(default, null) : Int;
	var AND_BREAK_REWRITES(default, null) : Int;
	var FOR_UNTRACKED(default, null) : Int;
	var ALL(default, null) : Int;
	var IGNORE_LEADING_WHITESPACE(default, null) : Int;
	var IGNORE_WHITESPACE(default, null) : Int;
	var DONT_IGNORE_WHITESPACE(default, null) : Int;
	var EXACT_MATCH_ONLY(default, null) : Int;
	var BREAK_REWRITES_FOR_RENAMES_ONLY(default, null) : Int;
	var REMOVE_UNMODIFIED(default, null) : Int;
}
extern class DiffFlag {
	var BINARY(default, null) : Int;
	var NOT_BINARY(default, null) : Int;
	var VALID_ID(default, null) : Int;
	var EXISTS(default, null) : Int;
}
extern class DiffFormat {
	var PATCH(default, null) : Int;
	var PATCH_HEADER(default, null) : Int;
	var RAW(default, null) : Int;
	var NAME_ONLY(default, null) : Int;
	var NAME_STATUS(default, null) : Int;
}
extern class DiffFormatEmailFlags {
	var FORMAT_EMAIL_NONE(default, null) : Int;
	var FORMAT_EMAIL_EXCLUDE_SUBJECT_PATCH_MARKER(default, null) : Int;
}
extern class DiffLine {
	var CONTEXT(default, null) : Int;
	var ADDITION(default, null) : Int;
	var DELETION(default, null) : Int;
	var CONTEXT_EOFNL(default, null) : Int;
	var ADD_EOFNL(default, null) : Int;
	var DEL_EOFNL(default, null) : Int;
	var FILE_HDR(default, null) : Int;
	var HUNK_HDR(default, null) : Int;
	var BINARY(default, null) : Int;
}
extern class DiffOption {
	var NORMAL(default, null) : Int;
	var REVERSE(default, null) : Int;
	var INCLUDE_IGNORED(default, null) : Int;
	var RECURSE_IGNORED_DIRS(default, null) : Int;
	var INCLUDE_UNTRACKED(default, null) : Int;
	var RECURSE_UNTRACKED_DIRS(default, null) : Int;
	var INCLUDE_UNMODIFIED(default, null) : Int;
	var INCLUDE_TYPECHANGE(default, null) : Int;
	var INCLUDE_TYPECHANGE_TREES(default, null) : Int;
	var IGNORE_FILEMODE(default, null) : Int;
	var IGNORE_SUBMODULES(default, null) : Int;
	var IGNORE_CASE(default, null) : Int;
	var INCLUDE_CASECHANGE(default, null) : Int;
	var DISABLE_PATHSPEC_MATCH(default, null) : Int;
	var SKIP_BINARY_CHECK(default, null) : Int;
	var ENABLE_FAST_UNTRACKED_DIRS(default, null) : Int;
	var UPDATE_INDEX(default, null) : Int;
	var INCLUDE_UNREADABLE(default, null) : Int;
	var INCLUDE_UNREADABLE_AS_UNTRACKED(default, null) : Int;
	var FORCE_TEXT(default, null) : Int;
	var FORCE_BINARY(default, null) : Int;
	var IGNORE_WHITESPACE(default, null) : Int;
	var IGNORE_WHITESPACE_CHANGE(default, null) : Int;
	var IGNORE_WHITESPACE_EOL(default, null) : Int;
	var SHOW_UNTRACKED_CONTENT(default, null) : Int;
	var SHOW_UNMODIFIED(default, null) : Int;
	var PATIENCE(default, null) : Int;
	var MINIMAL(default, null) : Int;
	var SHOW_BINARY(default, null) : Int;
}
extern class DiffStatsFormat {
	var STATS_NONE(default, null) : Int;
	var STATS_FULL(default, null) : Int;
	var STATS_SHORT(default, null) : Int;
	var STATS_NUMBER(default, null) : Int;
	var STATS_INCLUDE_SUMMARY(default, null) : Int;
}