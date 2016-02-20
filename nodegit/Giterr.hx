package nodegit;
@:jsRequire("nodegit", "Giterr") extern class Giterr {
	static function errClear():Void;
	static function errDetach(cpy:nodegit.Error):Float;
	static function errLast():nodegit.Error;
	static function errSetOom():Void;
	static function errSetString(error_class:Float, string:String):Void;
}