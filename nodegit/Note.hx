package nodegit;
@:jsRequire("nodegit", "Note") extern class Note {
	static function create(repo:Dynamic, notes_ref:String, author:Dynamic, committer:Dynamic, oid:Dynamic, note:String, force:Float):Promise<Dynamic>;
	static function foreach(repo:Dynamic, notes_ref:String, note_cb:Dynamic, payload:Dynamic):Promise<Float>;
	static function iteratorNew(repo:Dynamic, notes_ref:String):Promise<Dynamic>;
	static function next(note_id:Dynamic, annotated_id:Dynamic, it:Dynamic):Dynamic;
	static function read(repo:Dynamic, notes_ref:String, oid:Dynamic):Promise<Dynamic>;
	static function remove(repo:Dynamic, notes_ref:String, author:Dynamic, committer:Dynamic, oid:Dynamic):Promise<Float>;
	function author():Dynamic;
	function committer():Dynamic;
	function free():Void;
	function id():Dynamic;
	function message():String;
}