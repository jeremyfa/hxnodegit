package nodegit;
@:jsRequire("nodegit", "StatusList") extern class StatusList {
	static function create(repo:Dynamic, opts:Dynamic):Promise<Dynamic>;
	function entrycount():Float;
	function free():Void;
	function getPerfdata():Promise<Dynamic>;
}