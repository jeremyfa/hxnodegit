package nodegit;
@:jsRequire("nodegit", "Status") extern class Status {
	static function byIndex(statuslist:nodegit.StatusList, idx:Float):nodegit.StatusEntry;
	static function file(repo:nodegit.Repository, path:String):Float;
	static function foreach(repo:nodegit.Repository, callback:Dynamic, payload:Dynamic):js.Promise<Float>;
	static function foreachExt(repo:nodegit.Repository, opts:nodegit.StatusOptions, callback:Dynamic, payload:Dynamic):js.Promise<Float>;
	static function shouldIgnore(ignored:Float, repo:nodegit.Repository, path:String):Float;
	static var OPT(default, null) : StatusOpt;
	static var SHOW(default, null) : StatusShow;
	static var STATUS(default, null) : StatusStatus;
}
extern class StatusOpt {
	var INCLUDE_UNTRACKED(default, null) : Int = 1;
	var INCLUDE_IGNORED(default, null) : Int = 2;
	var INCLUDE_UNMODIFIED(default, null) : Int = 4;
	var EXCLUDE_SUBMODULES(default, null) : Int = 8;
	var RECURSE_UNTRACKED_DIRS(default, null) : Int = 16;
	var DISABLE_PATHSPEC_MATCH(default, null) : Int = 32;
	var RECURSE_IGNORED_DIRS(default, null) : Int = 64;
	var RENAMES_HEAD_TO_INDEX(default, null) : Int = 128;
	var RENAMES_INDEX_TO_WORKDIR(default, null) : Int = 256;
	var SORT_CASE_SENSITIVELY(default, null) : Int = 512;
	var SORT_CASE_INSENSITIVELY(default, null) : Int = 1024;
	var RENAMES_FROM_REWRITES(default, null) : Int = 2048;
	var NO_REFRESH(default, null) : Int = 4096;
	var UPDATE_INDEX(default, null) : Int = 8192;
	var INCLUDE_UNREADABLE(default, null) : Int = 16384;
	var INCLUDE_UNREADABLE_AS_UNTRACKED(default, null) : Int = 32768;
}
extern class StatusShow {
	var INDEX_AND_WORKDIR(default, null) : Int = 0;
	var INDEX_ONLY(default, null) : Int = 1;
	var WORKDIR_ONLY(default, null) : Int = 2;
}
extern class StatusStatus {
	var CURRENT(default, null) : Int = 0;
	var INDEX_NEW(default, null) : Int = 1;
	var INDEX_MODIFIED(default, null) : Int = 2;
	var INDEX_DELETED(default, null) : Int = 4;
	var INDEX_RENAMED(default, null) : Int = 8;
	var INDEX_TYPECHANGE(default, null) : Int = 16;
	var WT_NEW(default, null) : Int = 128;
	var WT_MODIFIED(default, null) : Int = 256;
	var WT_DELETED(default, null) : Int = 512;
	var WT_TYPECHANGE(default, null) : Int = 1024;
	var WT_RENAMED(default, null) : Int = 2048;
	var WT_UNREADABLE(default, null) : Int = 4096;
	var IGNORED(default, null) : Int = 16384;
	var CONFLICTED(default, null) : Int = 32768;
}