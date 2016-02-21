package nodegit;
typedef RemoteCallbacks = {
	@:optional
	var certificateCheck : Dynamic;
	@:optional
	var credentials : Dynamic;
	@:optional
	var payload : Dynamic;
	@:optional
	var transferProgress : Dynamic;
	@:optional
	var transport : Dynamic;
	@:optional
	var version : Dynamic;
}