package nodegit;
typedef BlameOptions = {
	var flags : Float;
	var maxLine : Float;
	var minLine : Float;
	var minMatchCharacters : Float;
	var newestCommit : nodegit.Oid;
	var oldestCommit : nodegit.Oid;
	var version : Float;
}