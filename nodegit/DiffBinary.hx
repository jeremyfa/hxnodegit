package nodegit;
@:jsRequire("nodegit", "DiffBinary") extern class DiffBinary {
	var newFile : nodegit.DiffBinaryFile;
	var oldFile : nodegit.DiffBinaryFile;
	static var DIFF_BINARY(default, null) : DiffBinaryDiffBinary;
}
extern class DiffBinaryDiffBinary {
	var NONE(default, null) : Int;
	var LITERAL(default, null) : Int;
	var DELTA(default, null) : Int;
}