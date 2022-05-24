import 'package:asspa/tdd/data/models/exception_modle.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  List properties;

Failure([this. properties = const <dynamic>[]]) ;
@override
// TODO: implement props
List<Object?> get props => properties;
}
const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String SERVER_FAILURE_401 = 'Credential Error';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
class ServerFailure extends Failure{
  ExceptiomModle messege;
  ServerFailure(this. messege):super([messege]);
}
class CacheFailure   extends Failure{
  // CacheFailure(String messege):super([messege]);

}
class ClintFailure   extends Failure{
  ExceptiomModle messege;
  ClintFailure(this. messege):super([messege]);
}

String mapFailureToMessage(Failure failure) {
  // Instead of a regular 'if (failure is ServerFailure)...'
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case CacheFailure:
      return CACHE_FAILURE_MESSAGE;
    case ClintFailure:
      return SERVER_FAILURE_401;
    default:
      return 'Unexpected Error';
  }
}