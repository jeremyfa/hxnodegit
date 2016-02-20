package nodegit;
@:jsRequire("nodegit", "Patch") extern class Patch {
	static function convenientFromDiff(diff:Dynamic):Promise<Dynamic>;
	static function fromBlobAndBuffer(old_blob:Dynamic, old_as_path:String, buffer:String, buffer_len:Float, buffer_as_path:String, opts:Dynamic):Promise<Dynamic>;
	static function fromBlobs(old_blob:Dynamic, old_as_path:String, new_blob:Dynamic, new_as_path:String, opts:Dynamic):Promise<Dynamic>;
	static function fromDiff(diff:Dynamic, idx:Float):Promise<Dynamic>;
	function getDelta():Dynamic;
	function getHunk(hunk_idx:Float):Promise<Float>;
	function getLineInHunk(hunk_idx:Float, line_of_hunk:Float):Promise<Dynamic>;
	function lineStats():Float;
	function numHunks():Float;
	function numLinesInHunk(hunk_idx:Float):Float;
	function size(include_context:Float, include_hunk_headers:Float, include_file_headers:Float):Float;
}