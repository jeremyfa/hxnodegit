package nodegit;
@:jsRequire("nodegit", "Cherrypick") extern class Cherrypick {
	static function cherrypick(repo:nodegit.Repository, commit:nodegit.Commit, ?options:nodegit.CherrypickOptions):js.Promise<Int>;
	static function commit(repo:nodegit.Repository, cherrypick_commit:nodegit.Commit, our_commit:nodegit.Commit, mainline:Int, ?merge_options:nodegit.MergeOptions):js.Promise<Int>;
	static function initOptions(opts:nodegit.CherrypickOptions, version:Float):Float;
}