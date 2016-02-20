package nodegit;
@:jsRequire("nodegit", "StatusList") extern class StatusList {
	static function create(repo:nodegit.Repository, opts:nodegit.StatusOptions):js.Promise<nodegit.StatusList>;
	function entrycount():Float;
	function free():Void;
	function getPerfdata():js.Promise<nodegit.DiffPerfdata>;
}