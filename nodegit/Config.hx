package nodegit;
@:jsRequire("nodegit", "Config") extern class Config {
	static function openDefault():js.Promise<nodegit.Config>;
	function getStringBuf(name:String):js.Promise<nodegit.Buf>;
	function setInt64(name:String, value:Float):Float;
	function setMultivar(name:String, regexp:String, value:String):Float;
	function setString(name:String, value:String):js.Promise<Float>;
	function snapshot():js.Promise<nodegit.Config>;
	static var LEVEL(default, null) : ConfigLevel;
}
extern class ConfigLevel {
	var SYSTEM(default, null) : Int;
	var XDG(default, null) : Int;
	var GLOBAL(default, null) : Int;
	var LOCAL(default, null) : Int;
	var APP(default, null) : Int;
	var HIGHEST_LEVEL(default, null) : Int;
}