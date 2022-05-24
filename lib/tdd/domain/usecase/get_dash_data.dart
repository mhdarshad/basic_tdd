import 'package:asspa/core/error/failuers.dart';
import 'package:asspa/core/usecases/usecase.dart';
import 'package:asspa/tdd/domain/entities/user/login_user.dart';
import 'package:dartz/dartz.dart';

class GetdashdataUseCase extends UseCase<Wallet,String>{
  @override
  Future<Either<Failure, Wallet>> call({required String data}) {
    // TODO: implement call
    throw UnimplementedError();
  }

}