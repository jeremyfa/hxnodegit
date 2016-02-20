package nodegit;
@:jsRequire("nodegit", "Cherrypick") extern class Cherrypick {
	static function cherrypick(repo:Dynamic, commit:Dynamic, [options]:Dynamic):Promise<Int>;
	static function commit(repo:Dynamic, cherrypick_commit:Dynamic, our_commit:Dynamic, mainline:Int, [merge_options]:Dynamic):Promise<Int>;
	static function initOptions(opts:Dynamic, version:Float):Float;
}