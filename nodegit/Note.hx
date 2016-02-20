package nodegit;
@:jsRequire("nodegit", "Note") extern class Note {
	static function create(repo:nodegit.Repository, notes_ref:String, author:nodegit.Signature, committer:nodegit.Signature, oid:nodegit.Oid, note:String, force:Float):js.Promise<nodegit.Oid>;
	static function foreach(repo:nodegit.Repository, notes_ref:String, note_cb:Dynamic, payload:Dynamic):js.Promise<Float>;
	static function iteratorNew(repo:nodegit.Repository, notes_ref:String):js.Promise<Dynamic>;
	static function next(note_id:nodegit.Oid, annotated_id:nodegit.Oid, it:Dynamic):Dynamic;
	static function read(repo:nodegit.Repository, notes_ref:String, oid:nodegit.Oid):js.Promise<nodegit.Note>;
	static function remove(repo:nodegit.Repository, notes_ref:String, author:nodegit.Signature, committer:nodegit.Signature, oid:nodegit.Oid):js.Promise<Float>;
	function author():nodegit.Signature;
	function committer():nodegit.Signature;
	function free():Void;
	function id():nodegit.Oid;
	function message():String;
}