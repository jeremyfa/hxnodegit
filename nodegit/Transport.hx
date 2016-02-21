package nodegit;
@:jsRequire("nodegit", "Transport") extern class Transport {
	static function sshWithPaths(owner:nodegit.Remote, payload:Dynamic):js.Promise<nodegit.Transport>;
	static function unregister(prefix:String):Float;
	function init(version:Float):Float;
	static var FLAGS : TransportFlags;
}
extern class TransportFlags {
	var NONE : Int = 0;
}