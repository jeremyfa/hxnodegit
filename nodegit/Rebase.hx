package nodegit;
@:jsRequire("nodegit", "Rebase") extern class Rebase {
	static function init(repo:Dynamic, branch:Dynamic, upstream:Dynamic, onto:Dynamic, opts:Dynamic):Promise<Dynamic>;
	static function initOptions(opts:Dynamic, version:Float):Float;
	static function open(repo:Dynamic, opts:Dynamic):Promise<Dynamic>;
	function abort():Dynamic;
	function commit(author:Dynamic, committer:Dynamic, message_encoding:String, message:String):Dynamic;
	function finish(signature:Dynamic):Float;
	function next():Promise<Dynamic>;
	function operationByIndex(idx:Float):Dynamic;
	function operationCurrent():Float;
	function operationEntrycount():Float;
}