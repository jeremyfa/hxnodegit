package nodegit;
@:jsRequire("nodegit", "DiffBinary") extern class DiffBinary {
	var newFile : nodegit.DiffBinaryFile;
	var oldFile : nodegit.DiffBinaryFile;
	static var DIFF_BINARY(default, null) : DiffBinaryDiffBinary;
}
extern class DiffBinaryDiffBinary {
	var NONE(default, null) : Int = 0;
	var LITERAL(default, null) : Int = 1;
	var DELTA(default, null) : Int = 2;
}