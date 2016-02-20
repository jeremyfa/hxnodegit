package nodegit;
@:jsRequire("nodegit", "Blob") extern class Blob {
	static function createFromBuffer(repo:Dynamic, buffer:Dynamic, len:Float):Dynamic;
	static function createFromDisk(id:Dynamic, repo:Dynamic, path:String):Float;
	static function createFromWorkdir(id:Dynamic, repo:Dynamic, relative_path:String):Float;
	static function lookup(repo:Dynamic, id:Dynamic):Promise<Dynamic>;
	static function lookupPrefix(repo:Dynamic, id:Dynamic, len:Float):Promise<Dynamic>;
	function content():Dynamic;
	function filemode():Float;
	function free():Void;
	function id():Dynamic;
	function isBinary():Dynamic;
	function owner():Dynamic;
	function rawcontent():Dynamic;
	function rawsize():Float;
	function toString():String;
}