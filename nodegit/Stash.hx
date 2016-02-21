package nodegit;
@:jsRequire("nodegit", "Stash") extern class Stash {
	static function apply(repo:nodegit.Repository, index:Float, options:nodegit.StashApplyOptions):js.Promise<Float>;
	static function applyInitOptions(opts:nodegit.StashApplyOptions, version:Float):Float;
	static function drop(repo:nodegit.Repository, index:Float):js.Promise<Dynamic>;
	static function foreach(repo:nodegit.Repository, callback:Dynamic, payload:Dynamic):js.Promise<Float>;
	static function pop(repo:nodegit.Repository, index:Float, options:nodegit.StashApplyOptions):js.Promise<Dynamic>;
	static function save(repo:nodegit.Repository, stasher:nodegit.Signature, message:String, flags:Float):js.Promise<nodegit.Oid>;
	static var APPLY_FLAGS : StashApplyFlags;
	static var APPLY_PROGRESS : StashApplyProgress;
	static var FLAGS : StashFlags;
}
extern class StashApplyFlags {
	var APPLY_DEFAULT : Int = 0;
	var APPLY_REINSTATE_INDEX : Int = 1;
}
extern class StashApplyProgress {
	var NONE : Int = 0;
	var LOADING_STASH : Int = 1;
	var ANALYZE_INDEX : Int = 2;
	var ANALYZE_MODIFIED : Int = 3;
	var ANALYZE_UNTRACKED : Int = 4;
	var CHECKOUT_UNTRACKED : Int = 5;
	var CHECKOUT_MODIFIED : Int = 6;
	var DONE : Int = 7;
}
extern class StashFlags {
	var DEFAULT : Int = 0;
	var KEEP_INDEX : Int = 1;
	var INCLUDE_UNTRACKED : Int = 2;
	var INCLUDE_IGNORED : Int = 4;
}