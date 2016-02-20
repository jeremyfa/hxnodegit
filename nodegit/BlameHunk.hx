package nodegit;
@:jsRequire("nodegit", "BlameHunk") extern class BlameHunk {
	var finalCommitId : nodegit.Oid;
	var finalSignature : nodegit.Signature;
	var finalStartLineNumber : Float;
	var linesInHunk : Float;
	var origCommitId : nodegit.Oid;
	var origPath : String;
	var origSignature : nodegit.Signature;
	var origStartLineNumber : Float;
}