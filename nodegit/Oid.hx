package nodegit;
@:jsRequire("nodegit", "Oid") extern class Oid {
	static function fromString(str:String):Dynamic;
	function cmp(b:Dynamic):Float;
	function cpy():Dynamic;
	function equal(b:Dynamic):Float;
	function iszero():Float;
	function ncmp(b:Dynamic, len:Float):Float;
	function strcmp(str:String):Float;
	function streq(str:String):Float;
	function tostrS():String;
}