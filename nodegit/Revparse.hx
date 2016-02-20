package nodegit;
@:jsRequire("nodegit", "Revparse") extern class Revparse {
	static function ext(object_out:Dynamic, reference_out:Dynamic, repo:Dynamic, spec:String):Dynamic;
	static function single(repo:Dynamic, spec:String):Promise<Dynamic>;
	static var MODE : Dynamic;
}