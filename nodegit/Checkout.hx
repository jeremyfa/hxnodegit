package nodegit;
@:jsRequire("nodegit", "Checkout") extern class Checkout {
	static function head(repo:nodegit.Repository, [options]:nodegit.CheckoutOptions):js.Promise<Void>;
	static function index(repo:nodegit.Repository, The:nodegit.Index, [options]:nodegit.CheckoutOptions):js.Promise<Void>;
	static function initOptions(opts:nodegit.CheckoutOptions, version:Float):Float;
	static function tree(repo:nodegit.Repository, treeish:Dynamic, [options]:nodegit.CheckoutOptions):js.Promise<Void>;
	static var NOTIFY : Dynamic;
	static var STRATEGY : Dynamic;
}