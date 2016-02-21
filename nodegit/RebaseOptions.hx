package nodegit;
typedef RebaseOptions = {
	@:optional
	var checkoutOptions : nodegit.CheckoutOptions;
	@:optional
	var quiet : Float;
	@:optional
	var rewriteNotesRef : String;
	@:optional
	var version : Float;
}