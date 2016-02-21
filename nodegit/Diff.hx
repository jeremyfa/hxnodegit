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
	static var DELTA : DiffDelta;
	static var FIND : DiffFind;
	static var FLAG : DiffFlag;
	static var FORMAT : DiffFormat;
	static var FORMAT_EMAIL_FLAGS : DiffFormatEmailFlags;
	static var LINE : DiffLine;
	static var OPTION : DiffOption;
	static var STATS_FORMAT : DiffStatsFormat;
}
extern class DiffDelta {
	var UNMODIFIED : Int = 0;
	var ADDED : Int = 1;
	var DELETED : Int = 2;
	var MODIFIED : Int = 3;
	var RENAMED : Int = 4;
	var COPIED : Int = 5;
	var IGNORED : Int = 6;
	var UNTRACKED : Int = 7;
	var TYPECHANGE : Int = 8;
	var UNREADABLE : Int = 9;
	var CONFLICTED : Int = 10;
}
extern class DiffFind {
	var BY_CONFIG : Int = 0;
	var RENAMES : Int = 1;
	var RENAMES_FROM_REWRITES : Int = 2;
	var COPIES : Int = 4;
	var COPIES_FROM_UNMODIFIED : Int = 8;
	var REWRITES : Int = 16;
	var BREAK_REWRITES : Int = 32;
	var AND_BREAK_REWRITES : Int = 48;
	var FOR_UNTRACKED : Int = 64;
	var ALL : Int = 255;
	var IGNORE_LEADING_WHITESPACE : Int = 0;
	var IGNORE_WHITESPACE : Int = 4096;
	var DONT_IGNORE_WHITESPACE : Int = 8192;
	var EXACT_MATCH_ONLY : Int = 16384;
	var BREAK_REWRITES_FOR_RENAMES_ONLY : Int = 32768;
	var REMOVE_UNMODIFIED : Int = 65536;
}
extern class DiffFlag {
	var BINARY : Int = 1;
	var NOT_BINARY : Int = 2;
	var VALID_ID : Int = 4;
	var EXISTS : Int = 8;
}
extern class DiffFormat {
	var PATCH : Int = 1;
	var PATCH_HEADER : Int = 2;
	var RAW : Int = 3;
	var NAME_ONLY : Int = 4;
	var NAME_STATUS : Int = 5;
}
extern class DiffFormatEmailFlags {
	var FORMAT_EMAIL_NONE : Int = 0;
	var FORMAT_EMAIL_EXCLUDE_SUBJECT_PATCH_MARKER : Int = 1;
}
extern class DiffLine {
	var CONTEXT : Int = 32;
	var ADDITION : Int = 43;
	var DELETION : Int = 45;
	var CONTEXT_EOFNL : Int = 61;
	var ADD_EOFNL : Int = 62;
	var DEL_EOFNL : Int = 60;
	var FILE_HDR : Int = 70;
	var HUNK_HDR : Int = 72;
	var BINARY : Int = 66;
}
extern class DiffOption {
	var NORMAL : Int = 0;
	var REVERSE : Int = 1;
	var INCLUDE_IGNORED : Int = 2;
	var RECURSE_IGNORED_DIRS : Int = 4;
	var INCLUDE_UNTRACKED : Int = 8;
	var RECURSE_UNTRACKED_DIRS : Int = 16;
	var INCLUDE_UNMODIFIED : Int = 32;
	var INCLUDE_TYPECHANGE : Int = 64;
	var INCLUDE_TYPECHANGE_TREES : Int = 128;
	var IGNORE_FILEMODE : Int = 256;
	var IGNORE_SUBMODULES : Int = 512;
	var IGNORE_CASE : Int = 1024;
	var INCLUDE_CASECHANGE : Int = 2048;
	var DISABLE_PATHSPEC_MATCH : Int = 4096;
	var SKIP_BINARY_CHECK : Int = 8192;
	var ENABLE_FAST_UNTRACKED_DIRS : Int = 16384;
	var UPDATE_INDEX : Int = 32768;
	var INCLUDE_UNREADABLE : Int = 65536;
	var INCLUDE_UNREADABLE_AS_UNTRACKED : Int = 131072;
	var FORCE_TEXT : Int = 1048576;
	var FORCE_BINARY : Int = 2097152;
	var IGNORE_WHITESPACE : Int = 4194304;
	var IGNORE_WHITESPACE_CHANGE : Int = 8388608;
	var IGNORE_WHITESPACE_EOL : Int = 16777216;
	var SHOW_UNTRACKED_CONTENT : Int = 33554432;
	var SHOW_UNMODIFIED : Int = 67108864;
	var PATIENCE : Int = 268435456;
	var MINIMAL : Int = 536870912;
	var SHOW_BINARY : Int = 1073741824;
}
extern class DiffStatsFormat {
	var STATS_NONE : Int = 0;
	var STATS_FULL : Int = 1;
	var STATS_SHORT : Int = 2;
	var STATS_NUMBER : Int = 4;
	var STATS_INCLUDE_SUMMARY : Int = 8;
}