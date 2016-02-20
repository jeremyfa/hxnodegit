package nodegit;
@:jsRequire("nodegit", "Strarray") extern class Strarray {
	var count : Float;
	var strings : String;
	function copy(src:Dynamic):Float;
	function free():Void;
}