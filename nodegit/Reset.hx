package nodegit;
@:jsRequire("nodegit", "Reset") extern class Reset {
	@:native("default")
	static function default_(repo:nodegit.Repository, target:nodegit.Object, pathspecs:nodegit.Strarray):js.Promise<Float>;
	static function fromAnnotated(repo:nodegit.Repository, commit:nodegit.AnnotatedCommit, reset_type:Float, checkout_opts:nodegit.CheckoutOptions):Float;
	static function reset(repo:nodegit.Repository, target:nodegit.Object, reset_type:Float, checkout_opts:nodegit.CheckoutOptions):js.Promise<Float>;
	static var TYPE(default, null) : ResetType;
}
extern class ResetType {
	var SOFT(default, null) : Int;
	var MIXED(default, null) : Int;
	var HARD(default, null) : Int;
}