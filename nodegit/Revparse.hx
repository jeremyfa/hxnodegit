package nodegit;
@:jsRequire("nodegit", "Revparse") extern class Revparse {
	static function ext(object_out:nodegit.Object, reference_out:nodegit.Reference, repo:nodegit.Repository, spec:String):Dynamic;
	static function single(repo:nodegit.Repository, spec:String):js.Promise<nodegit.Object>;
	static var MODE : Dynamic;
}