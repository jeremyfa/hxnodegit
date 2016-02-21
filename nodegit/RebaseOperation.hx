package nodegit;
@:jsRequire("nodegit", "RebaseOperation") extern class RebaseOperation {
	var exec : String;
	var id : nodegit.Oid;
	var type : Float;
	static var REBASE_OPERATION : RebaseOperationRebaseOperation;
}
extern class RebaseOperationRebaseOperation {
	var PICK : Int = 0;
	var REWORD : Int = 1;
	var EDIT : Int = 2;
	var SQUASH : Int = 3;
	var FIXUP : Int = 4;
	var EXEC : Int = 5;
}