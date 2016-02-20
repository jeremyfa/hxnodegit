package nodegit;
@:jsRequire("nodegit", "Packbuilder") extern class Packbuilder {
	static function create(repo:Dynamic):Dynamic;
	function free():Void;
	function hash():Dynamic;
	function insert(id:Dynamic, name:String):Float;
	function insertCommit(id:Dynamic):Float;
	function insertRecur(id:Dynamic, name:String):Float;
	function insertTree(id:Dynamic):Float;
	function insertWalk(walk:Dynamic):Float;
	function objectCount():Float;
	function setThreads(n:Float):Float;
	function written():Float;
	static var STAGE : Dynamic;
}