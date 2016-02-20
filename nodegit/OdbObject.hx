package nodegit;
@:jsRequire("nodegit", "OdbObject") extern class OdbObject {
	function data():Dynamic;
	function dup():js.Promise<nodegit.OdbObject>;
	function free():Void;
	function id():nodegit.Oid;
	function size():Float;
	function type():Float;
}