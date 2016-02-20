package nodegit;
@:jsRequire("nodegit", "Buf") extern class Buf {
	var asize : Float;
	var ptr : String;
	var size : Float;
	function containsNul():Float;
	function free():Void;
	function grow(target_size:Float):js.Promise<nodegit.Buf>;
	function isBinary():Float;
	function set(data:Dynamic, datalen:Float):js.Promise<nodegit.Buf>;
}