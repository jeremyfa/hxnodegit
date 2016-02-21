package nodegit;
typedef CherrypickOptions = {
	@:optional
	var checkoutOpts : nodegit.CheckoutOptions;
	@:optional
	var mainline : Float;
	@:optional
	var mergeOpts : nodegit.MergeOptions;
	@:optional
	var version : Float;
}