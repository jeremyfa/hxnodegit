package nodegit;
@:jsRequire("nodegit", "Filter") extern class Filter {
	var attributes : String;
	var stream : Dynamic;
	var version : Float;
	static function listContains(filters:Dynamic, name:String):Float;
	static function listLength(fl:Dynamic):Float;
	static function listNew(repo:Dynamic, mode:Float, options:Float):Promise<Dynamic>;
	static function listStreamBlob(filters:Dynamic, blob:Dynamic, target:Dynamic):Float;
	static function listStreamData(filters:Dynamic, data:Dynamic, target:Dynamic):Float;
	static function listStreamFile(filters:Dynamic, repo:Dynamic, path:String, target:Dynamic):Float;
	static function unregister(name:String):Float;
	function lookup(name:String):Dynamic;
	function register(name:String, priority:Float):Float;
	static var FLAG : Dynamic;
	static var MODE : Dynamic;
}