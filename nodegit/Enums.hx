package nodegit;
@:jsRequire("nodegit", "Enums") extern class Enums {
	static var CVAR(default, null) : EnumsCvar;
	static var DIRECTION(default, null) : EnumsDirection;
	static var FEATURE(default, null) : EnumsFeature;
	static var IDXENTRY_EXTENDED_FLAG(default, null) : EnumsIdxentryExtendedFlag;
	static var INDXENTRY_FLAG(default, null) : EnumsIndxentryFlag;
}
extern class EnumsCvar {
	var FALSE(default, null) : Int = 0;
	var TRUE(default, null) : Int = 1;
	var INT32(default, null) : Int = 2;
	var STRING(default, null) : Int = 3;
}
extern class EnumsDirection {
	var FETCH(default, null) : Int = 0;
	var PUSH(default, null) : Int = 1;
}
extern class EnumsFeature {
	var THREADS(default, null) : Int = 1;
	var HTTPS(default, null) : Int = 2;
	var SSH(default, null) : Int = 4;
}
extern class EnumsIdxentryExtendedFlag {
	var IDXENTRY_INTENT_TO_ADD(default, null) : Int = 8192;
	var IDXENTRY_SKIP_WORKTREE(default, null) : Int = 16384;
	var IDXENTRY_EXTENDED2(default, null) : Int = 32768;
	var S(default, null) : Int = 24576;
	var IDXENTRY_UPDATE(default, null) : Int = 1;
	var IDXENTRY_REMOVE(default, null) : Int = 2;
	var IDXENTRY_UPTODATE(default, null) : Int = 4;
	var IDXENTRY_ADDED(default, null) : Int = 8;
	var IDXENTRY_HASHED(default, null) : Int = 16;
	var IDXENTRY_UNHASHED(default, null) : Int = 32;
	var IDXENTRY_WT_REMOVE(default, null) : Int = 64;
	var IDXENTRY_CONFLICTED(default, null) : Int = 128;
	var IDXENTRY_UNPACKED(default, null) : Int = 256;
	var IDXENTRY_NEW_SKIP_WORKTREE(default, null) : Int = 512;
}
extern class EnumsIndxentryFlag {
	var IDXENTRY_EXTENDED(default, null) : Int = 16384;
	var IDXENTRY_VALID(default, null) : Int = 32768;
}