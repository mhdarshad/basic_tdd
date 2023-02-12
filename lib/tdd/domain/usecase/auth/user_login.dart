import 'package:cloud_me_v2/core/error/failuers.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../data/models/api/user/use_data.dart';
import '../../../data/models/api/user/user_data_api.dart';
import '../../repositories/repository_provider.dart';

class LoginUseCase extends UseCase<UserAcsessData,LoginData>{
  DependencyRepostProvider repo;
  LoginUseCase({required this.repo});
  @override
  Future<Either<Failure, UserAcsessData>> call({required LoginData data}) async{
   final result =  await repo.getRequest(Params(uri: Uri.parse("api/login"), methed: Methed.Post,
        data: {
      'email':data.username,
      'password':data.password,
      'license_key':data.key,
    }));
   return result.fold((l) => Left(l), (r) =>Right( UserAcsessData.fromJson(r)));
  }
}
class LoginData {
  final String username;
  final String password;
  final String key;
  LoginData({required this.username, required this.password, required this.key});
}
