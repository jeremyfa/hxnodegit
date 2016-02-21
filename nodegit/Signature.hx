package nodegit;
@:jsRequire("nodegit", "Signature") extern class Signature {
	var email : String;
	var name : String;
	var when : nodegit.Time;
	static function create(name:String, email:String, time:Float, offset:Float):nodegit.Signature;
	@:native("default")
	static function default_(repo:nodegit.Repository):nodegit.Signature;
	static function now(name:String, email:String):nodegit.Signature;
	function dup():js.Promise<nodegit.Signature>;
	function free():Void;
	function toString():Dynamic;
}