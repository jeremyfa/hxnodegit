package nodegit;
@:jsRequire("nodegit", "RebaseOperation") extern class RebaseOperation {
	var exec : String;
	var id : nodegit.Oid;
	var type : Float;
	static var REBASE_OPERATION(default, null) : RebaseOperationRebaseOperation;
}
extern class RebaseOperationRebaseOperation {
	var PICK(default, null) : Int = 0;
	var REWORD(default, null) : Int = 1;
	var EDIT(default, null) : Int = 2;
	var SQUASH(default, null) : Int = 3;
	var FIXUP(default, null) : Int = 4;
	var EXEC(default, null) : Int = 5;
}