package nodegit;
@:jsRequire("nodegit", "ConvenientPatch") extern class ConvenientPatch {
	function hunks():Promise<Array<Dynamic>>;
	function isAdded():Bool;
	function isConflicted():Bool;
	function isCopied():Bool;
	function isDeleted():Bool;
	function isIgnored():Bool;
	function isModified():Bool;
	function isRenamed():Bool;
	function isTypeChange():Bool;
	function isUnmodified():Bool;
	function isUnreadable():Bool;
	function isUntracked():Bool;
	function lineStats():Dynamic;
	function newFile():Dynamic;
	function oldFile():Dynamic;
	function size():Float;
	function status():Float;
}