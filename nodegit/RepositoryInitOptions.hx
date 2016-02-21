package nodegit;
typedef RepositoryInitOptions = {
	@:optional
	var description : String;
	@:optional
	var flags : Float;
	@:optional
	var initialHead : String;
	@:optional
	var mode : Float;
	@:optional
	var originUrl : String;
	@:optional
	var templatePath : String;
	@:optional
	var version : Float;
	@:optional
	var workdirPath : String;
}