package nodegit;
@:jsRequire("nodegit", "Cert") extern class Cert {
	var certType : Float;
	static var SSH : CertSsh;
	static var TYPE : CertType;
}
extern class CertSsh {
	var MD5 : Int = 1;
	var SHA1 : Int = 2;
}
extern class CertType {
	var NONE : Int = 0;
	var X509 : Int = 1;
	var HOSTKEY_LIBSSH2 : Int = 2;
	var STRARRAY : Int = 3;
}