package nodegit;
@:jsRequire("nodegit", "RebaseOperation") extern class RebaseOperation {
	var exec : String;
	var id : nodegit.Oid;
	var type : Float;
	static var REBASE_OPERATION(default, null) : RebaseOperationRebaseOperation;
}
extern class RebaseOperationRebaseOperation {
	var PICK(default, null) : Int;
	var REWORD(default, null) : Int;
	var EDIT(default, null) : Int;
	var SQUASH(default, null) : Int;
	var FIXUP(default, null) : Int;
	var EXEC(default, null) : Int;
}