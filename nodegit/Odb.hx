package nodegit;
@:jsRequire("nodegit", "Odb") extern class Odb {
	static function open(objects_dir:String):js.Promise<nodegit.Odb>;
	function addDiskAlternate(path:String):Float;
	function free():Void;
	function read(id:nodegit.Oid):js.Promise<nodegit.OdbObject>;
	function write(data:Dynamic, len:Float, type:Float):js.Promise<nodegit.Oid>;
	static var STREAM(default, null) : OdbStream;
}
extern class OdbStream {
	var RDONLY(default, null) : Int = 2;
	var WRONLY(default, null) : Int = 4;
	var RW(default, null) : Int = 6;
}