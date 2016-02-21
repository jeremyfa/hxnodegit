package nodegit;
@:jsRequire("nodegit", "Reference") extern class Reference {
	static function create(repo:nodegit.Repository, name:String, id:nodegit.Oid, force:Float, log_message:String):js.Promise<nodegit.Reference>;
	static function createMatching(repo:nodegit.Repository, name:String, id:nodegit.Oid, force:Float, current_id:nodegit.Oid, log_message:String):js.Promise<nodegit.Reference>;
	static function dwim(repo:nodegit.Repository, id:Dynamic, callback:Dynamic):js.Promise<nodegit.Reference>;
	static function ensureLog(repo:nodegit.Repository, refname:String):Float;
	static function hasLog(repo:nodegit.Repository, refname:String):Dynamic;
	static function isValidName(refname:String):Float;
	static function list(repo:nodegit.Repository):js.Promise<Array<Dynamic>>;
	static function lookup(repo:nodegit.Repository, id:Dynamic, callback:Dynamic):js.Promise<nodegit.Reference>;
	static function nameToId(repo:nodegit.Repository, name:String):js.Promise<nodegit.Oid>;
	static function normalizeName(buffer_out:String, buffer_size:Float, name:String, flags:Float):Dynamic;
	static function remove(repo:nodegit.Repository, name:String):Float;
	static function symbolicCreate(repo:nodegit.Repository, name:String, target:String, force:Float, log_message:String):js.Promise<nodegit.Reference>;
	static function symbolicCreateMatching(repo:nodegit.Repository, name:String, target:String, force:Float, current_value:String, log_message:String):js.Promise<nodegit.Reference>;
	function cmp(ref2:nodegit.Reference):Float;
	function delete():Float;
	function isBranch():Dynamic;
	function isConcrete():Bool;
	function isHead():Bool;
	function isNote():Dynamic;
	function isRemote():Dynamic;
	function isSymbolic():Bool;
	function isTag():Dynamic;
	function isValid():Bool;
	function name():String;
	function owner():nodegit.Repository;
	function peel(type:Float):js.Promise<nodegit.Object>;
	function rename(new_name:String, force:Float, log_message:String):js.Promise<nodegit.Reference>;
	function resolve():js.Promise<nodegit.Reference>;
	function setTarget(id:nodegit.Oid, log_message:String):js.Promise<nodegit.Reference>;
	function shorthand():String;
	function symbolicSetTarget(target:String, log_message:String):js.Promise<nodegit.Reference>;
	function symbolicTarget():String;
	function target():nodegit.Oid;
	function targetPeel():nodegit.Oid;
	function toString():String;
	function type():Float;
	static var NORMALIZE(default, null) : ReferenceNormalize;
	static var TYPE(default, null) : ReferenceType;
}
extern class ReferenceNormalize {
	var REF_FORMAT_NORMAL(default, null) : Int = 0;
	var REF_FORMAT_ALLOW_ONELEVEL(default, null) : Int = 1;
	var REF_FORMAT_REFSPEC_PATTERN(default, null) : Int = 2;
	var REF_FORMAT_REFSPEC_SHORTHAND(default, null) : Int = 4;
}
extern class ReferenceType {
	var INVALID(default, null) : Int = 0;
	var OID(default, null) : Int = 1;
	var SYMBOLIC(default, null) : Int = 2;
	var LISTALL(default, null) : Int = 3;
}