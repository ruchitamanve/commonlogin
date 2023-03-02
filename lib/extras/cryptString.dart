import 'dart:convert';
import 'dart:developer';
import 'package:pointycastle/block/aes_fast.dart';
import 'dart:typed_data';
import 'package:pointycastle/export.dart';
import 'package:convert/convert.dart';
// import 'package:pointycastle/key_derivators/pbkdf2.dart';
// import 'package:pointycastle/paddings/pkcs7.dart';
// import 'package:pointycastle/paddings/pkcs7.dart';
// import 'package:pointycastle/pointycastle.dart';
// import "package:arms_app/extras/coverter_helper.dart";
// https://gist.github.com/proteye/
// https://gist.github.com/proteye/e54eef1713e1fe9123d1eb04c0a5cf9b
const KEY_SIZE = 384; // 32 byte key for AES-256
const ITERATION_COUNT = 1000;
const SALT = "@rM\$&kEy";
const INITIAL_VECTOR = "@Rm\$V2@\$D\$&@1b2c";
// const PASS_PHRASE = "PBKDF2WithHmacSHA1";
const PwHash = "p@@\$w0rd0f\$D\$";

// const PASS_PHRASE = "PBKDF2WithHmacSHA1";
//Future<String> cryptString(String text) async {
String cryptString(String text)  {
  String encryptedString = "";

  final mStrPassPhrase = toUtf8(PwHash);

  encryptedString = AesHelper.encrypt(mStrPassPhrase, toUtf8(text), mode: AesHelper.CBC_MODE);
  String base_64_encoded =base64.encode(createUint8ListFromString(encryptedString));
  
  return encryptedString;
}

String cryptString_GCM(String text)  {
  String encryptedString = "";
  final mStrPassPhrase = toUtf8(PwHash);
  Uint8List textBytes = createUint8ListFromString(text);
String salt = toASCII(SALT);
    Uint8List derivedKey = deriveKey(mStrPassPhrase, salt: salt);
    var ivStr = toASCII(INITIAL_VECTOR);
    Uint8List iv = createUint8ListFromString(ivStr);

    final cipher = GCMBlockCipher(AESEngine())
    ..init(
        true, 
        AEADParameters(
          KeyParameter(derivedKey),
          16 * 8, 
          iv, // 
          Uint8List(0),
        ));

  final cipherTextBytes = cipher.process(textBytes);
  String ivCiphertextMacB64 = base64.encode(cipherTextBytes); 
  return ivCiphertextMacB64;
}

//Future<String> decryptString(String text) async {
// String decryptString(String text)  {
//   String decryptedString = "";

//   final mStrPassPhrase = toUtf8(PwHash);

//   decryptedString =
//       AesHelper.decrypt(mStrPassPhrase, toUtf8(text), mode: AesHelper.CBC_MODE);

//   return decryptedString;
// }

///MARK: AesHelper class
class AesHelper {
  static const CBC_MODE = 'CBC';
  static const CFB_MODE = 'CFB';
  static const GCM_MODE = 'GCM';

  static Uint8List deriveKey(dynamic password,
      {
      String salt = '',
      int iterationCount = ITERATION_COUNT,
      int derivedKeyLength = KEY_SIZE}) {
    if (password == null || password.isEmpty) {
      throw ArgumentError('password must not be empty');
    }

    if (password is String) {
      password = createUint8ListFromString(password);
    }

    Uint8List saltBytes = createUint8ListFromString(salt);
    Pbkdf2Parameters params =
        Pbkdf2Parameters(saltBytes, iterationCount, derivedKeyLength);
    KeyDerivator keyDerivator =
        PBKDF2KeyDerivator(HMac(SHA1Digest(), 64));
    keyDerivator.init(params);
      Uint8List key_32 = new Uint8List(32);
      key_32.setRange(0,  32, keyDerivator.process(password), 0);
      return key_32;
  }

  static Uint8List pad(Uint8List src, int blockSize) {
    var pad = PKCS7Padding();
    pad.init(null);

    int padLength = blockSize - (src.length % blockSize);
    var out = Uint8List(src.length + padLength)..setAll(0, src);
    pad.addPadding(out, src.length);

    return out;
  }

  static Uint8List unpad(Uint8List src) {
    var pad = PKCS7Padding();
    pad.init(null);

    int padLength = pad.padCount(src);
    int len = src.length - padLength;

    return Uint8List(len)..setRange(0, len, src);
  }

  static String encrypt(String password, String plaintext,
      {String mode = CBC_MODE}) {
    String salt = toASCII(SALT);
    Uint8List derivedKey = deriveKey(password, salt: salt);
   // Uint8List derivedKey2 = generateKey(password,  createUint8ListFromString(salt));
    KeyParameter keyParam = KeyParameter(derivedKey);
    BlockCipher aes = AESFastEngine();

    var ivStr = toASCII(INITIAL_VECTOR);
    Uint8List iv =
        createUint8ListFromString(ivStr);

    BlockCipher cipher;
    ParametersWithIV params = ParametersWithIV(keyParam, iv);
    
    switch (mode) {
      case CBC_MODE:
        cipher = GCMBlockCipher(aes);
        break;
      case CFB_MODE:
        cipher = CFBBlockCipher(aes, aes.blockSize);
        break;
      default:
        throw ArgumentError('incorrect value of the "mode" parameter');
        break;
    }
    cipher.init(true, params);

    Uint8List textBytes = createUint8ListFromString(plaintext);
    Uint8List paddedText = pad(textBytes, aes.blockSize);
    Uint8List cipherBytes = _processBlocks(cipher, paddedText);

    return base64.encode(cipherBytes);
  }

  //  final cipher = GCMBlockCipher(AESEngine())
  //   ..init(
  //       true, // encrypt (or decrypt)
  //       AEADParameters(
  //         KeyParameter(keyBytes), // the 256 bit (32 byte) key
  //         16 * 8, // the mac size (16 bytes)
  //         nonce, // the 12 byte nonce
  //         Uint8List(0), // empty extra data
  //       ));

  ///////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
  // static String decrypt(String password, String ciphertext,
  //     {String mode = CBC_MODE}) {
  //   String salt = toASCII(SALT);
  //   Uint8List derivedKey = deriveKey(password, salt: salt);
  //   KeyParameter keyParam = new KeyParameter(derivedKey);
  //   BlockCipher aes = new AESFastEngine();

  //   var ivStr = toASCII(INITIAL_VECTOR);
  //   Uint8List iv = createUint8ListFromString(ivStr);
  //   Uint8List cipherBytesFromEncode = base64.decode(ciphertext);

  //   Uint8List cipherIvBytes =
  //       new Uint8List(cipherBytesFromEncode.length + iv.length)
  //         ..setAll(0, iv)
  //         ..setAll(iv.length, cipherBytesFromEncode);

  //   BlockCipher cipher;

  //   ParametersWithIV params = new ParametersWithIV(keyParam, iv);
  //   switch (mode) {
  //     case CBC_MODE:
  //       cipher = new CBCBlockCipher(aes);
  //       break;
  //     case CFB_MODE:
  //       cipher = new CFBBlockCipher(aes, aes.blockSize);
  //       break;
  //     default:
  //       throw new ArgumentError('incorrect value of the "mode" parameter');
  //       break;
  //   }
  //   cipher.init(false, params);

  //   int cipherLen = cipherIvBytes.length - aes.blockSize;
  //   Uint8List cipherBytes = new Uint8List(cipherLen)..setRange(0, cipherLen, cipherIvBytes, aes.blockSize);
  //   Uint8List paddedText = _processBlocks(cipher, cipherBytes);
  //   Uint8List textBytes = unpad(paddedText);

  //   return new String.fromCharCodes(textBytes);
  // }

  static Uint8List _processBlocks(BlockCipher cipher, Uint8List inp) {
    var out = Uint8List(inp.lengthInBytes);

    for (var offset = 0; offset < inp.lengthInBytes;) {
      var len = cipher.processBlock(inp, offset, out, offset);
      offset += len;
    }

    return out;
  }
}

///MARK: HELPERS
  Uint8List createUint8ListFromString(String s) {
  Uint8List ret = Uint8List.fromList(s.codeUnits);

  return ret;
}

String toUtf8(value) {
  var encoded = utf8.encode(value);
  var decoded = utf8.decode(encoded);
  return decoded;
}

String toASCII(value) {
  var encoded = ascii.encode(value);
  var decoded = ascii.decode(encoded);
  return decoded;
}
 Uint8List generateKey(String passphrase, Uint8List salt) {           // pass salt
  Uint8List passphraseInt8List = Uint8List.fromList(passphrase.codeUnits);
  //Uint8List salt = Uint8List.fromList('20'.codeUnits);
  KeyDerivator derivator = PBKDF2KeyDerivator(HMac(SHA1Digest(), 64));      // 64 byte block size
  Pbkdf2Parameters params = Pbkdf2Parameters(salt, 1000, 384);              // 32 byte key size
  derivator.init(params);
  return derivator.process(passphraseInt8List);
}

  Uint8List deriveKey(dynamic password,
      {
      String salt = '',
      int iterationCount = ITERATION_COUNT,
      int derivedKeyLength = KEY_SIZE}) {
    if (password == null || password.isEmpty) {
      throw ArgumentError('password must not be empty');
    }

    if (password is String) {
      password = createUint8ListFromString(password);
    }

    Uint8List saltBytes = createUint8ListFromString(salt);
    Pbkdf2Parameters params =
        Pbkdf2Parameters(saltBytes, iterationCount, derivedKeyLength);
    KeyDerivator keyDerivator =
        PBKDF2KeyDerivator(HMac(SHA1Digest(), 64));
    keyDerivator.init(params);
      Uint8List key_32 = new Uint8List(32);
      key_32.setRange(0,  32, keyDerivator.process(password), 0);
      return key_32;
  }

String total_encryption_gcm(String normal_string){
  String encription_result_string = cryptString_GCM(normal_string);
  List<int> bytes = utf8.encode(encription_result_string);
  String output = hex.encode(bytes);
// String encription_result_base64_encoded =base64.encode(bytes);
  log("GCM encrypted value is ${output}");
  return output;

}

//     Uint8List convertStringToUint8List(String str) {
//   final List<int> codeUnits = str.codeUnits;
//   final Uint8List unit8List = Uint8List.fromList(codeUnits);
//   return unit8List;


// }