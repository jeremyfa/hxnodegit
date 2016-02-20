package nodegit;
@:jsRequire("nodegit", "Revert") extern class Revert {
	static function commit(repo:Dynamic, revert_commit:Dynamic, our_commit:Dynamic, mainline:Float, merge_options:Dynamic):Promise<Dynamic>;
	static function revert(repo:Dynamic, commit:Dynamic, given_opts:Dynamic):Promise<Float>;
}