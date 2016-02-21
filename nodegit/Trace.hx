package nodegit;
@:jsRequire("nodegit", "Trace") extern class Trace {
	static var LEVEL : TraceLevel;
}
extern class TraceLevel {
	var NONE : Int = 0;
	var FATAL : Int = 1;
	var ERROR : Int = 2;
	var WARN : Int = 3;
	var INFO : Int = 4;
	var DEBUG : Int = 5;
	var TRACE : Int = 6;
}