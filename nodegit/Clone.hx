package nodegit;
@:jsRequire("nodegit", "Clone") extern class Clone {
	static function clone(url:String, local_path:String, ?options:nodegit.CloneOptions):js.Promise<nodegit.Repository>;
	static function initOptions(opts:nodegit.CloneOptions, version:Float):Float;
	static var LOCAL(default, null) : CloneLocal;
}
extern class CloneLocal {
	var AUTO(default, null) : Int;
	var LOCAL(default, null) : Int;
	var NO_LOCAL(default, null) : Int;
	var NO_LINKS(default, null) : Int;
}