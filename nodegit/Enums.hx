package nodegit;
@:jsRequire("nodegit", "Enums") extern class Enums {
	static var CVAR : EnumsCvar;
	static var DIRECTION : EnumsDirection;
	static var FEATURE : EnumsFeature;
	static var IDXENTRY_EXTENDED_FLAG : EnumsIdxentryExtendedFlag;
	static var INDXENTRY_FLAG : EnumsIndxentryFlag;
}
extern class EnumsCvar {
	var FALSE : Int = 0;
	var TRUE : Int = 1;
	var INT32 : Int = 2;
	var STRING : Int = 3;
}
extern class EnumsDirection {
	var FETCH : Int = 0;
	var PUSH : Int = 1;
}
extern class EnumsFeature {
	var THREADS : Int = 1;
	var HTTPS : Int = 2;
	var SSH : Int = 4;
}
extern class EnumsIdxentryExtendedFlag {
	var IDXENTRY_INTENT_TO_ADD : Int = 8192;
	var IDXENTRY_SKIP_WORKTREE : Int = 16384;
	var IDXENTRY_EXTENDED2 : Int = 32768;
	var S : Int = 24576;
	var IDXENTRY_UPDATE : Int = 1;
	var IDXENTRY_REMOVE : Int = 2;
	var IDXENTRY_UPTODATE : Int = 4;
	var IDXENTRY_ADDED : Int = 8;
	var IDXENTRY_HASHED : Int = 16;
	var IDXENTRY_UNHASHED : Int = 32;
	var IDXENTRY_WT_REMOVE : Int = 64;
	var IDXENTRY_CONFLICTED : Int = 128;
	var IDXENTRY_UNPACKED : Int = 256;
	var IDXENTRY_NEW_SKIP_WORKTREE : Int = 512;
}
extern class EnumsIndxentryFlag {
	var IDXENTRY_EXTENDED : Int = 16384;
	var IDXENTRY_VALID : Int = 32768;
}