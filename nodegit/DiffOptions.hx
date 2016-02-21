package nodegit;
typedef DiffOptions = {
	@:optional
	var contextLines : Float;
	@:optional
	var flags : Float;
	@:optional
	var idAbbrev : Float;
	@:optional
	var ignoreSubmodules : Float;
	@:optional
	var interhunkLines : Float;
	@:optional
	var maxSize : Float;
	@:optional
	var newPrefix : String;
	@:optional
	var notifyCb : Dynamic;
	@:optional
	var notifyPayload : Dynamic;
	@:optional
	var oldPrefix : String;
	@:optional
	var pathspec : nodegit.Strarray;
	@:optional
	var version : Float;
}