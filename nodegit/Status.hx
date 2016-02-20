package nodegit;
@:jsRequire("nodegit", "Status") extern class Status {
	static function byIndex(statuslist:Dynamic, idx:Float):Dynamic;
	static function file(repo:Dynamic, path:String):Float;
	static function foreach(repo:Dynamic, callback:Dynamic, payload:Dynamic):Promise<Float>;
	static function foreachExt(repo:Dynamic, opts:Dynamic, callback:Dynamic, payload:Dynamic):Promise<Float>;
	static function shouldIgnore(ignored:Float, repo:Dynamic, path:String):Float;
	static var OPT : Dynamic;
	static var SHOW : Dynamic;
	static var STATUS : Dynamic;
}