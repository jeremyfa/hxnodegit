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
	function patches():js.Promise<nodegit.Array<ConvenientPatch>>;
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
	var UNMODIFIED(default, null) : Int = 0;
	var ADDED(default, null) : Int = 1;
	var DELETED(default, null) : Int = 2;
	var MODIFIED(default, null) : Int = 3;
	var RENAMED(default, null) : Int = 4;
	var COPIED(default, null) : Int = 5;
	var IGNORED(default, null) : Int = 6;
	var UNTRACKED(default, null) : Int = 7;
	var TYPECHANGE(default, null) : Int = 8;
	var UNREADABLE(default, null) : Int = 9;
	var CONFLICTED(default, null) : Int = 10;
}
extern class DiffFind {
	var BY_CONFIG(default, null) : Int = 0;
	var RENAMES(default, null) : Int = 1;
	var RENAMES_FROM_REWRITES(default, null) : Int = 2;
	var COPIES(default, null) : Int = 4;
	var COPIES_FROM_UNMODIFIED(default, null) : Int = 8;
	var REWRITES(default, null) : Int = 16;
	var BREAK_REWRITES(default, null) : Int = 32;
	var AND_BREAK_REWRITES(default, null) : Int = 48;
	var FOR_UNTRACKED(default, null) : Int = 64;
	var ALL(default, null) : Int = 255;
	var IGNORE_LEADING_WHITESPACE(default, null) : Int = 0;
	var IGNORE_WHITESPACE(default, null) : Int = 4096;
	var DONT_IGNORE_WHITESPACE(default, null) : Int = 8192;
	var EXACT_MATCH_ONLY(default, null) : Int = 16384;
	var BREAK_REWRITES_FOR_RENAMES_ONLY(default, null) : Int = 32768;
	var REMOVE_UNMODIFIED(default, null) : Int = 65536;
}
extern class DiffFlag {
	var BINARY(default, null) : Int = 1;
	var NOT_BINARY(default, null) : Int = 2;
	var VALID_ID(default, null) : Int = 4;
	var EXISTS(default, null) : Int = 8;
}
extern class DiffFormat {
	var PATCH(default, null) : Int = 1;
	var PATCH_HEADER(default, null) : Int = 2;
	var RAW(default, null) : Int = 3;
	var NAME_ONLY(default, null) : Int = 4;
	var NAME_STATUS(default, null) : Int = 5;
}
extern class DiffFormatEmailFlags {
	var FORMAT_EMAIL_NONE(default, null) : Int = 0;
	var FORMAT_EMAIL_EXCLUDE_SUBJECT_PATCH_MARKER(default, null) : Int = 1;
}
extern class DiffLine {
	var CONTEXT(default, null) : Int = 32;
	var ADDITION(default, null) : Int = 43;
	var DELETION(default, null) : Int = 45;
	var CONTEXT_EOFNL(default, null) : Int = 61;
	var ADD_EOFNL(default, null) : Int = 62;
	var DEL_EOFNL(default, null) : Int = 60;
	var FILE_HDR(default, null) : Int = 70;
	var HUNK_HDR(default, null) : Int = 72;
	var BINARY(default, null) : Int = 66;
}
extern class DiffOption {
	var NORMAL(default, null) : Int = 0;
	var REVERSE(default, null) : Int = 1;
	var INCLUDE_IGNORED(default, null) : Int = 2;
	var RECURSE_IGNORED_DIRS(default, null) : Int = 4;
	var INCLUDE_UNTRACKED(default, null) : Int = 8;
	var RECURSE_UNTRACKED_DIRS(default, null) : Int = 16;
	var INCLUDE_UNMODIFIED(default, null) : Int = 32;
	var INCLUDE_TYPECHANGE(default, null) : Int = 64;
	var INCLUDE_TYPECHANGE_TREES(default, null) : Int = 128;
	var IGNORE_FILEMODE(default, null) : Int = 256;
	var IGNORE_SUBMODULES(default, null) : Int = 512;
	var IGNORE_CASE(default, null) : Int = 1024;
	var INCLUDE_CASECHANGE(default, null) : Int = 2048;
	var DISABLE_PATHSPEC_MATCH(default, null) : Int = 4096;
	var SKIP_BINARY_CHECK(default, null) : Int = 8192;
	var ENABLE_FAST_UNTRACKED_DIRS(default, null) : Int = 16384;
	var UPDATE_INDEX(default, null) : Int = 32768;
	var INCLUDE_UNREADABLE(default, null) : Int = 65536;
	var INCLUDE_UNREADABLE_AS_UNTRACKED(default, null) : Int = 131072;
	var FORCE_TEXT(default, null) : Int = 1048576;
	var FORCE_BINARY(default, null) : Int = 2097152;
	var IGNORE_WHITESPACE(default, null) : Int = 4194304;
	var IGNORE_WHITESPACE_CHANGE(default, null) : Int = 8388608;
	var IGNORE_WHITESPACE_EOL(default, null) : Int = 16777216;
	var SHOW_UNTRACKED_CONTENT(default, null) : Int = 33554432;
	var SHOW_UNMODIFIED(default, null) : Int = 67108864;
	var PATIENCE(default, null) : Int = 268435456;
	var MINIMAL(default, null) : Int = 536870912;
	var SHOW_BINARY(default, null) : Int = 1073741824;
}
extern class DiffStatsFormat {
	var STATS_NONE(default, null) : Int = 0;
	var STATS_FULL(default, null) : Int = 1;
	var STATS_SHORT(default, null) : Int = 2;
	var STATS_NUMBER(default, null) : Int = 4;
	var STATS_INCLUDE_SUMMARY(default, null) : Int = 8;
}