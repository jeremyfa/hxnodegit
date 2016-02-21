package nodegit;
@:jsRequire("nodegit", "Revwalk") extern class Revwalk {
	static function create(repo:nodegit.Repository):nodegit.Revwalk;
	function fastWalk(max_count:Float):js.Promise<Dynamic>;
	function fileHistoryWalk(filePath:String, max_count:Float):js.Promise<Array<Dynamic>>;
	function getCommits(count:Float):js.Promise<Array<nodegit.Commit>>;
	function getCommitsUntil(checkFn:Dynamic):js.Promise<Array<Dynamic>>;
	function hide(commit_id:nodegit.Oid):Float;
	function hideGlob(glob:String):Float;
	function hideHead():Float;
	function hideRef(refname:String):Float;
	function next():js.Promise<nodegit.Oid>;
	function push(id:nodegit.Oid):Float;
	function pushGlob(glob:String):Float;
	function pushHead():Float;
	function pushRange(range:String):Float;
	function pushRef(refname:String):Float;
	function repository():nodegit.Repository;
	function reset():Void;
	function simplifyFirstParent():Void;
	function sorting(sort:Float):Void;
	function walk(oid:nodegit.Oid, callback:Dynamic):nodegit.Commit;
	static var SORT(default, null) : RevwalkSort;
}
extern class RevwalkSort {
	var NONE(default, null) : Int = 0;
	var TOPOLOGICAL(default, null) : Int = 1;
	var TIME(default, null) : Int = 2;
	var REVERSE(default, null) : Int = 4;
}