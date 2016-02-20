package nodegit;
@:jsRequire("nodegit", "Giterr") extern class Giterr {
	static function errClear():Void;
	static function errDetach(cpy:Dynamic):Float;
	static function errLast():Dynamic;
	static function errSetOom():Void;
	static function errSetString(error_class:Float, string:String):Void;
}