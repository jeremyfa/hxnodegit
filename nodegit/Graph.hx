package nodegit;
@:jsRequire("nodegit", "Graph") extern class Graph {
	static function aheadBehind(repo:nodegit.Repository, local:nodegit.Oid, upstream:nodegit.Oid):js.Promise<Float>;
	static function descendantOf(repo:nodegit.Repository, commit:nodegit.Oid, ancestor:nodegit.Oid):js.Promise<haxe.extern.EitherType<Dynamic, Dynamic>>;
}