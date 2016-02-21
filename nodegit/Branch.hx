package nodegit;
@:jsRequire("nodegit", "Branch") extern class Branch {
	static function create(repo:nodegit.Repository, branch_name:String, target:nodegit.Commit, force:Float):js.Promise<nodegit.Reference>;
	static function createFromAnnotated(repository:nodegit.Repository, branch_name:String, commit:nodegit.AnnotatedCommit, force:Float):nodegit.Reference;
	static function delete(branch:nodegit.Reference):Float;
	static function isHead(branch:nodegit.Reference):Dynamic;
	static function iteratorNew(repo:nodegit.Repository, list_flags:Float):js.Promise<Dynamic>;
	static function lookup(repo:nodegit.Repository, branch_name:String, branch_type:Float):js.Promise<nodegit.Reference>;
	static function move(branch:nodegit.Reference, new_branch_name:String, force:Float):js.Promise<nodegit.Reference>;
	static function name(ref:nodegit.Reference):js.Promise<String>;
	static function setUpstream(branch:nodegit.Reference, upstream_name:String):js.Promise<Float>;
	static function upstream(branch:nodegit.Reference):js.Promise<Dynamic>;
	static var BRANCH(default, null) : BranchBranch;
}
extern class BranchBranch {
	var LOCAL(default, null) : Int;
	var REMOTE(default, null) : Int;
	var ALL(default, null) : Int;
}