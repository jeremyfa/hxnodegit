package nodegit;
@:jsRequire("nodegit", "CloneOptions") extern class CloneOptions {
	var bare : Float;
	var checkoutBranch : String;
	var checkoutOpts : nodegit.CheckoutOptions;
	var fetchOpts : nodegit.FetchOptions;
	var local : Float;
	var remoteCbPayload : Dynamic;
	var repositoryCbPayload : Dynamic;
	var version : Float;
	function new();
}