package nodegit;
@:jsRequire("nodegit", "Revwalk") extern class Revwalk {
	static function create(repo:Dynamic):Dynamic;
	function fastWalk(max_count:Float):Promise<Dynamic>;
	function fileHistoryWalk(filePath:String, max_count:Float):Promise<Array<Dynamic>>;
	function getCommits(count:Float):js.Promise<nodegit.Array<Commit>>;
	function getCommitsUntil(checkFn:Dynamic):Promise<Array<Dynamic>>;
	function hide(commit_id:Dynamic):Float;
	function hideGlob(glob:String):Float;
	function hideHead():Float;
	function hideRef(refname:String):Float;
	function next():Promise<Dynamic>;
	function push(id:Dynamic):Float;
	function pushGlob(glob:String):Float;
	function pushHead():Float;
	function pushRange(range:String):Float;
	function pushRef(refname:String):Float;
	function repository():Dynamic;
	function reset():Void;
	function simplifyFirstParent():Void;
	function sorting(sort:Float):Void;
	function walk(oid:Dynamic, callback:Dynamic):Dynamic;
	static var SORT : Dynamic;
}