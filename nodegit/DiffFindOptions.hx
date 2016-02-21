package nodegit;
typedef DiffFindOptions = {
	@:optional
	var breakRewriteThreshold : Float;
	@:optional
	var copyThreshold : Float;
	@:optional
	var flags : Float;
	@:optional
	var renameFromRewriteThreshold : Float;
	@:optional
	var renameLimit : Float;
	@:optional
	var renameThreshold : Float;
	@:optional
	var version : Float;
}