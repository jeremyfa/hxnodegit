package nodegit;
@:jsRequire("nodegit", "Odb") extern class Odb {
	static function open(objects_dir:String):js.Promise<nodegit.Odb>;
	function addDiskAlternate(path:String):Float;
	function free():Void;
	function read(id:nodegit.Oid):js.Promise<nodegit.OdbObject>;
	function write(data:Dynamic, len:Float, type:Float):js.Promise<nodegit.Oid>;
	static var STREAM : Dynamic;
}