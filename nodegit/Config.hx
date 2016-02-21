package nodegit;
@:jsRequire("nodegit", "Config") extern class Config {
	static function openDefault():js.Promise<nodegit.Config>;
	function getStringBuf(name:String):js.Promise<nodegit.Buf>;
	function setInt64(name:String, value:Float):Float;
	function setMultivar(name:String, regexp:String, value:String):Float;
	function setString(name:String, value:String):js.Promise<Float>;
	function snapshot():js.Promise<nodegit.Config>;
	static var LEVEL : ConfigLevel;
}
extern class ConfigLevel {
	var SYSTEM : Int = 1;
	var XDG : Int = 2;
	var GLOBAL : Int = 3;
	var LOCAL : Int = 4;
	var APP : Int = 5;
	var HIGHEST_LEVEL : Int = -1;
}