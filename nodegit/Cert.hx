package nodegit;
@:jsRequire("nodegit", "Cert") extern class Cert {
	var certType : Float;
	static var SSH(default, null) : CertSsh;
	static var TYPE(default, null) : CertType;
}
extern class CertSsh {
	var MD5(default, null) : Int = 1;
	var SHA1(default, null) : Int = 2;
}
extern class CertType {
	var NONE(default, null) : Int = 0;
	var X509(default, null) : Int = 1;
	var HOSTKEY_LIBSSH2(default, null) : Int = 2;
	var STRARRAY(default, null) : Int = 3;
}