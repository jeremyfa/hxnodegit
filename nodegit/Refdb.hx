package nodegit;
@:jsRequire("nodegit", "Refdb") extern class Refdb {
	static function open(repo:Dynamic):Promise<Dynamic>;
	function compress():Float;
	function free():Void;
}