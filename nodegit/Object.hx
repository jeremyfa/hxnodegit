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
	static var TYPE(default, null) : ObjectType;
}
extern class ObjectType {
	var ANY(default, null) : Int = -2;
	var BAD(default, null) : Int = -1;
	var EXT1(default, null) : Int = 0;
	var COMMIT(default, null) : Int = 1;
	var TREE(default, null) : Int = 2;
	var BLOB(default, null) : Int = 3;
	var TAG(default, null) : Int = 4;
	var EXT2(default, null) : Int = 5;
	var OFS_DELTA(default, null) : Int = 6;
	var REF_DELTA(default, null) : Int = 7;
}