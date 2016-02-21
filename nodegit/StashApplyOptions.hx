package nodegit;
typedef StashApplyOptions = {
	@:optional
	var checkoutOptions : nodegit.CheckoutOptions;
	@:optional
	var flags : Float;
	@:optional
	var progressCb : Dynamic;
	@:optional
	var progressPayload : Dynamic;
	@:optional
	var version : Float;
}