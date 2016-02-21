package nodegit;
@:jsRequire("nodegit", "DiffFindOptions") extern class DiffFindOptions {
	var breakRewriteThreshold : Float;
	var copyThreshold : Float;
	var flags : Float;
	var renameFromRewriteThreshold : Float;
	var renameLimit : Float;
	var renameThreshold : Float;
	var version : Float;
	function new();
}