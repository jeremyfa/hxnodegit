package nodegit;
@:jsRequire("nodegit", "Tree") extern class Tree {
	static function entryCmp(e1:Dynamic, e2:Dynamic):Float;
	static function entryDup(dest:Dynamic, source:Dynamic):Float;
	static function entryFilemode(entry:Dynamic):Float;
	static function entryFilemodeRaw(entry:Dynamic):Float;
	static function entryId(entry:Dynamic):Dynamic;
	static function entryName(entry:Dynamic):String;
	static function entryToObject(object_out:Dynamic, repo:Dynamic, entry:Dynamic):Float;
	static function entryType(entry:Dynamic):Float;
	static function lookup(repo:Dynamic, id:Dynamic, callback:Dynamic):Promise<Dynamic>;
	static function lookupPrefix(repo:Dynamic, id:Dynamic, len:Float):Promise<Dynamic>;
	function _entryByIndex(idx:Float):Dynamic;
	function builder():Dynamic;
	function diff(tree:Dynamic, callback:Dynamic):Promise<Dynamic>;
	function diffWithOptions(tree:Dynamic, options:Dynamic, callback:Dynamic):Promise<Dynamic>;
	function entries():nodegit.Array<TreeEntry>;
	function entryById(id:Dynamic):Dynamic;
	function entryByIndex(i:Float):Dynamic;
	function entryByName(name:String):Dynamic;
	function entryByPath(path:String):Promise<Dynamic>;
	function entryCount():Float;
	function free():Void;
	function getEntry(filePath:String):Dynamic;
	function id():Dynamic;
	function owner():Dynamic;
	function path():String;
	function walk([blobsOnly:Bool):Dynamic;
	static var WALK_MODE : Dynamic;
}