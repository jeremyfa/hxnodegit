package nodegit;
@:jsRequire("nodegit", "Status") extern class Status {
	static function byIndex(statuslist:nodegit.StatusList, idx:Float):nodegit.StatusEntry;
	static function file(repo:nodegit.Repository, path:String):Float;
	static function foreach(repo:nodegit.Repository, callback:Dynamic, payload:Dynamic):js.Promise<Float>;
	static function foreachExt(repo:nodegit.Repository, opts:nodegit.StatusOptions, callback:Dynamic, payload:Dynamic):js.Promise<Float>;
	static function shouldIgnore(ignored:Float, repo:nodegit.Repository, path:String):Float;
	static var OPT : StatusOpt;
	static var SHOW : StatusShow;
	static var STATUS : StatusStatus;
}
extern class StatusOpt {
	var INCLUDE_UNTRACKED : Int = 1;
	var INCLUDE_IGNORED : Int = 2;
	var INCLUDE_UNMODIFIED : Int = 4;
	var EXCLUDE_SUBMODULES : Int = 8;
	var RECURSE_UNTRACKED_DIRS : Int = 16;
	var DISABLE_PATHSPEC_MATCH : Int = 32;
	var RECURSE_IGNORED_DIRS : Int = 64;
	var RENAMES_HEAD_TO_INDEX : Int = 128;
	var RENAMES_INDEX_TO_WORKDIR : Int = 256;
	var SORT_CASE_SENSITIVELY : Int = 512;
	var SORT_CASE_INSENSITIVELY : Int = 1024;
	var RENAMES_FROM_REWRITES : Int = 2048;
	var NO_REFRESH : Int = 4096;
	var UPDATE_INDEX : Int = 8192;
	var INCLUDE_UNREADABLE : Int = 16384;
	var INCLUDE_UNREADABLE_AS_UNTRACKED : Int = 32768;
}
extern class StatusShow {
	var INDEX_AND_WORKDIR : Int = 0;
	var INDEX_ONLY : Int = 1;
	var WORKDIR_ONLY : Int = 2;
}
extern class StatusStatus {
	var CURRENT : Int = 0;
	var INDEX_NEW : Int = 1;
	var INDEX_MODIFIED : Int = 2;
	var INDEX_DELETED : Int = 4;
	var INDEX_RENAMED : Int = 8;
	var INDEX_TYPECHANGE : Int = 16;
	var WT_NEW : Int = 128;
	var WT_MODIFIED : Int = 256;
	var WT_DELETED : Int = 512;
	var WT_TYPECHANGE : Int = 1024;
	var WT_RENAMED : Int = 2048;
	var WT_UNREADABLE : Int = 4096;
	var IGNORED : Int = 16384;
	var CONFLICTED : Int = 32768;
}