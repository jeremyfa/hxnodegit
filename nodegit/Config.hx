package nodegit;
@:jsRequire("nodegit", "Config") extern class Config {
	static function openDefault():js.Promise<nodegit.Config>;
	function getStringBuf(name:String):js.Promise<nodegit.Buf>;
	function setInt64(name:String, value:Float):Float;
	function setMultivar(name:String, regexp:String, value:String):Float;
	function setString(name:String, value:String):js.Promise<Float>;
	function snapshot():js.Promise<nodegit.Config>;
	static var LEVEL : Dynamic;
}