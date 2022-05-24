import 'package:encrypt/encrypt.dart';

class Cripto{
  final iv = IV.fromLength(16);
  final encrypter = Encrypter(AES(Key.fromUtf8('ASDFGHJKLASDFGJJ')));
  String encript(String value){
    return encrypter.encrypt(value, iv: iv).base16;
  }
  String decript(String value){
    return encrypter.decrypt(Encrypted.fromBase16(value), iv: iv);
  }
}