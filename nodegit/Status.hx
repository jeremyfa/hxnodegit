package nodegit;
@:jsRequire("nodegit", "Status") extern class Status {
	static function byIndex(statuslist:nodegit.StatusList, idx:Float):nodegit.StatusEntry;
	static function file(repo:nodegit.Repository, path:String):Float;
	static function foreach(repo:nodegit.Repository, callback:Dynamic, payload:Dynamic):js.Promise<Float>;
	static function foreachExt(repo:nodegit.Repository, opts:nodegit.StatusOptions, callback:Dynamic, payload:Dynamic):js.Promise<Float>;
	static function shouldIgnore(ignored:Float, repo:nodegit.Repository, path:String):Float;
	static var OPT : Dynamic;
	static var SHOW : Dynamic;
	static var STATUS : Dynamic;
}