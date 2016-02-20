package nodegit;
@:jsRequire("nodegit", "Merge") extern class Merge {
	static function base(repo:Dynamic, one:Dynamic, two:Dynamic):Promise<Dynamic>;
	static function bases(repo:Dynamic, one:Dynamic, two:Dynamic):Promise<Dynamic>;
	static function commits(repo:Dynamic, ourCommit:Dynamic, theirCommit:Dynamic, [options]:Dynamic):Void;
	static function fileInitInput(opts:Dynamic, version:Float):Float;
	static function initOptions(opts:Dynamic, version:Float):Float;
	static function merge(repo:Dynamic, theirHead:Dynamic, [mergeOpts]:Dynamic, [checkoutOpts]:Dynamic):Void;
	static function trees(repo:Dynamic, ancestor_tree:Dynamic, our_tree:Dynamic, their_tree:Dynamic, opts:Dynamic):Promise<Dynamic>;
	static var ANALYSIS : Dynamic;
	static var FILE_FAVOR : Dynamic;
	static var FILE_FLAGS : Dynamic;
	static var PREFERENCE : Dynamic;
	static var TREE_FLAG : Dynamic;
}