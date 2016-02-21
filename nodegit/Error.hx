package nodegit;
@:jsRequire("nodegit", "Error") extern class Error {
	var klass : Float;
	var message : String;
	static var CODE : ErrorCode;
	static var ERROR : ErrorError;
}
extern class ErrorCode {
	var OK : Int = 0;
	var ERROR : Int = -1;
	var ENOTFOUND : Int = -3;
	var EEXISTS : Int = -4;
	var EAMBIGUOUS : Int = -5;
	var EBUFS : Int = -6;
	var EUSER : Int = -7;
	var EBAREREPO : Int = -8;
	var EUNBORNBRANCH : Int = -9;
	var EUNMERGED : Int = -10;
	var ENONFASTFORWARD : Int = -11;
	var EINVALIDSPEC : Int = -12;
	var ECONFLICT : Int = -13;
	var ELOCKED : Int = -14;
	var EMODIFIED : Int = -15;
	var EAUTH : Int = -16;
	var ECERTIFICATE : Int = -17;
	var EAPPLIED : Int = -18;
	var EPEEL : Int = -19;
	var EEOF : Int = -20;
	var EINVALID : Int = -21;
	var EUNCOMMITTED : Int = -22;
	var EDIRECTORY : Int = -23;
	var PASSTHROUGH : Int = -30;
	var ITEROVER : Int = -31;
}
extern class ErrorError {
	var GITERR_NONE : Int = 0;
	var GITERR_NOMEMORY : Int = 1;
	var GITERR_OS : Int = 2;
	var GITERR_INVALID : Int = 3;
	var GITERR_REFERENCE : Int = 4;
	var GITERR_ZLIB : Int = 5;
	var GITERR_REPOSITORY : Int = 6;
	var GITERR_CONFIG : Int = 7;
	var GITERR_REGEX : Int = 8;
	var GITERR_ODB : Int = 9;
	var GITERR_INDEX : Int = 10;
	var GITERR_OBJECT : Int = 11;
	var GITERR_NET : Int = 12;
	var GITERR_TAG : Int = 13;
	var GITERR_TREE : Int = 14;
	var GITERR_INDEXER : Int = 15;
	var GITERR_SSL : Int = 16;
	var GITERR_SUBMODULE : Int = 17;
	var GITERR_THREAD : Int = 18;
	var GITERR_STASH : Int = 19;
	var GITERR_CHECKOUT : Int = 20;
	var GITERR_FETCHHEAD : Int = 21;
	var GITERR_MERGE : Int = 22;
	var GITERR_SSH : Int = 23;
	var GITERR_FILTER : Int = 24;
	var GITERR_REVERT : Int = 25;
	var GITERR_CALLBACK : Int = 26;
	var GITERR_CHERRYPICK : Int = 27;
	var GITERR_DESCRIBE : Int = 28;
	var GITERR_REBASE : Int = 29;
	var GITERR_FILESYSTEM : Int = 30;
}