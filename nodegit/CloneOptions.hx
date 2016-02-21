package nodegit;
typedef CloneOptions = {
	@:optional
	var bare : Float;
	@:optional
	var checkoutBranch : String;
	@:optional
	var checkoutOpts : nodegit.CheckoutOptions;
	@:optional
	var fetchOpts : nodegit.FetchOptions;
	@:optional
	var local : Float;
	@:optional
	var remoteCbPayload : Dynamic;
	@:optional
	var repositoryCbPayload : Dynamic;
	@:optional
	var version : Float;
}