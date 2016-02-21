package nodegit;
typedef StatusOptions = {
	@:optional
	var flags : Float;
	@:optional
	var pathspec : nodegit.Strarray;
	@:optional
	var show : Float;
	@:optional
	var version : Float;
}