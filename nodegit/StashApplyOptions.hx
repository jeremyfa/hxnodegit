package nodegit;
@:jsRequire("nodegit", "StashApplyOptions") extern class StashApplyOptions {
	var checkoutOptions : nodegit.CheckoutOptions;
	var flags : Float;
	var progressCb : Dynamic;
	var progressPayload : Dynamic;
	var version : Float;
	function new();
}