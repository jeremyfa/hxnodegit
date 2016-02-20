package nodegit;
@:jsRequire("nodegit", "Rebase") extern class Rebase {
	static function init(repo:nodegit.Repository, branch:nodegit.AnnotatedCommit, upstream:nodegit.AnnotatedCommit, onto:nodegit.AnnotatedCommit, opts:nodegit.RebaseOptions):js.Promise<nodegit.Rebase>;
	static function initOptions(opts:nodegit.RebaseOptions, version:Float):Float;
	static function open(repo:nodegit.Repository, opts:nodegit.RebaseOptions):js.Promise<nodegit.Rebase>;
	function abort():Dynamic;
	function commit(author:nodegit.Signature, committer:nodegit.Signature, message_encoding:String, message:String):nodegit.Oid;
	function finish(signature:nodegit.Signature):Float;
	function next():js.Promise<nodegit.RebaseOperation>;
	function operationByIndex(idx:Float):nodegit.RebaseOperation;
	function operationCurrent():Float;
	function operationEntrycount():Float;
}