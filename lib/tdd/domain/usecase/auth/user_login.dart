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
   final result =  await repo.getRequest(Params(uri: Uri.parse("api/flutter/signIn"), methed: Methed.Post,
        data: {
      'username':data.username,
      'password':data.password,
      // 'license_key':data.key,
    }));
   return result.fold((l) => Left(l), (r) => Right( UserAcsessData.fromJson(r)));
  }
}
class OtpUseCase extends UseCase<UserAcsessData,LoginData>{
  DependencyRepostProvider repo;
  OtpUseCase({required this.repo});
  @override
  Future<Either<Failure, UserAcsessData>> call({required LoginData data}) async{
   final result =  await repo.getRequest(Params(uri: Uri.parse("api/flutter/resend_otp"), methed: Methed.Post,
        data: {
      'username':data.username,
      // 'license_key':data.key,
    }));
   return result.fold((l) => Left(l), (r) =>Right( UserAcsessData.fromJson(r)));
  }
}
class SingUpUseCase extends UseCase<UserAcsessData,SignUpData>{
  DependencyRepostProvider repo;
  SingUpUseCase({required this.repo});
  @override
  Future<Either<Failure, UserAcsessData>> call({required SignUpData data}) async{
   final result =  await repo.getRequest(Params(uri: Uri.parse("api/flutter/signup"), methed: Methed.Post,
        data: {
          "name": "Mohammed Arshad",
          "phone_code": "+971",
          "phone": "553131570",
          "email": "arshad@cloudmesoftss.com",
          "password": "123456"
        }));
   return result.fold((l) => Left(l), (r) =>Right( UserAcsessData.fromJson(r)));
  }
}

class LoginData extends AuthParamsAbstarct{
  final String username;
  final String password;
  final String key;
  LoginData({required this.username, required this.password, required this.key});
}
class SignUpData extends AuthParamsAbstarct{
  final String userFirstname;
  final String userSecondname;
  final String emaile;
  final String password;
  final String dateOfBirth;
  final String gender;
  SignUpData({required this.userFirstname, required this.password, required this.dateOfBirth,required this.userSecondname, required this.gender, required this.emaile, });
}
class OTPData extends AuthParamsAbstarct{
  final String phone;
  OTPData({required this.phone, });
}
class OTPVerifyData extends AuthParamsAbstarct{
  final String phone;
  final String otp;
  OTPVerifyData({required this.phone,required this.otp, });
}
abstract class AuthParamsAbstarct{

}