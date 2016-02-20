package nodegit;
@:jsRequire("nodegit", "DiffFile") extern class DiffFile {
	var flags : Float;
	var id : nodegit.Oid;
	var mode : Float;
	var path : String;
	var size : Float;
	function flags():Float;
	function id():nodegit.Oid;
	function mode():Float;
	function path():String;
	function size():Float;
}