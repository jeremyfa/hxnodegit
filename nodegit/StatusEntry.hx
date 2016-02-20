package nodegit;
@:jsRequire("nodegit", "StatusEntry") extern class StatusEntry {
	var headToIndex : nodegit.DiffDelta;
	var indexToWorkdir : nodegit.DiffDelta;
	var status : Float;
}