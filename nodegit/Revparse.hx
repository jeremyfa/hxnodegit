package nodegit;
@:jsRequire("nodegit", "Revparse") extern class Revparse {
	static function ext(object_out:nodegit.Object, reference_out:nodegit.Reference, repo:nodegit.Repository, spec:String):Dynamic;
	static function single(repo:nodegit.Repository, spec:String):js.Promise<nodegit.Object>;
	static var MODE : RevparseMode;
}
extern class RevparseMode {
	var SINGLE : Int = 1;
	var RANGE : Int = 2;
	var MERGE_BASE : Int = 4;
}