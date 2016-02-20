package nodegit;
@:jsRequire("nodegit", "OdbObject") extern class OdbObject {
	function data():Dynamic;
	function dup():Promise<Dynamic>;
	function free():Void;
	function id():Dynamic;
	function size():Float;
	function type():Float;
}