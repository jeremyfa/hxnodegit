package nodegit;
@:jsRequire("nodegit", "Enums") extern class Enums {
	static var CVAR(default, null) : EnumsCvar;
	static var DIRECTION(default, null) : EnumsDirection;
	static var FEATURE(default, null) : EnumsFeature;
	static var IDXENTRY_EXTENDED_FLAG(default, null) : EnumsIdxentryExtendedFlag;
	static var INDXENTRY_FLAG(default, null) : EnumsIndxentryFlag;
}
extern class EnumsCvar {
	var FALSE(default, null) : Int;
	var TRUE(default, null) : Int;
	var INT32(default, null) : Int;
	var STRING(default, null) : Int;
}
extern class EnumsDirection {
	var FETCH(default, null) : Int;
	var PUSH(default, null) : Int;
}
extern class EnumsFeature {
	var THREADS(default, null) : Int;
	var HTTPS(default, null) : Int;
	var SSH(default, null) : Int;
}
extern class EnumsIdxentryExtendedFlag {
	var IDXENTRY_INTENT_TO_ADD(default, null) : Int;
	var IDXENTRY_SKIP_WORKTREE(default, null) : Int;
	var IDXENTRY_EXTENDED2(default, null) : Int;
	var S(default, null) : Int;
	var IDXENTRY_UPDATE(default, null) : Int;
	var IDXENTRY_REMOVE(default, null) : Int;
	var IDXENTRY_UPTODATE(default, null) : Int;
	var IDXENTRY_ADDED(default, null) : Int;
	var IDXENTRY_HASHED(default, null) : Int;
	var IDXENTRY_UNHASHED(default, null) : Int;
	var IDXENTRY_WT_REMOVE(default, null) : Int;
	var IDXENTRY_CONFLICTED(default, null) : Int;
	var IDXENTRY_UNPACKED(default, null) : Int;
	var IDXENTRY_NEW_SKIP_WORKTREE(default, null) : Int;
}
extern class EnumsIndxentryFlag {
	var IDXENTRY_EXTENDED(default, null) : Int;
	var IDXENTRY_VALID(default, null) : Int;
}