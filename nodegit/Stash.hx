package nodegit;
@:jsRequire("nodegit", "Stash") extern class Stash {
	static function apply(repo:nodegit.Repository, index:Float, options:nodegit.StashApplyOptions):js.Promise<Float>;
	static function applyInitOptions(opts:nodegit.StashApplyOptions, version:Float):Float;
	static function drop(repo:nodegit.Repository, index:Float):js.Promise<Dynamic>;
	static function foreach(repo:nodegit.Repository, callback:Dynamic, payload:Dynamic):js.Promise<Float>;
	static function pop(repo:nodegit.Repository, index:Float, options:nodegit.StashApplyOptions):js.Promise<Dynamic>;
	static function save(repo:nodegit.Repository, stasher:nodegit.Signature, message:String, flags:Float):js.Promise<nodegit.Oid>;
	static var APPLY_FLAGS(default, null) : StashApplyFlags;
	static var APPLY_PROGRESS(default, null) : StashApplyProgress;
	static var FLAGS(default, null) : StashFlags;
}
extern class StashApplyFlags {
	var APPLY_DEFAULT(default, null) : Int = 0;
	var APPLY_REINSTATE_INDEX(default, null) : Int = 1;
}
extern class StashApplyProgress {
	var NONE(default, null) : Int = 0;
	var LOADING_STASH(default, null) : Int = 1;
	var ANALYZE_INDEX(default, null) : Int = 2;
	var ANALYZE_MODIFIED(default, null) : Int = 3;
	var ANALYZE_UNTRACKED(default, null) : Int = 4;
	var CHECKOUT_UNTRACKED(default, null) : Int = 5;
	var CHECKOUT_MODIFIED(default, null) : Int = 6;
	var DONE(default, null) : Int = 7;
}
extern class StashFlags {
	var DEFAULT(default, null) : Int = 0;
	var KEEP_INDEX(default, null) : Int = 1;
	var INCLUDE_UNTRACKED(default, null) : Int = 2;
	var INCLUDE_IGNORED(default, null) : Int = 4;
}