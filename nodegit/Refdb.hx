package nodegit;
@:jsRequire("nodegit", "Refdb") extern class Refdb {
	static function open(repo:nodegit.Repository):js.Promise<nodegit.Refdb>;
	function compress():Float;
	function free():Void;
}