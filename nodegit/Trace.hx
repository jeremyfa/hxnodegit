package nodegit;
@:jsRequire("nodegit", "Trace") extern class Trace {
	static var LEVEL(default, null) : TraceLevel;
}
extern class TraceLevel {
	var NONE(default, null) : Int = 0;
	var FATAL(default, null) : Int = 1;
	var ERROR(default, null) : Int = 2;
	var WARN(default, null) : Int = 3;
	var INFO(default, null) : Int = 4;
	var DEBUG(default, null) : Int = 5;
	var TRACE(default, null) : Int = 6;
}