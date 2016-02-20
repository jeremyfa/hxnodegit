package nodegit;
@:jsRequire("nodegit", "Config") extern class Config {
	static function openDefault():Promise<Dynamic>;
	function getStringBuf(name:String):Promise<Dynamic>;
	function setInt64(name:String, value:Float):Float;
	function setMultivar(name:String, regexp:String, value:String):Float;
	function setString(name:String, value:String):Promise<Float>;
	function snapshot():Promise<Dynamic>;
	static var LEVEL : Dynamic;
}