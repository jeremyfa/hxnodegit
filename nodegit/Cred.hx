package nodegit;
@:jsRequire("nodegit", "Cred") extern class Cred {
	static function defaultNew():nodegit.Cred;
	static function sshKeyFromAgent(username:String):nodegit.Cred;
	static function sshKeyMemoryNew(username:String, publickey:String, privatekey:String, passphrase:String):js.Promise<nodegit.Cred>;
	static function sshKeyNew(username:String, publickey:String, privatekey:String, passphrase:String):nodegit.Cred;
	static function usernameNew(username:String):js.Promise<nodegit.Cred>;
	static function userpassPlaintextNew(username:String, password:String):nodegit.Cred;
	function hasUsername():Float;
	static var TYPE(default, null) : CredType;
}
extern class CredType {
	var USERPASS_PLAINTEXT(default, null) : Int;
	var SSH_KEY(default, null) : Int;
	var SSH_CUSTOM(default, null) : Int;
	var DEFAULT(default, null) : Int;
	var SSH_INTERACTIVE(default, null) : Int;
	var USERNAME(default, null) : Int;
	var SSH_MEMORY(default, null) : Int;
}