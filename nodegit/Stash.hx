package nodegit;
@:jsRequire("nodegit", "Stash") extern class Stash {
	static function apply(repo:Dynamic, index:Float, options:Dynamic):Promise<Float>;
	static function applyInitOptions(opts:Dynamic, version:Float):Float;
	static function drop(repo:Dynamic, index:Float):Promise<Dynamic>;
	static function foreach(repo:Dynamic, callback:Dynamic, payload:Dynamic):Promise<Float>;
	static function pop(repo:Dynamic, index:Float, options:Dynamic):Promise<Dynamic>;
	static function save(repo:Dynamic, stasher:Dynamic, message:String, flags:Float):Promise<Dynamic>;
	static var APPLY_FLAGS : Dynamic;
	static var APPLY_PROGRESS : Dynamic;
	static var FLAGS : Dynamic;
}