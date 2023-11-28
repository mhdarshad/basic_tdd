import '../../tdd/data/entities/exception_modle.dart';

class ServerExceptions implements Exception{
  int? code;
  ExceptiomModle? messege;

  ServerExceptions([this.code,this.messege]);

}
class CacheExceptions   implements Exception{}
class ClintExceptions   implements Exception{
  int? code;
  ExceptiomModle? messege;

  ClintExceptions([this.code,this.messege]);
}