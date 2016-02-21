package nodegit;
typedef BlameOptions = {
	@:optional
	var flags : Float;
	@:optional
	var maxLine : Float;
	@:optional
	var minLine : Float;
	@:optional
	var minMatchCharacters : Float;
	@:optional
	var newestCommit : nodegit.Oid;
	@:optional
	var oldestCommit : nodegit.Oid;
	@:optional
	var version : Float;
}