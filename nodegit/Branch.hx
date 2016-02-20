package nodegit;
@:jsRequire("nodegit", "Branch") extern class Branch {
	static function create(repo:Dynamic, branch_name:String, target:Dynamic, force:Float):Promise<Dynamic>;
	static function createFromAnnotated(repository:Dynamic, branch_name:String, commit:Dynamic, force:Float):Dynamic;
	static function delete(branch:Dynamic):Float;
	static function isHead(branch:Dynamic):Dynamic;
	static function iteratorNew(repo:Dynamic, list_flags:Float):Promise<Dynamic>;
	static function lookup(repo:Dynamic, branch_name:String, branch_type:Float):Promise<Dynamic>;
	static function move(branch:Dynamic, new_branch_name:String, force:Float):Promise<Dynamic>;
	static function name(ref:Dynamic):Promise<String>;
	static function setUpstream(branch:Dynamic, upstream_name:String):Promise<Float>;
	static function upstream(branch:Dynamic):Promise<Dynamic>;
	static var BRANCH : Dynamic;
}