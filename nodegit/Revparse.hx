package nodegit;
@:jsRequire("nodegit", "Revparse") extern class Revparse {
	static function ext(object_out:nodegit.Object, reference_out:nodegit.Reference, repo:nodegit.Repository, spec:String):Dynamic;
	static function single(repo:nodegit.Repository, spec:String):js.Promise<nodegit.Object>;
	static var MODE(default, null) : RevparseMode;
}
extern class RevparseMode {
	var SINGLE(default, null) : Int = 1;
	var RANGE(default, null) : Int = 2;
	var MERGE_BASE(default, null) : Int = 4;
}