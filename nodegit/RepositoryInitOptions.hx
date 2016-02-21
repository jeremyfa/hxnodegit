package nodegit;
@:jsRequire("nodegit", "RepositoryInitOptions") extern class RepositoryInitOptions {
	var description : String;
	var flags : Float;
	var initialHead : String;
	var mode : Float;
	var originUrl : String;
	var templatePath : String;
	var version : Float;
	var workdirPath : String;
	function new();
}