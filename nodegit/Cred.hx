package nodegit;
@:jsRequire("nodegit", "Cred") extern class Cred {
	static function defaultNew():Dynamic;
	static function sshKeyFromAgent(username:String):Dynamic;
	static function sshKeyMemoryNew(username:String, publickey:String, privatekey:String, passphrase:String):Promise<Dynamic>;
	static function sshKeyNew(username:String, publickey:String, privatekey:String, passphrase:String):Dynamic;
	static function usernameNew(username:String):Promise<Dynamic>;
	static function userpassPlaintextNew(username:String, password:String):Dynamic;
	function hasUsername():Float;
	static var TYPE : Dynamic;
}