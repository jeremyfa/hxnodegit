package nodegit;
@:jsRequire("nodegit", "SubmoduleUpdateOptions") extern class SubmoduleUpdateOptions {
	var checkoutOpts : nodegit.CheckoutOptions;
	var cloneCheckoutStrategy : Float;
	var fetchOpts : nodegit.FetchOptions;
	var version : Float;
	function new();
}