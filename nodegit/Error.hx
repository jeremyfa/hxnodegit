package nodegit;
@:jsRequire("nodegit", "Error") extern class Error {
	var klass : Float;
	var message : String;
	static var CODE(default, null) : ErrorCode;
	static var ERROR(default, null) : ErrorError;
}
extern class ErrorCode {
	var OK(default, null) : Int;
	var ERROR(default, null) : Int;
	var ENOTFOUND(default, null) : Int;
	var EEXISTS(default, null) : Int;
	var EAMBIGUOUS(default, null) : Int;
	var EBUFS(default, null) : Int;
	var EUSER(default, null) : Int;
	var EBAREREPO(default, null) : Int;
	var EUNBORNBRANCH(default, null) : Int;
	var EUNMERGED(default, null) : Int;
	var ENONFASTFORWARD(default, null) : Int;
	var EINVALIDSPEC(default, null) : Int;
	var ECONFLICT(default, null) : Int;
	var ELOCKED(default, null) : Int;
	var EMODIFIED(default, null) : Int;
	var EAUTH(default, null) : Int;
	var ECERTIFICATE(default, null) : Int;
	var EAPPLIED(default, null) : Int;
	var EPEEL(default, null) : Int;
	var EEOF(default, null) : Int;
	var EINVALID(default, null) : Int;
	var EUNCOMMITTED(default, null) : Int;
	var EDIRECTORY(default, null) : Int;
	var PASSTHROUGH(default, null) : Int;
	var ITEROVER(default, null) : Int;
}
extern class ErrorError {
	var GITERR_NONE(default, null) : Int;
	var GITERR_NOMEMORY(default, null) : Int;
	var GITERR_OS(default, null) : Int;
	var GITERR_INVALID(default, null) : Int;
	var GITERR_REFERENCE(default, null) : Int;
	var GITERR_ZLIB(default, null) : Int;
	var GITERR_REPOSITORY(default, null) : Int;
	var GITERR_CONFIG(default, null) : Int;
	var GITERR_REGEX(default, null) : Int;
	var GITERR_ODB(default, null) : Int;
	var GITERR_INDEX(default, null) : Int;
	var GITERR_OBJECT(default, null) : Int;
	var GITERR_NET(default, null) : Int;
	var GITERR_TAG(default, null) : Int;
	var GITERR_TREE(default, null) : Int;
	var GITERR_INDEXER(default, null) : Int;
	var GITERR_SSL(default, null) : Int;
	var GITERR_SUBMODULE(default, null) : Int;
	var GITERR_THREAD(default, null) : Int;
	var GITERR_STASH(default, null) : Int;
	var GITERR_CHECKOUT(default, null) : Int;
	var GITERR_FETCHHEAD(default, null) : Int;
	var GITERR_MERGE(default, null) : Int;
	var GITERR_SSH(default, null) : Int;
	var GITERR_FILTER(default, null) : Int;
	var GITERR_REVERT(default, null) : Int;
	var GITERR_CALLBACK(default, null) : Int;
	var GITERR_CHERRYPICK(default, null) : Int;
	var GITERR_DESCRIBE(default, null) : Int;
	var GITERR_REBASE(default, null) : Int;
	var GITERR_FILESYSTEM(default, null) : Int;
}