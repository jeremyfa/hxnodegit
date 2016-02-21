package nodegit;
typedef CheckoutOptions = {
	@:optional
	var ancestorLabel : String;
	@:optional
	var baseline : nodegit.Tree;
	@:optional
	var baselineIndex : nodegit.Index;
	@:optional
	var checkoutStrategy : Float;
	@:optional
	var dirMode : Float;
	@:optional
	var disableFilters : Float;
	@:optional
	var fileMode : Float;
	@:optional
	var fileOpenFlags : Float;
	@:optional
	var notifyCb : Dynamic;
	@:optional
	var notifyFlags : Float;
	@:optional
	var notifyPayload : Dynamic;
	@:optional
	var ourLabel : String;
	@:optional
	var paths : nodegit.Strarray;
	@:optional
	var perfdataCb : Dynamic;
	@:optional
	var perfdataPayload : Dynamic;
	@:optional
	var progressCb : Dynamic;
	@:optional
	var progressPayload : Dynamic;
	@:optional
	var targetDirectory : String;
	@:optional
	var theirLabel : String;
	@:optional
	var version : Float;
}