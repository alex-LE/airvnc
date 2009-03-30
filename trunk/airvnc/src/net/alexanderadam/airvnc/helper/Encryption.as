package net.alexanderadam.airvnc.helper
{
	public class Encryption
	{
		import com.hurlant.crypto.symmetric.ICipher;
		import com.hurlant.crypto.symmetric.IVMode;
		import com.hurlant.crypto.symmetric.IMode;
		import com.hurlant.crypto.symmetric.NullPad;
		import com.hurlant.crypto.symmetric.PKCS5;
		import com.hurlant.crypto.symmetric.IPad;
		import com.hurlant.crypto.prng.Random;
		import com.hurlant.crypto.hash.HMAC;
		import com.hurlant.util.Base64;
		import com.hurlant.util.Hex;
		import com.hurlant.crypto.Crypto;
		import com.hurlant.crypto.hash.IHash;
		import flash.utils.ByteArray;
	
		public function Encryption()
		{
		}
		
		public static function encrypt(input:String, key:String):String {
			var currentResult:ByteArray;
			
			// 2: get a key
			var k:String = key;
			var kdata:ByteArray;
			var kformat:String = "text";
			
			kdata = Hex.toArray(Hex.fromString(k));
			
			
			// 3: get an input
			//============================INPUT TEXT====================
			var txt:String = input;
			var data:ByteArray;
			var format:String = "text";
			
					data = Hex.toArray(Hex.fromString(txt));
			
			// 1: get an algorithm..
			var name:String = "aes"+"-"+"ecb";
			
			
			var pad:IPad = new PKCS5;
			var mode:ICipher = Crypto.getCipher(name, kdata, pad);
			pad.setBlockSize(mode.getBlockSize());
			mode.encrypt(data);
			currentResult = data;
			
			// populate IV.
			if (mode is IVMode) {
				var ivmode:IVMode = mode as IVMode;
				
			}
			
			if (currentResult==null) return '';
			format = "hex";
			switch (format) {
				case "hex": txt = Hex.fromArray(currentResult); break;
				case "b64": txt = Base64.encodeByteArray(currentResult); break;
				default:
					txt = Hex.toString(Hex.fromArray(currentResult)); break;
			}
			return txt;
		}
		
		public static function decrypt(input:String, key:String):String {
			var currentInput:ByteArray;
			
			// 2: get a key
			var k:String = key;
			var kdata:ByteArray;
			var kformat:String = "text";
			switch (kformat) {
				case "hex": kdata = Hex.toArray(k); break;
				case "b64": kdata = Base64.decodeToByteArray(k); break;
				default:
					kdata = Hex.toArray(Hex.fromString(k));
			}
			// 3: get an output
			var txt:String = input;
			var data:ByteArray;
			var format:String = "hex";
			switch (format) {
				case "hex": data = Hex.toArray(txt); break;
				case "b64": data = Base64.decodeToByteArray(txt); break;
				default:
					data = Hex.toArray(Hex.fromString(txt));
			}
			// 1: get an algorithm..
			var name:String = "aes"+"-"+"ecb";
			
			var pad:IPad = new PKCS5;
			var mode:ICipher = Crypto.getCipher(name, kdata, pad);
			pad.setBlockSize(mode.getBlockSize());
			// if an IV is there, set it.
			if (mode is IVMode) {
				var ivmode:IVMode = mode as IVMode;
				
			}
			mode.decrypt(data);
			currentInput = data;
			


			if (currentInput==null) return '';
			format = "text";
			switch (format) {
				case "hex": txt = Hex.fromArray(currentInput); break;
				case "b64": txt = Base64.encodeByteArray(currentInput); break;
				default:
					txt = Hex.toString(Hex.fromArray(currentInput)); break;
			}
			
			return txt;				
		}
	}
}