package nodegit;
@:jsRequire("nodegit", "Indexer") extern class Indexer {
	function commit(stats:nodegit.TransferProgress):Float;
	function free():Void;
	function hash():nodegit.Oid;
}