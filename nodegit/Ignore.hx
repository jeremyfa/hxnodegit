package nodegit;
@:jsRequire("nodegit", "Ignore") extern class Ignore {
	static function addRule(repo:Dynamic, rules:String):Float;
	static function clearInternalRules(repo:Dynamic):Float;
	static function pathIsIgnored(repo:Dynamic, path:String):Float;
}