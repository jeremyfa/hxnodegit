package nodegit;
@:jsRequire("nodegit", "Submodule") extern class Submodule {
	static function addSetup(repo:Dynamic, url:String, path:String, use_gitlink:Float):Promise<Dynamic>;
	static function foreach(repo:Dynamic, callback:Dynamic, payload:Dynamic):Promise<Float>;
	static function lookup(repo:Dynamic, name:String):Promise<Dynamic>;
	static function resolveUrl(repo:Dynamic, url:String):Promise<Dynamic>;
	static function setBranch(repo:Dynamic, name:String, branch:String):Float;
	static function setFetchRecurseSubmodules(repo:Dynamic, name:String, fetch_recurse_submodules:Float):Float;
	static function setIgnore(repo:Dynamic, name:String, ignore:Float):Promise<Float>;
	static function setUpdate(repo:Dynamic, name:String, update:Float):Promise<Float>;
	static function setUrl(repo:Dynamic, name:String, url:String):Promise<Float>;
	static function status(repo:Dynamic, name:String, ignore:Float):Promise<Float>;
	static function updateInitOptions(opts:Dynamic, version:Float):Float;
	function addFinalize():Promise<Float>;
	function addToIndex(write_index:Float):Promise<Float>;
	function branch():String;
	function fetchRecurseSubmodules():Float;
	function free():Void;
	function headId():Dynamic;
	function ignore():Dynamic;
	function indexId():Dynamic;
	function init(overwrite:Float):Promise<Float>;
	function location():Promise<Float>;
	function name():String;
	function open():Promise<Dynamic>;
	function owner():Dynamic;
	function path():String;
	function reload(force:Float):Float;
	function repoInit(use_gitlink:Float):Promise<Dynamic>;
	function sync():Promise<Float>;
	function update(init:Float, options:Dynamic):Promise<Float>;
	function updateStrategy():Dynamic;
	function url():String;
	function wdId():Dynamic;
	static var IGNORE : Dynamic;
	static var RECURSE : Dynamic;
	static var STATUS : Dynamic;
	static var UPDATE : Dynamic;
}