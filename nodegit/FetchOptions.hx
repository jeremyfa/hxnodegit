package nodegit;
@:jsRequire("nodegit", "FetchOptions") extern class FetchOptions {
	var callbacks : nodegit.RemoteCallbacks;
	var downloadTags : Float;
	var prune : Float;
	var updateFetchhead : Float;
	var version : Float;
	function new();
}