package nodegit;
@:jsRequire("nodegit", "Reset") extern class Reset {
	static function default(repo:Dynamic, target:Dynamic, pathspecs:Dynamic):Promise<Float>;
	static function fromAnnotated(repo:Dynamic, commit:Dynamic, reset_type:Float, checkout_opts:Dynamic):Float;
	static function reset(repo:Dynamic, target:Dynamic, reset_type:Float, checkout_opts:Dynamic):Promise<Float>;
	static var TYPE : Dynamic;
}