package nodegit;
@:jsRequire("nodegit", "Tag") extern class Tag {
	static function annotationCreate(repo:Dynamic, tag_name:String, target:Dynamic, tagger:Dynamic, message:String):Promise<Dynamic>;
	static function create(repo:Dynamic, tag_name:String, target:Dynamic, tagger:Dynamic, message:String, force:Float):Promise<Dynamic>;
	static function createLightweight(repo:Dynamic, tag_name:String, target:Dynamic, force:Float):Promise<Dynamic>;
	static function delete(repo:Dynamic, tag_name:String):Promise<Float>;
	static function list(repo:Dynamic):Promise<Array<Dynamic>>;
	static function listMatch(tag_names:Dynamic, pattern:String, repo:Dynamic):Float;
	static function lookup(repo:Dynamic, id:Dynamic):Promise<Dynamic>;
	static function lookupPrefix(repo:Dynamic, id:Dynamic, len:Float):Promise<Dynamic>;
	function free():Void;
	function id():Dynamic;
	function message():String;
	function name():String;
	function owner():Dynamic;
	function peel(tag_target_out:Dynamic):Float;
	function tagger():Dynamic;
	function target():Dynamic;
	function targetId():Dynamic;
	function targetType():Float;
}