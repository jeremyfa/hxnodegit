package nodegit;
@:jsRequire("nodegit", "Pathspec") extern class Pathspec {
	static function create(pathspec:Dynamic):Dynamic;
	static function matchListDiffEntry(m:Dynamic, pos:Float):Dynamic;
	static function matchListEntry(m:Dynamic, pos:Float):String;
	static function matchListEntrycount(m:Dynamic):Float;
	static function matchListFailedEntry(m:Dynamic, pos:Float):String;
	static function matchListFailedEntrycount(m:Dynamic):Float;
	function free():Void;
	function matchDiff(diff:Dynamic, flags:Float):Promise<Dynamic>;
	function matchIndex(index:Dynamic, flags:Float):Promise<Dynamic>;
	function matchTree(tree:Dynamic, flags:Float):Promise<Dynamic>;
	function matchWorkdir(repo:Dynamic, flags:Float):Promise<Dynamic>;
	function matchesPath(flags:Float, path:String):Float;
	static var FLAG : Dynamic;
}