package nodegit;
@:jsRequire("nodegit", "Reflog") extern class Reflog {
	static function delete(repo:nodegit.Repository, name:String):Float;
	static function entryCommitter(entry:Dynamic):nodegit.Signature;
	static function entryIdNew(entry:Dynamic):nodegit.Oid;
	static function entryIdOld(entry:Dynamic):nodegit.Oid;
	static function entryMessage(entry:Dynamic):String;
	static function read(repo:nodegit.Repository, name:String):js.Promise<nodegit.Reflog>;
	static function rename(repo:nodegit.Repository, old_name:String, name:String):Float;
	function append(id:nodegit.Oid, committer:nodegit.Signature, msg:String):Float;
	function drop(idx:Float, rewrite_previous_entry:Float):Dynamic;
	function entryByIndex(idx:Float):Dynamic;
	function entrycount():Float;
	function free():Void;
	function write():Float;
}