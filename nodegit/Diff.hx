package nodegit;
@:jsRequire("nodegit", "Diff") extern class Diff {
	static function blobToBuffer(old_blob:nodegit.Blob, old_as_path:String, buffer:String, buffer_len:Float, buffer_as_path:String, options:nodegit.DiffOptions, file_cb:Dynamic, binary_cb:Dynamic, hunk_cb:Dynamic, line_cb:Dynamic, payload:Dynamic):js.Promise<Float>;
	static function indexToWorkdir(repo:nodegit.Repository, index:nodegit.Index, opts:nodegit.DiffOptions):js.Promise<nodegit.Diff>;
	static function treeToIndex(repo:nodegit.Repository, old_tree:nodegit.Tree, index:nodegit.Index, opts:nodegit.DiffOptions):js.Promise<nodegit.Diff>;
	static function treeToTree(repo:nodegit.Repository, old_tree:nodegit.Tree, new_tree:nodegit.Tree, opts:nodegit.DiffOptions):js.Promise<nodegit.Diff>;
	static function treeToWorkdir(repo:nodegit.Repository, old_tree:nodegit.Tree, opts:nodegit.DiffOptions):js.Promise<nodegit.Diff>;
	static function treeToWorkdirWithIndex(repo:nodegit.Repository, old_tree:nodegit.Tree, opts:nodegit.DiffOptions):js.Promise<nodegit.Diff>;
	function findSimilar(options:nodegit.DiffFindOptions):js.Promise<Float>;
	function getDelta(idx:Float):nodegit.DiffDelta;
	function getPerfdata():js.Promise<nodegit.DiffPerfdata>;
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