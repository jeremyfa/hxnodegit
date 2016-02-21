package nodegit;
typedef MergeFileOptions = {
	@:optional
	var ancestorLabel : String;
	@:optional
	var favor : Float;
	@:optional
	var flags : Float;
	@:optional
	var ourLabel : String;
	@:optional
	var theirLabel : String;
	@:optional
	var version : Float;
}