package nodegit;
@:jsRequire("nodegit", "PushUpdate") extern class PushUpdate {
	var dst : nodegit.Oid;
	var dstRefname : String;
	var src : nodegit.Oid;
	var srcRefname : String;
}