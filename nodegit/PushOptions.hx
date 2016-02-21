package nodegit;
@:jsRequire("nodegit", "PushOptions") extern class PushOptions {
	var callbacks : nodegit.RemoteCallbacks;
	var pbParallelism : Float;
	var version : Float;
	function new();
}