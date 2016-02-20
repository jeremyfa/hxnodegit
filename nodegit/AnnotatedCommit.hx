package nodegit;
@:jsRequire("nodegit", "AnnotatedCommit") extern class AnnotatedCommit {
	static function fromFetchhead(repo:Dynamic, branch_name:String, remote_url:String, id:Dynamic):Promise<Dynamic>;
	static function fromRef(repo:Dynamic, ref:Dynamic):Promise<Dynamic>;
	static function fromRevspec(repo:Dynamic, revspec:String):Promise<Dynamic>;
	static function lookup(repo:Dynamic, id:Dynamic):Promise<Dynamic>;
	function free():Void;
	function id():Dynamic;
}