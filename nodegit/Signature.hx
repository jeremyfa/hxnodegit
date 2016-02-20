package nodegit;
@:jsRequire("nodegit", "Signature") extern class Signature {
	var email : String;
	var name : String;
	var when : Dynamic;
	static function create(name:String, email:String, time:Float, offset:Float):Dynamic;
	static function default(repo:Dynamic):Dynamic;
	static function now(name:String, email:String):Dynamic;
	function dup():Promise<Dynamic>;
	function free():Void;
	function toString():Dynamic;
}