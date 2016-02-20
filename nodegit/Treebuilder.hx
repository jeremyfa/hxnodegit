package nodegit;
@:jsRequire("nodegit", "Treebuilder") extern class Treebuilder {
	static function create(repo:nodegit.Repository, source:nodegit.Tree):js.Promise<nodegit.Treebuilder>;
	function clear():Void;
	function entrycount():Float;
	function free():Void;
	function get(filename:String):nodegit.TreeEntry;
	function insert(filename:String, id:nodegit.Oid, filemode:Float):js.Promise<nodegit.TreeEntry>;
	function remove(filename:String):Float;
	function write():nodegit.Oid;
}