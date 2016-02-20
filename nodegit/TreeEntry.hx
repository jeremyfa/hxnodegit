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
	static var FILEMODE : Dynamic;
}