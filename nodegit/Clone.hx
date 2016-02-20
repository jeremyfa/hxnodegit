package nodegit;
@:jsRequire("nodegit", "Clone") extern class Clone {
	static function clone(url:String, local_path:String, [options]:nodegit.CloneOptions):js.Promise<nodegit.Repository>;
	static function initOptions(opts:nodegit.CloneOptions, version:Float):Float;
	static var LOCAL : Dynamic;
}