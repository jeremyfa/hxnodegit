package nodegit;
@:jsRequire("nodegit", "TransferProgress") extern class TransferProgress {
	var indexedDeltas : Float;
	var indexedObjects : Float;
	var localObjects : Float;
	var receivedBytes : Float;
	var receivedObjects : Float;
	var totalDeltas : Float;
	var totalObjects : Float;
}