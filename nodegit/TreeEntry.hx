package nodegit;
@:jsRequire("nodegit", "TreeEntry") extern class TreeEntry {
	var attr : Float;
	var filename : String;
	var filenameLen : Float;
	var oid : nodegit.Oid;
	function getBlob():js.Promise<nodegit.Blob>;
	function getTree():js.Promise<nodegit.Tree>;
	function isBlob():Bool;
	function isDirectory():Bool;
	function isFile():Bool;
	function isTree():Bool;
	function path():String;
	function sha():String;
	function toString():Void;
	static var FILEMODE(default, null) : TreeEntryFilemode;
}
extern class TreeEntryFilemode {
	var UNREADABLE(default, null) : Int = 0;
	var TREE(default, null) : Int = 16384;
	var BLOB(default, null) : Int = 33188;
	var EXECUTABLE(default, null) : Int = 33261;
	var LINK(default, null) : Int = 40960;
	var COMMIT(default, null) : Int = 57344;
}