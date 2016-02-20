package nodegit;
@:jsRequire("nodegit", "CheckoutOptions") extern class CheckoutOptions {
	var ancestorLabel : String;
	var baseline : Dynamic;
	var baselineIndex : Dynamic;
	var checkoutStrategy : Float;
	var dirMode : Float;
	var disableFilters : Float;
	var fileMode : Float;
	var fileOpenFlags : Float;
	var notifyCb : Dynamic;
	var notifyFlags : Float;
	var notifyPayload : Dynamic;
	var ourLabel : String;
	var paths : Dynamic;
	var perfdataCb : Dynamic;
	var perfdataPayload : Dynamic;
	var progressCb : Dynamic;
	var progressPayload : Dynamic;
	var targetDirectory : String;
	var theirLabel : String;
	var version : Float;
}