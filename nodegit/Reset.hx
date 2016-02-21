package nodegit;
@:jsRequire("nodegit", "Reset") extern class Reset {
	static function default(repo:nodegit.Repository, target:nodegit.Object, pathspecs:nodegit.Strarray):js.Promise<Float>;
	static function fromAnnotated(repo:nodegit.Repository, commit:nodegit.AnnotatedCommit, reset_type:Float, checkout_opts:nodegit.CheckoutOptions):Float;
	static function reset(repo:nodegit.Repository, target:nodegit.Object, reset_type:Float, checkout_opts:nodegit.CheckoutOptions):js.Promise<Float>;
	static var TYPE : ResetType;
}
extern class ResetType {
	var SOFT : Int = 1;
	var MIXED : Int = 2;
	var HARD : Int = 3;
}