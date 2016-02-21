package nodegit;
@:jsRequire("nodegit", "Trace") extern class Trace {
	static var LEVEL(default, null) : TraceLevel;
}
extern class TraceLevel {
	var NONE(default, null) : Int;
	var FATAL(default, null) : Int;
	var ERROR(default, null) : Int;
	var WARN(default, null) : Int;
	var INFO(default, null) : Int;
	var DEBUG(default, null) : Int;
	var TRACE(default, null) : Int;
}