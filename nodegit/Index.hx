package nodegit;
@:jsRequire("nodegit", "Index") extern class Index {
	static function entryIsConflict(entry:nodegit.IndexEntry):Float;
	static function entryStage(entry:nodegit.IndexEntry):Float;
	static function open(index_path:String):js.Promise<nodegit.Index>;
	function add(source_entry:nodegit.IndexEntry):Float;
	function addAll(pathspec:nodegit.Strarray, flags:Float, callback:Dynamic, payload:Dynamic):js.Promise<Float>;
	function addByPath(path:String):Float;
	function caps():Float;
	function checksum():nodegit.Oid;
	function clear():Float;
	function conflictAdd(ancestor_entry:nodegit.IndexEntry, our_entry:nodegit.IndexEntry, their_entry:nodegit.IndexEntry):Float;
	function conflictCleanup():Float;
	function conflictGet(path:String):js.Promise<nodegit.IndexEntry>;
	function conflictRemove(path:String):Float;
	function entries():Array<nodegit.IndexEntry>;
	function entryCount():Float;
	function getByIndex(n:Float):nodegit.IndexEntry;
	function getByPath(path:String, stage:Float):nodegit.IndexEntry;
	function hasConflicts():Float;
	function owner():nodegit.Repository;
	function path():String;
	function read(force:Float):Float;
	function readTree(tree:nodegit.Tree):Float;
	function remove(path:String, stage:Float):Float;
	function removeAll(pathspec:nodegit.Strarray, callback:Dynamic, payload:Dynamic):js.Promise<Float>;
	function removeByPath(path:String):Float;
	function removeDirectory(dir:String, stage:Float):Float;
	function setCaps(caps:Float):Float;
	function updateAll(pathspec:nodegit.Strarray, callback:Dynamic, payload:Dynamic):js.Promise<Float>;
	function write():Float;
	function writeTree():js.Promise<nodegit.Oid>;
	function writeTreeTo(repo:nodegit.Repository):js.Promise<nodegit.Oid>;
	static var ADD_OPTION(default, null) : IndexAddOption;
	static var CAP(default, null) : IndexCap;
}
extern class IndexAddOption {
	var ADD_DEFAULT(default, null) : Int;
	var ADD_FORCE(default, null) : Int;
	var ADD_DISABLE_PATHSPEC_MATCH(default, null) : Int;
	var ADD_CHECK_PATHSPEC(default, null) : Int;
}
extern class IndexCap {
	var IGNORE_CASE(default, null) : Int;
	var NO_FILEMODE(default, null) : Int;
	var NO_SYMLINKS(default, null) : Int;
	var FROM_OWNER(default, null) : Int;
}