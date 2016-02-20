package nodegit;
@:jsRequire("nodegit", "Checkout") extern class Checkout {
	static function head(repo:Dynamic, [options]:Dynamic):Promise<Void>;
	static function index(repo:Dynamic, The:Dynamic, [options]:Dynamic):Promise<Void>;
	static function initOptions(opts:Dynamic, version:Float):Float;
	static function tree(repo:Dynamic, treeish:Dynamic, [options]:Dynamic):Promise<Void>;
	static var NOTIFY : Dynamic;
	static var STRATEGY : Dynamic;
}