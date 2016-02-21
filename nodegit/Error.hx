package nodegit;
@:jsRequire("nodegit", "Error") extern class Error {
	var klass : Float;
	var message : String;
	static var CODE(default, null) : ErrorCode;
	static var ERROR(default, null) : ErrorError;
}
extern class ErrorCode {
	var OK(default, null) : Int = 0;
	var ERROR(default, null) : Int = -1;
	var ENOTFOUND(default, null) : Int = -3;
	var EEXISTS(default, null) : Int = -4;
	var EAMBIGUOUS(default, null) : Int = -5;
	var EBUFS(default, null) : Int = -6;
	var EUSER(default, null) : Int = -7;
	var EBAREREPO(default, null) : Int = -8;
	var EUNBORNBRANCH(default, null) : Int = -9;
	var EUNMERGED(default, null) : Int = -10;
	var ENONFASTFORWARD(default, null) : Int = -11;
	var EINVALIDSPEC(default, null) : Int = -12;
	var ECONFLICT(default, null) : Int = -13;
	var ELOCKED(default, null) : Int = -14;
	var EMODIFIED(default, null) : Int = -15;
	var EAUTH(default, null) : Int = -16;
	var ECERTIFICATE(default, null) : Int = -17;
	var EAPPLIED(default, null) : Int = -18;
	var EPEEL(default, null) : Int = -19;
	var EEOF(default, null) : Int = -20;
	var EINVALID(default, null) : Int = -21;
	var EUNCOMMITTED(default, null) : Int = -22;
	var EDIRECTORY(default, null) : Int = -23;
	var PASSTHROUGH(default, null) : Int = -30;
	var ITEROVER(default, null) : Int = -31;
}
extern class ErrorError {
	var GITERR_NONE(default, null) : Int = 0;
	var GITERR_NOMEMORY(default, null) : Int = 1;
	var GITERR_OS(default, null) : Int = 2;
	var GITERR_INVALID(default, null) : Int = 3;
	var GITERR_REFERENCE(default, null) : Int = 4;
	var GITERR_ZLIB(default, null) : Int = 5;
	var GITERR_REPOSITORY(default, null) : Int = 6;
	var GITERR_CONFIG(default, null) : Int = 7;
	var GITERR_REGEX(default, null) : Int = 8;
	var GITERR_ODB(default, null) : Int = 9;
	var GITERR_INDEX(default, null) : Int = 10;
	var GITERR_OBJECT(default, null) : Int = 11;
	var GITERR_NET(default, null) : Int = 12;
	var GITERR_TAG(default, null) : Int = 13;
	var GITERR_TREE(default, null) : Int = 14;
	var GITERR_INDEXER(default, null) : Int = 15;
	var GITERR_SSL(default, null) : Int = 16;
	var GITERR_SUBMODULE(default, null) : Int = 17;
	var GITERR_THREAD(default, null) : Int = 18;
	var GITERR_STASH(default, null) : Int = 19;
	var GITERR_CHECKOUT(default, null) : Int = 20;
	var GITERR_FETCHHEAD(default, null) : Int = 21;
	var GITERR_MERGE(default, null) : Int = 22;
	var GITERR_SSH(default, null) : Int = 23;
	var GITERR_FILTER(default, null) : Int = 24;
	var GITERR_REVERT(default, null) : Int = 25;
	var GITERR_CALLBACK(default, null) : Int = 26;
	var GITERR_CHERRYPICK(default, null) : Int = 27;
	var GITERR_DESCRIBE(default, null) : Int = 28;
	var GITERR_REBASE(default, null) : Int = 29;
	var GITERR_FILESYSTEM(default, null) : Int = 30;
}