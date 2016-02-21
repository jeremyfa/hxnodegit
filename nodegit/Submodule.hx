package nodegit;
@:jsRequire("nodegit", "Submodule") extern class Submodule {
	static function addSetup(repo:nodegit.Repository, url:String, path:String, use_gitlink:Float):js.Promise<nodegit.Submodule>;
	static function foreach(repo:nodegit.Repository, callback:Dynamic, payload:Dynamic):js.Promise<Float>;
	static function lookup(repo:nodegit.Repository, name:String):js.Promise<nodegit.Submodule>;
	static function resolveUrl(repo:nodegit.Repository, url:String):js.Promise<nodegit.Buf>;
	static function setBranch(repo:nodegit.Repository, name:String, branch:String):Float;
	static function setFetchRecurseSubmodules(repo:nodegit.Repository, name:String, fetch_recurse_submodules:Float):Float;
	static function setIgnore(repo:nodegit.Repository, name:String, ignore:Float):js.Promise<Float>;
	static function setUpdate(repo:nodegit.Repository, name:String, update:Float):js.Promise<Float>;
	static function setUrl(repo:nodegit.Repository, name:String, url:String):js.Promise<Float>;
	static function status(repo:nodegit.Repository, name:String, ignore:Float):js.Promise<Float>;
	static function updateInitOptions(opts:nodegit.SubmoduleUpdateOptions, version:Float):Float;
	function addFinalize():js.Promise<Float>;
	function addToIndex(write_index:Float):js.Promise<Float>;
	function branch():String;
	function fetchRecurseSubmodules():Float;
	function free():Void;
	function headId():nodegit.Oid;
	function ignore():Dynamic;
	function indexId():nodegit.Oid;
	function init(overwrite:Float):js.Promise<Float>;
	function location():js.Promise<Float>;
	function name():String;
	function open():js.Promise<nodegit.Repository>;
	function owner():nodegit.Repository;
	function path():String;
	function reload(force:Float):Float;
	function repoInit(use_gitlink:Float):js.Promise<nodegit.Repository>;
	function sync():js.Promise<Float>;
	function update(init:Float, options:nodegit.SubmoduleUpdateOptions):js.Promise<Float>;
	function updateStrategy():Dynamic;
	function url():String;
	function wdId():nodegit.Oid;
	static var IGNORE(default, null) : SubmoduleIgnore;
	static var RECURSE(default, null) : SubmoduleRecurse;
	static var STATUS(default, null) : SubmoduleStatus;
	static var UPDATE(default, null) : SubmoduleUpdate;
}
extern class SubmoduleIgnore {
	var UNSPECIFIED(default, null) : Int = -1;
	var NONE(default, null) : Int = 1;
	var UNTRACKED(default, null) : Int = 2;
	var DIRTY(default, null) : Int = 3;
	var ALL(default, null) : Int = 4;
}
extern class SubmoduleRecurse {
	var NO(default, null) : Int = 0;
	var YES(default, null) : Int = 1;
	var ONDEMAND(default, null) : Int = 2;
}
extern class SubmoduleStatus {
	var IN_HEAD(default, null) : Int = 1;
	var IN_INDEX(default, null) : Int = 2;
	var IN_CONFIG(default, null) : Int = 4;
	var IN_WD(default, null) : Int = 8;
	var INDEX_ADDED(default, null) : Int = 16;
	var INDEX_DELETED(default, null) : Int = 32;
	var INDEX_MODIFIED(default, null) : Int = 64;
	var WD_UNINITIALIZED(default, null) : Int = 128;
	var WD_ADDED(default, null) : Int = 256;
	var WD_DELETED(default, null) : Int = 512;
	var WD_MODIFIED(default, null) : Int = 1024;
	var WD_INDEX_MODIFIED(default, null) : Int = 2048;
	var WD_WD_MODIFIED(default, null) : Int = 4096;
	var WD_UNTRACKED(default, null) : Int = 8192;
}
extern class SubmoduleUpdate {
	var CHECKOUT(default, null) : Int = 1;
	var REBASE(default, null) : Int = 2;
	var MERGE(default, null) : Int = 3;
	var NONE(default, null) : Int = 4;
	var DEFAULT(default, null) : Int = 0;
}