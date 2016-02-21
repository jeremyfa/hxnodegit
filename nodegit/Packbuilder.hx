package nodegit;
@:jsRequire("nodegit", "Packbuilder") extern class Packbuilder {
	static function create(repo:nodegit.Repository):nodegit.Packbuilder;
	function free():Void;
	function hash():nodegit.Oid;
	function insert(id:nodegit.Oid, name:String):Float;
	function insertCommit(id:nodegit.Oid):Float;
	function insertRecur(id:nodegit.Oid, name:String):Float;
	function insertTree(id:nodegit.Oid):Float;
	function insertWalk(walk:nodegit.Revwalk):Float;
	function objectCount():Float;
	function setThreads(n:Float):Float;
	function written():Float;
	static var STAGE(default, null) : PackbuilderStage;
}
extern class PackbuilderStage {
	var ADDING_OBJECTS(default, null) : Int;
	var DELTAFICATION(default, null) : Int;
}