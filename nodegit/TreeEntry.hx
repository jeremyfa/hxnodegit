package nodegit;
@:jsRequire("nodegit", "TreeEntry") extern class TreeEntry {
	var attr : Float;
	var filename : String;
	var filenameLen : Float;
	var oid : Dynamic;
	function getBlob():Promise<Dynamic>;
	function getTree():Promise<Dynamic>;
	function isBlob():Bool;
	function isDirectory():Bool;
	function isFile():Bool;
	function isTree():Bool;
	function path():String;
	function sha():String;
	function toString():Void;
	static var FILEMODE : Dynamic;
}