package nodegit;
@:jsRequire("nodegit", "Remote") extern class Remote {
	static function addFetch(repo:nodegit.Repository, remote:String, refspec:String):Float;
	static function addPush(repo:nodegit.Repository, remote:String, refspec:String):Float;
	static function create(repo:nodegit.Repository, name:String, url:String):nodegit.Remote;
	static function createAnonymous(repo:nodegit.Repository, url:String):js.Promise<nodegit.Remote>;
	static function createWithFetchspec(repo:nodegit.Repository, name:String, url:String, fetch:String):js.Promise<nodegit.Remote>;
	static function delete(repo:nodegit.Repository, name:String):js.Promise<Float>;
	static function initCallbacks(opts:nodegit.RemoteCallbacks, version:Float):Float;
	static function isValidName(remote_name:String):Float;
	static function list(repo:nodegit.Repository):js.Promise<Array<Dynamic>>;
	static function lookup(repo:nodegit.Repository, name:Dynamic, callback:Dynamic):js.Promise<nodegit.Remote>;
	static function setAutotag(repo:nodegit.Repository, remote:String, value:Float):Float;
	static function setPushurl(repo:nodegit.Repository, remote:String, url:String):Float;
	static function setUrl(repo:nodegit.Repository, remote:String, url:String):Float;
	function autotag():Float;
	function connect(direction:Dynamic, callbacks:nodegit.RemoteCallbacks, callback:Dynamic):js.Promise<Float>;
	function connected():Float;
	function defaultBranch():js.Promise<nodegit.Buf>;
	function disconnect():js.Promise<Void>;
	function download(refSpecs:Array<Dynamic>, opts:nodegit.FetchOptions, callback:Dynamic):js.Promise<Float>;
	function dup():js.Promise<nodegit.Remote>;
	function fetch(refSpecs:Array<Dynamic>, opts:nodegit.FetchOptions, message:String, callback:Dynamic):js.Promise<Float>;
	function free():Void;
	function getFetchRefspecs():js.Promise<Array<Dynamic>>;
	function getPushRefspecs():js.Promise<Array<Dynamic>>;
	function getRefspec(n:Float):nodegit.Refspec;
	function name():String;
	function owner():nodegit.Repository;
	function prune(callbacks:nodegit.RemoteCallbacks):Float;
	function pruneRefs():Float;
	function push(refSpecs:Array<Dynamic>, options:nodegit.PushOptions, callback:Dynamic):js.Promise<Float>;
	function pushurl():String;
	function refspecCount():Float;
	function stats():nodegit.TransferProgress;
	function stop():Void;
	function updateTips(callbacks:nodegit.RemoteCallbacks, update_fetchhead:Float, download_tags:Float, reflog_message:String):Float;
	function upload(refspecs:nodegit.Strarray, opts:nodegit.PushOptions):Float;
	function url():String;
	static var AUTOTAG_OPTION : RemoteAutotagOption;
	static var COMPLETION_TYPE : RemoteCompletionType;
}
extern class RemoteAutotagOption {
	var DOWNLOAD_TAGS_UNSPECIFIED : Int = 0;
	var DOWNLOAD_TAGS_AUTO : Int = 1;
	var DOWNLOAD_TAGS_NONE : Int = 2;
	var DOWNLOAD_TAGS_ALL : Int = 3;
}
extern class RemoteCompletionType {
	var COMPLETION_DOWNLOAD : Int = 0;
	var COMPLETION_INDEXING : Int = 1;
	var COMPLETION_ERROR : Int = 2;
}