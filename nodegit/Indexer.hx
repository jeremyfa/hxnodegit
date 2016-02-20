package nodegit;
@:jsRequire("nodegit", "Indexer") extern class Indexer {
	function commit(stats:Dynamic):Float;
	function free():Void;
	function hash():Dynamic;
}