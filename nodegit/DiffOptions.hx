package nodegit;
typedef DiffOptions = {
	var contextLines : Float;
	var flags : Float;
	var idAbbrev : Float;
	var ignoreSubmodules : Float;
	var interhunkLines : Float;
	var maxSize : Float;
	var newPrefix : String;
	var notifyCb : Dynamic;
	var notifyPayload : Dynamic;
	var oldPrefix : String;
	var pathspec : nodegit.Strarray;
	var version : Float;
}