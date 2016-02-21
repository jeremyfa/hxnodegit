package nodegit;
typedef FetchOptions = {
	@:optional
	var callbacks : nodegit.RemoteCallbacks;
	@:optional
	var downloadTags : Float;
	@:optional
	var prune : Float;
	@:optional
	var updateFetchhead : Float;
	@:optional
	var version : Float;
}