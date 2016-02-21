package nodegit;
typedef PushOptions = {
	@:optional
	var callbacks : nodegit.RemoteCallbacks;
	@:optional
	var pbParallelism : Float;
	@:optional
	var version : Float;
}