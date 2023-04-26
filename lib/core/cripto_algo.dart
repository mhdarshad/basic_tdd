import 'package:encrypt/encrypt.dart';

// class Cripto{
//   final iv = IV.fromLength(16);
//   final encrypter = Encrypter(AES(Key.fromUtf8('ASDFGHJKLASDFGJJ')));
//   String encript(String value)=> encrypter.encrypt(value, iv: iv).base16;
//   String decript(String value)=> encrypter.decrypt(Encrypted.fromBase16(value), iv: iv);
// }
extension Cripto on String{
  String get encript => this!=''?encrypter.encrypt(toString(), iv: iv).base16:'';
  String get decript=> toString()!='null'&&toString()!=""?encrypter.decrypt(Encrypted.fromBase16(toString()), iv:  iv):'';
  get iv => IV.fromLength(16);
  get  encrypter => Encrypter(AES(Key.fromUtf8('ASDFGHJKLASDFGJJ')));
}