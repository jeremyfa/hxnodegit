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
	var INCLUDE_UNTRACKED(default, null) : Int;
	var INCLUDE_IGNORED(default, null) : Int;
	var INCLUDE_UNMODIFIED(default, null) : Int;
	var EXCLUDE_SUBMODULES(default, null) : Int;
	var RECURSE_UNTRACKED_DIRS(default, null) : Int;
	var DISABLE_PATHSPEC_MATCH(default, null) : Int;
	var RECURSE_IGNORED_DIRS(default, null) : Int;
	var RENAMES_HEAD_TO_INDEX(default, null) : Int;
	var RENAMES_INDEX_TO_WORKDIR(default, null) : Int;
	var SORT_CASE_SENSITIVELY(default, null) : Int;
	var SORT_CASE_INSENSITIVELY(default, null) : Int;
	var RENAMES_FROM_REWRITES(default, null) : Int;
	var NO_REFRESH(default, null) : Int;
	var UPDATE_INDEX(default, null) : Int;
	var INCLUDE_UNREADABLE(default, null) : Int;
	var INCLUDE_UNREADABLE_AS_UNTRACKED(default, null) : Int;
}
extern class StatusShow {
	var INDEX_AND_WORKDIR(default, null) : Int;
	var INDEX_ONLY(default, null) : Int;
	var WORKDIR_ONLY(default, null) : Int;
}
extern class StatusStatus {
	var CURRENT(default, null) : Int;
	var INDEX_NEW(default, null) : Int;
	var INDEX_MODIFIED(default, null) : Int;
	var INDEX_DELETED(default, null) : Int;
	var INDEX_RENAMED(default, null) : Int;
	var INDEX_TYPECHANGE(default, null) : Int;
	var WT_NEW(default, null) : Int;
	var WT_MODIFIED(default, null) : Int;
	var WT_DELETED(default, null) : Int;
	var WT_TYPECHANGE(default, null) : Int;
	var WT_RENAMED(default, null) : Int;
	var WT_UNREADABLE(default, null) : Int;
	var IGNORED(default, null) : Int;
	var CONFLICTED(default, null) : Int;
}