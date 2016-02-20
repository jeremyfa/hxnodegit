package nodegit;
@:jsRequire("nodegit", "Clone") extern class Clone {
	static function clone(url:String, local_path:String, [options]:Dynamic):Promise<Dynamic>;
	static function initOptions(opts:Dynamic, version:Float):Float;
	static var LOCAL : Dynamic;
}