package nodegit;
@:jsRequire("nodegit", "Stash") extern class Stash {
	static function apply(repo:nodegit.Repository, index:Float, options:nodegit.StashApplyOptions):js.Promise<Float>;
	static function applyInitOptions(opts:nodegit.StashApplyOptions, version:Float):Float;
	static function drop(repo:nodegit.Repository, index:Float):js.Promise<haxe.extern.EitherType<Dynamic, Dynamic>>;
	static function foreach(repo:nodegit.Repository, callback:Dynamic, payload:Dynamic):js.Promise<Float>;
	static function pop(repo:nodegit.Repository, index:Float, options:nodegit.StashApplyOptions):js.Promise<haxe.extern.EitherType<Dynamic, Dynamic>>;
	static function save(repo:nodegit.Repository, stasher:nodegit.Signature, message:String, flags:Float):js.Promise<nodegit.Oid>;
	static var APPLY_FLAGS(default, null) : StashApplyFlags;
	static var APPLY_PROGRESS(default, null) : StashApplyProgress;
	static var FLAGS(default, null) : StashFlags;
}
extern class StashApplyFlags {
	var APPLY_DEFAULT(default, null) : Int;
	var APPLY_REINSTATE_INDEX(default, null) : Int;
}
extern class StashApplyProgress {
	var NONE(default, null) : Int;
	var LOADING_STASH(default, null) : Int;
	var ANALYZE_INDEX(default, null) : Int;
	var ANALYZE_MODIFIED(default, null) : Int;
	var ANALYZE_UNTRACKED(default, null) : Int;
	var CHECKOUT_UNTRACKED(default, null) : Int;
	var CHECKOUT_MODIFIED(default, null) : Int;
	var DONE(default, null) : Int;
}
extern class StashFlags {
	var DEFAULT(default, null) : Int;
	var KEEP_INDEX(default, null) : Int;
	var INCLUDE_UNTRACKED(default, null) : Int;
	var INCLUDE_IGNORED(default, null) : Int;
}