package nodegit;
@:jsRequire("nodegit", "Tag") extern class Tag {
	static function annotationCreate(repo:nodegit.Repository, tag_name:String, target:nodegit.Object, tagger:nodegit.Signature, message:String):js.Promise<Dynamic>;
	static function create(repo:nodegit.Repository, tag_name:String, target:nodegit.Object, tagger:nodegit.Signature, message:String, force:Float):js.Promise<nodegit.Oid>;
	static function createLightweight(repo:nodegit.Repository, tag_name:String, target:nodegit.Object, force:Float):js.Promise<nodegit.Oid>;
	static function delete(repo:nodegit.Repository, tag_name:String):js.Promise<Float>;
	static function list(repo:nodegit.Repository):js.Promise<Array<Dynamic>>;
	static function listMatch(tag_names:nodegit.Strarray, pattern:String, repo:nodegit.Repository):Float;
	static function lookup(repo:nodegit.Repository, id:haxe.extern.EitherType<String, haxe.extern.EitherType<nodegit.Oid, nodegit.Tag>>):js.Promise<nodegit.Tag>;
	static function lookupPrefix(repo:nodegit.Repository, id:nodegit.Oid, len:Float):js.Promise<nodegit.Tag>;
	function free():Void;
	function id():nodegit.Oid;
	function message():String;
	function name():String;
	function owner():nodegit.Repository;
	function peel(tag_target_out:nodegit.Object):Float;
	function tagger():nodegit.Signature;
	function target():nodegit.Object;
	function targetId():nodegit.Oid;
	function targetType():Float;
}