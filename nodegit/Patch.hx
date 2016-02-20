package nodegit;
@:jsRequire("nodegit", "Patch") extern class Patch {
	static function convenientFromDiff(diff:nodegit.Diff):js.Promise<Dynamic>;
	static function fromBlobAndBuffer(old_blob:nodegit.Blob, old_as_path:String, buffer:String, buffer_len:Float, buffer_as_path:String, opts:nodegit.DiffOptions):js.Promise<nodegit.Patch>;
	static function fromBlobs(old_blob:nodegit.Blob, old_as_path:String, new_blob:nodegit.Blob, new_as_path:String, opts:nodegit.DiffOptions):js.Promise<nodegit.Patch>;
	static function fromDiff(diff:nodegit.Diff, idx:Float):js.Promise<nodegit.Patch>;
	function getDelta():nodegit.DiffDelta;
	function getHunk(hunk_idx:Float):js.Promise<Float>;
	function getLineInHunk(hunk_idx:Float, line_of_hunk:Float):js.Promise<nodegit.DiffLine>;
	function lineStats():Float;
	function numHunks():Float;
	function numLinesInHunk(hunk_idx:Float):Float;
	function size(include_context:Float, include_hunk_headers:Float, include_file_headers:Float):Float;
}