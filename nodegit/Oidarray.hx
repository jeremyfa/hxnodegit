package nodegit;
@:jsRequire("nodegit", "Oidarray") extern class Oidarray {
	var count : Float;
	var ids : nodegit.Oid;
	function free():Void;
}