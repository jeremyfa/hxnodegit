package nodegit;
@:jsRequire("nodegit", "Odb") extern class Odb {
	static function open(objects_dir:String):Promise<Dynamic>;
	function addDiskAlternate(path:String):Float;
	function free():Void;
	function read(id:Dynamic):Promise<Dynamic>;
	function write(data:Dynamic, len:Float, type:Float):Promise<Dynamic>;
	static var STREAM : Dynamic;
}