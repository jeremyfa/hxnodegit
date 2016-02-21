package nodegit;
typedef SubmoduleUpdateOptions = {
	@:optional
	var checkoutOpts : nodegit.CheckoutOptions;
	@:optional
	var cloneCheckoutStrategy : Float;
	@:optional
	var fetchOpts : nodegit.FetchOptions;
	@:optional
	var version : Float;
}