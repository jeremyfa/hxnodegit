package nodegit;
@:jsRequire("nodegit", "Blob") extern class Blob {
	static function createFromBuffer(repo:nodegit.Repository, buffer:Dynamic, len:Float):nodegit.Oid;
	static function createFromDisk(id:nodegit.Oid, repo:nodegit.Repository, path:String):Float;
	static function createFromWorkdir(id:nodegit.Oid, repo:nodegit.Repository, relative_path:String):Float;
	static function lookup(repo:nodegit.Repository, id:Dynamic):js.Promise<nodegit.Blob>;
	static function lookupPrefix(repo:nodegit.Repository, id:nodegit.Oid, len:Float):js.Promise<nodegit.Blob>;
	function content():Dynamic;
	function filemode():Float;
	function free():Void;
	function id():nodegit.Oid;
	function isBinary():Dynamic;
	function owner():nodegit.Repository;
	function rawcontent():Dynamic;
	function rawsize():Float;
	function toString():String;
}