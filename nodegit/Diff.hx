package nodegit;
@:jsRequire("nodegit", "Diff") extern class Diff {
	static function blobToBuffer(old_blob:Dynamic, old_as_path:String, buffer:String, buffer_len:Float, buffer_as_path:String, options:Dynamic, file_cb:Dynamic, binary_cb:Dynamic, hunk_cb:Dynamic, line_cb:Dynamic, payload:Dynamic):Promise<Float>;
	static function indexToWorkdir(repo:Dynamic, index:Dynamic, opts:Dynamic):Promise<Dynamic>;
	static function treeToIndex(repo:Dynamic, old_tree:Dynamic, index:Dynamic, opts:Dynamic):Promise<Dynamic>;
	static function treeToTree(repo:Dynamic, old_tree:Dynamic, new_tree:Dynamic, opts:Dynamic):Promise<Dynamic>;
	static function treeToWorkdir(repo:Dynamic, old_tree:Dynamic, opts:Dynamic):Promise<Dynamic>;
	static function treeToWorkdirWithIndex(repo:Dynamic, old_tree:Dynamic, opts:Dynamic):Promise<Dynamic>;
	function findSimilar(options:Dynamic):Promise<Float>;
	function getDelta(idx:Float):Dynamic;
	function getPerfdata():Promise<Dynamic>;
	function numDeltas():Float;
	function patches():js.Promise<nodegit.Array<ConvenientPatch>>;
	static var DELTA : Dynamic;
	static var FIND : Dynamic;
	static var FLAG : Dynamic;
	static var FORMAT : Dynamic;
	static var FORMAT_EMAIL_FLAGS : Dynamic;
	static var LINE : Dynamic;
	static var OPTION : Dynamic;
	static var STATS_FORMAT : Dynamic;
}