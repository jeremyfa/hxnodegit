package nodegit;
@:jsRequire("nodegit", "DiffFile") extern class DiffFile {
	function flags():Float;
	function id():nodegit.Oid;
	function mode():Float;
	function path():String;
	function size():Float;
}