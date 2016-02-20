package nodegit;
@:jsRequire("nodegit", "Refspec") extern class Refspec {
	function direction():Float;
	function dst():String;
	function dstMatches(refname:String):Float;
	function force():Float;
	function src():String;
	function srcMatches(refname:String):Float;
}