package nodegit;
@:jsRequire("nodegit", "AnnotatedCommit") extern class AnnotatedCommit {
	static function fromFetchhead(repo:nodegit.Repository, branch_name:String, remote_url:String, id:nodegit.Oid):js.Promise<nodegit.AnnotatedCommit>;
	static function fromRef(repo:nodegit.Repository, ref:nodegit.Reference):js.Promise<nodegit.AnnotatedCommit>;
	static function fromRevspec(repo:nodegit.Repository, revspec:String):js.Promise<nodegit.AnnotatedCommit>;
	static function lookup(repo:nodegit.Repository, id:nodegit.Oid):js.Promise<nodegit.AnnotatedCommit>;
	function free():Void;
	function id():nodegit.Oid;
}