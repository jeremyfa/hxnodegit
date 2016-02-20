package nodegit;
@:jsRequire("nodegit", "Repository") extern class Repository {
	static function discover(start_path:String, across_fs:Float, ceiling_dirs:String):Promise<Dynamic>;
	static function init(path:String, is_bare:Float):Promise<Dynamic>;
	static function initExt(repo_path:String, opts:Dynamic):Promise<Dynamic>;
	static function open(path:String):Promise<Dynamic>;
	static function openBare(bare_path:String):Promise<Dynamic>;
	static function openExt(path:String, flags:Float, ceiling_dirs:String):Promise<Dynamic>;
	static function wrapOdb(odb:Dynamic):Promise<Dynamic>;
	function checkoutBranch(branch:Dynamic, opts:Dynamic):Promise<Void>;
	function config():Promise<Dynamic>;
	function configSnapshot():Promise<Dynamic>;
	function continueRebase(signature:Dynamic, beforeNextFn:Dynamic):Dynamic;
	function createBlobFromBuffer(buffer:Dynamic):Dynamic;
	function createBranch(name:String, commit:Dynamic, force:Bool, signature:Dynamic, logMessage:String):Promise<Dynamic>;
	function createCommit(updateRef:String, author:Dynamic, committer:Dynamic, message:String, Tree:Dynamic, parents:Array<Dynamic>):Promise<Dynamic>;
	function createCommitOnHead(filesToAdd:Array<Dynamic>, author:Dynamic, committer:Dynamic, message:String):Promise<Dynamic>;
	function createLightweightTag(String:Dynamic, name:String):Promise<Dynamic>;
	function createRevWalk(String:Dynamic):Dynamic;
	function createTag(String:Dynamic, name:String, message:String):Promise<Dynamic>;
	function defaultSignature():Dynamic;
	function deleteTagByName(Short:String):Promise<Void>;
	function detachHead():Dynamic;
	function fetch(remote:Dynamic, fetchOptions:Dynamic):Void;
	function fetchAll(fetchOptions:Dynamic, callback:Dynamic):Void;
	function fetchheadForeach(callback:Dynamic):Promise<Void>;
	function free():Void;
	function getBlob(String:Dynamic):Promise<Dynamic>;
	function getBranch(name:Dynamic):Promise<Dynamic>;
	function getBranchCommit(name:Dynamic):Promise<Dynamic>;
	function getCommit(String:Dynamic):Promise<Dynamic>;
	function getCurrentBranch():Promise<Dynamic>;
	function getHeadCommit():Promise<Dynamic>;
	function getMasterCommit():Promise<Dynamic>;
	function getNamespace():String;
	function getReference(name:Dynamic):Promise<Dynamic>;
	function getReferenceCommit(name:Dynamic):Promise<Dynamic>;
	function getReferenceNames(type:Dynamic):Promise<Array<String>>;
	function getReferences(type:Dynamic):js.Promise<nodegit.Array<Reference>>;
	function getRemote(remote:Dynamic, callback:Dynamic):Dynamic;
	function getRemotes(Optional:Dynamic):Dynamic;
	function getStatus(opts:Dynamic):Promise<Array<Dynamic>>;
	function getStatusExt(opts:Dynamic):Promise<Array<Dynamic>>;
	function getSubmoduleNames():Promise<Array<String>>;
	function getTag(String:Dynamic):Promise<Dynamic>;
	function getTagByName(Short:String):Promise<Dynamic>;
	function getTree(String:Dynamic):Promise<Dynamic>;
	function head():Promise<Dynamic>;
	function headDetached():Dynamic;
	function headUnborn():Dynamic;
	function index():Promise<Dynamic>;
	function isApplyingMailbox():Bool;
	function isBare():Float;
	function isBisecting():Bool;
	function isCherrypicking():Bool;
	function isDefaultState():Bool;
	function isEmpty():Dynamic;
	function isMerging():Bool;
	function isRebasing():Bool;
	function isReverting():Bool;
	function isShallow():Float;
	function mergeBranches(to:Dynamic, from:Dynamic, signature:Dynamic, mergePreference:Dynamic, mergeOptions:Dynamic):Dynamic;
	function messageRemove():Float;
	function odb():Promise<Dynamic>;
	function path():String;
	function rebaseBranches(branch:String, upstream:String, onto:String, signature:Dynamic, beforeNextFn:Dynamic):Dynamic;
	function refdb():Promise<Dynamic>;
	function setHead(refname:String):Promise<Float>;
	function setHeadDetached(commitish:Dynamic):Float;
	function setHeadDetachedFromAnnotated(commitish:Dynamic):Float;
	function setIdent(name:String, email:String):Float;
	function setNamespace(nmspace:String):Float;
	function setWorkdir(workdir:String, update_gitlink:Float):Float;
	function stageFilemode(filePath:Dynamic, stageNew:Bool):Promise<Float>;
	function stageLines(filePath:String, newLines:Array<Dynamic>, isStaged:Bool):Promise<Float>;
	function state():Float;
	function stateCleanup():Float;
	function treeBuilder(tree:Dynamic):Void;
	function workdir():String;
	static var INIT_FLAG : Dynamic;
	static var INIT_MODE : Dynamic;
	static var OPEN_FLAG : Dynamic;
	static var STATE : Dynamic;
}