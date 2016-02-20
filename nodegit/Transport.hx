package nodegit;
@:jsRequire("nodegit", "Transport") extern class Transport {
	static function sshWithPaths(owner:Dynamic, payload:Dynamic):Promise<Dynamic>;
	static function unregister(prefix:String):Float;
	function init(version:Float):Float;
	static var FLAGS : Dynamic;
}