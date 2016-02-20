package nodegit;
@:jsRequire("nodegit", "Revert") extern class Revert {
	static function commit(repo:nodegit.Repository, revert_commit:nodegit.Commit, our_commit:nodegit.Commit, mainline:Float, merge_options:nodegit.MergeOptions):js.Promise<nodegit.Index>;
	static function revert(repo:nodegit.Repository, commit:nodegit.Commit, given_opts:nodegit.RevertOptions):js.Promise<Float>;
}