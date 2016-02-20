package nodegit;
@:jsRequire("nodegit", "Ignore") extern class Ignore {
	static function addRule(repo:nodegit.Repository, rules:String):Float;
	static function clearInternalRules(repo:nodegit.Repository):Float;
	static function pathIsIgnored(repo:nodegit.Repository, path:String):Float;
}