package nodegit;
@:jsRequire("nodegit", "Reflog") extern class Reflog {
	static function delete(repo:Dynamic, name:String):Float;
	static function entryCommitter(entry:Dynamic):Dynamic;
	static function entryIdNew(entry:Dynamic):Dynamic;
	static function entryIdOld(entry:Dynamic):Dynamic;
	static function entryMessage(entry:Dynamic):String;
	static function read(repo:Dynamic, name:String):Promise<Dynamic>;
	static function rename(repo:Dynamic, old_name:String, name:String):Float;
	function append(id:Dynamic, committer:Dynamic, msg:String):Float;
	function drop(idx:Float, rewrite_previous_entry:Float):Dynamic;
	function entryByIndex(idx:Float):Dynamic;
	function entrycount():Float;
	function free():Void;
	function write():Float;
}