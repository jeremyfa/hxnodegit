package nodegit;
@:jsRequire("nodegit", "Object") extern class Object {
	static function lookup(repo:nodegit.Repository, id:nodegit.Oid, type:Float):js.Promise<nodegit.Object>;
	static function lookupPrefix(repo:nodegit.Repository, id:nodegit.Oid, len:Float, type:Float):js.Promise<nodegit.Object>;
	static function size(type:Float):Float;
	static function string2type(str:String):Float;
	static function type2string(type:Float):String;
	static function typeisloose(type:Float):Dynamic;
	function dup():js.Promise<nodegit.Object>;
	function free():Void;
	function id():nodegit.Oid;
	function lookupByPath(path:String, type:Float):js.Promise<Dynamic>;
	function owner():nodegit.Repository;
	function peel(target_type:Float):js.Promise<nodegit.Object>;
	function shortId():js.Promise<nodegit.Buf>;
	function type():Float;
	static var TYPE : ObjectType;
}
extern class ObjectType {
	var ANY : Int = -2;
	var BAD : Int = -1;
	var EXT1 : Int = 0;
	var COMMIT : Int = 1;
	var TREE : Int = 2;
	var BLOB : Int = 3;
	var TAG : Int = 4;
	var EXT2 : Int = 5;
	var OFS_DELTA : Int = 6;
	var REF_DELTA : Int = 7;
}