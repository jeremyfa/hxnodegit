package nodegit;
@:jsRequire("nodegit", "DiffDelta") extern class DiffDelta {
	var flags : Float;
	var newFile : nodegit.DiffFile;
	var nfiles : Float;
	var oldFile : nodegit.DiffFile;
	var similarity : Float;
	var status : Float;
}