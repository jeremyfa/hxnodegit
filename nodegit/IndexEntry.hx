package nodegit;
typedef IndexEntry = {
	@:optional
	var ctime : nodegit.IndexTime;
	@:optional
	var dev : Float;
	@:optional
	var fileSize : Float;
	@:optional
	var flags : Float;
	@:optional
	var flagsExtended : Float;
	@:optional
	var gid : Float;
	@:optional
	var id : nodegit.Oid;
	@:optional
	var ino : Float;
	@:optional
	var mode : Float;
	@:optional
	var mtime : nodegit.IndexTime;
	@:optional
	var path : String;
	@:optional
	var uid : Float;
}