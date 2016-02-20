package nodegit;
@:jsRequire("nodegit", "Stash") extern class Stash {
	static function apply(repo:nodegit.Repository, index:Float, options:nodegit.StashApplyOptions):js.Promise<Float>;
	static function applyInitOptions(opts:nodegit.StashApplyOptions, version:Float):Float;
	static function drop(repo:nodegit.Repository, index:Float):js.Promise<Dynamic>;
	static function foreach(repo:nodegit.Repository, callback:Dynamic, payload:Dynamic):js.Promise<Float>;
	static function pop(repo:nodegit.Repository, index:Float, options:nodegit.StashApplyOptions):js.Promise<Dynamic>;
	static function save(repo:nodegit.Repository, stasher:nodegit.Signature, message:String, flags:Float):js.Promise<nodegit.Oid>;
	static var APPLY_FLAGS : Dynamic;
	static var APPLY_PROGRESS : Dynamic;
	static var FLAGS : Dynamic;
}