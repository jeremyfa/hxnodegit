package nodegit;
@:jsRequire("nodegit", "Graph") extern class Graph {
	static function aheadBehind(repo:Dynamic, local:Dynamic, upstream:Dynamic):Promise<Float>;
	static function descendantOf(repo:Dynamic, commit:Dynamic, ancestor:Dynamic):Promise<Dynamic>;
}