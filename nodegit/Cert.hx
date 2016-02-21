package nodegit;
@:jsRequire("nodegit", "Cert") extern class Cert {
	var certType : Float;
	static var SSH(default, null) : CertSsh;
	static var TYPE(default, null) : CertType;
}
extern class CertSsh {
	var MD5(default, null) : Int;
	var SHA1(default, null) : Int;
}
extern class CertType {
	var NONE(default, null) : Int;
	var X509(default, null) : Int;
	var HOSTKEY_LIBSSH2(default, null) : Int;
	var STRARRAY(default, null) : Int;
}