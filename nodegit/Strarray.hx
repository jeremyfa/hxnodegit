package nodegit;
@:jsRequire("nodegit", "Strarray") extern class Strarray {
	var count : Float;
	var strings : String;
	function copy(src:nodegit.Strarray):Float;
	function free():Void;
}