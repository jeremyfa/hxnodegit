package nodegit;
typedef MergeOptions = {
	@:optional
	var fileFavor : Float;
	@:optional
	var fileFlags : Float;
	@:optional
	var renameThreshold : Float;
	@:optional
	var targetLimit : Float;
	@:optional
	var treeFlags : Float;
	@:optional
	var version : Float;
}