package nodegit;
@:jsRequire("nodegit", "Tree") extern class Tree {
	static function entryCmp(e1:nodegit.TreeEntry, e2:nodegit.TreeEntry):Float;
	static function entryDup(dest:nodegit.TreeEntry, source:nodegit.TreeEntry):Float;
	static function entryFilemode(entry:nodegit.TreeEntry):Float;
	static function entryFilemodeRaw(entry:nodegit.TreeEntry):Float;
	static function entryId(entry:nodegit.TreeEntry):nodegit.Oid;
	static function entryName(entry:nodegit.TreeEntry):String;
	static function entryToObject(object_out:nodegit.Object, repo:nodegit.Repository, entry:nodegit.TreeEntry):Float;
	static function entryType(entry:nodegit.TreeEntry):Float;
	static function lookup(repo:nodegit.Repository, id:Dynamic, callback:Dynamic):js.Promise<nodegit.Tree>;
	static function lookupPrefix(repo:nodegit.Repository, id:nodegit.Oid, len:Float):js.Promise<nodegit.Tree>;
	function _entryByIndex(idx:Float):nodegit.TreeEntry;
	function builder():nodegit.Treebuilder;
	function diff(tree:nodegit.Tree, callback:Dynamic):js.Promise<Dynamic>;
	function diffWithOptions(tree:nodegit.Tree, options:nodegit.Object, callback:Dynamic):js.Promise<Dynamic>;
	function entries():Array<nodegit.TreeEntry>;
	function entryById(id:nodegit.Oid):nodegit.TreeEntry;
	function entryByIndex(i:Float):nodegit.TreeEntry;
	function entryByName(name:String):nodegit.TreeEntry;
	function entryByPath(path:String):js.Promise<nodegit.TreeEntry>;
	function entryCount():Float;
	function free():Void;
	function getEntry(filePath:String):nodegit.TreeEntry;
	function id():nodegit.Oid;
	function owner():nodegit.Repository;
	function path():String;
	function walk(?blobsOnly:Bool):Dynamic;
	static var WALK_MODE(default, null) : TreeWalkMode;
}
extern class TreeWalkMode {
	var WALK_PRE(default, null) : Int;
	var WALK_POST(default, null) : Int;
}