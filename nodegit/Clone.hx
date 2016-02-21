package nodegit;
@:jsRequire("nodegit", "Clone") extern class Clone {
	static function clone(url:String, local_path:String, ?options:nodegit.CloneOptions):js.Promise<nodegit.Repository>;
	static function initOptions(opts:nodegit.CloneOptions, version:Float):Float;
	static var LOCAL : CloneLocal;
}
extern class CloneLocal {
	var AUTO : Int = 0;
	var LOCAL : Int = 1;
	var NO_LOCAL : Int = 2;
	var NO_LINKS : Int = 3;
}