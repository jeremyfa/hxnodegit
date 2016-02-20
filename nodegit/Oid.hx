package nodegit;
@:jsRequire("nodegit", "Oid") extern class Oid {
	static function fromString(str:String):nodegit.Oid;
	function cmp(b:nodegit.Oid):Float;
	function cpy():nodegit.Oid;
	function equal(b:nodegit.Oid):Float;
	function iszero():Float;
	function ncmp(b:nodegit.Oid, len:Float):Float;
	function strcmp(str:String):Float;
	function streq(str:String):Float;
	function tostrS():String;
}