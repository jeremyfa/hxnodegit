package nodegit;
@:jsRequire("nodegit", "Treebuilder") extern class Treebuilder {
	static function create(repo:Dynamic, source:Dynamic):Promise<Dynamic>;
	function clear():Void;
	function entrycount():Float;
	function free():Void;
	function get(filename:String):Dynamic;
	function insert(filename:String, id:Dynamic, filemode:Float):Promise<Dynamic>;
	function remove(filename:String):Float;
	function write():Dynamic;
}