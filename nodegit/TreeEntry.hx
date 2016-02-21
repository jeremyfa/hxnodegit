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
	static var FILEMODE : TreeEntryFilemode;
}
extern class TreeEntryFilemode {
	var UNREADABLE : Int = 0;
	var TREE : Int = 16384;
	var BLOB : Int = 33188;
	var EXECUTABLE : Int = 33261;
	var LINK : Int = 40960;
	var COMMIT : Int = 57344;
}