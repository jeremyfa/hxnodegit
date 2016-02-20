package nodegit;
@:jsRequire("nodegit", "BlameHunk") extern class BlameHunk {
	var finalCommitId : Dynamic;
	var finalSignature : Dynamic;
	var finalStartLineNumber : Float;
	var linesInHunk : Float;
	var origCommitId : Dynamic;
	var origPath : String;
	var origSignature : Dynamic;
	var origStartLineNumber : Float;
}