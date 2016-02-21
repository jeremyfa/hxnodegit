package nodegit;
typedef IndexEntry = {
	var ctime : nodegit.IndexTime;
	var dev : Float;
	var fileSize : Float;
	var flags : Float;
	var flagsExtended : Float;
	var gid : Float;
	var id : nodegit.Oid;
	var ino : Float;
	var mode : Float;
	var mtime : nodegit.IndexTime;
	var path : String;
	var uid : Float;
}