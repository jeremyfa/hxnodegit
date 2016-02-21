package nodegit;
@:jsRequire("nodegit", "MergeFileOptions") extern class MergeFileOptions {
	var ancestorLabel : String;
	var favor : Float;
	var flags : Float;
	var ourLabel : String;
	var theirLabel : String;
	var version : Float;
	function new();
}