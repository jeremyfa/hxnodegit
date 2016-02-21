package nodegit;
@:jsRequire("nodegit", "DiffLine") extern class DiffLine {
	var contentLen : Float;
	var contentOffset : Float;
	var newLineno : Float;
	var numLines : Float;
	var oldLineno : Float;
	var origin : Float;
	function content():String;
}