package nodegit;
@:jsRequire("nodegit", "DiffBinary") extern class DiffBinary {
	var newFile : nodegit.DiffBinaryFile;
	var oldFile : nodegit.DiffBinaryFile;
	static var DIFF_BINARY : DiffBinaryDiffBinary;
}
extern class DiffBinaryDiffBinary {
	var NONE : Int = 0;
	var LITERAL : Int = 1;
	var DELTA : Int = 2;
}