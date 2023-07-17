import 'package:cloud_me_v2/core/error/failuers.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../core/util/config/user_config.dart';
import '../../../../injection_container.dart';
import '../../../data/models/api/user/user_data.dart';
import '../../repositories/repository_provider.dart';

class LoginUseCase extends UseCase<UserAcsessData,LoginData>{
  DependencyRepostProvider repo;
  LoginUseCase({required this.repo});
  @override
  Future<Either<Failure, UserAcsessData>> call({required LoginData data}) async{
   final result =  await repo.getRequest(Params(uri: Uri.parse("signIn"), methed: Methed.Post,
        data: {
      'username':data.username,
      'password':data.password,
      // 'license_key':data.key,
    }));
   return result.fold((l) => Left(l), (r) => Right( UserAcsessData.fromJson(r)));
  }
}
class OtpUseCase extends UseCase<Map<String,dynamic>,OTPData>{
  DependencyRepostProvider repo;
  OtpUseCase({required this.repo});
  @override
  Future<Either<Failure, Map<String,dynamic>>> call({required OTPData data}) async{
    late Either<Failure, dynamic> result;
    if(data.otp!=null){
       result =  await repo.getRequest(Params(uri: Uri.parse("verify_otp"), methed: Methed.Post,
          data: {
            'cus_id':sl<Configration>().cid,
            'otp':data.otp,
            // 'license_key':data.key,
          }));
    }else{
       result =  await repo.getRequest(Params(uri: Uri.parse("resend_otp"), methed: Methed.Post,
          data: {
            'cus_id':data.phone,
            // 'license_key':data.key,
          }));
    }

   return result.fold((l) => Left(l), (r) =>Right(r));
  }
}
class SingUpUseCase extends UseCase<UserAcsessData,SignUpData>{
  DependencyRepostProvider repo;
  SingUpUseCase({required this.repo});
  @override
  Future<Either<Failure, UserAcsessData>> call({required SignUpData data}) async{
   final result =  await repo.getRequest(Params(uri: Uri.parse("signup"), methed: Methed.Post,
        data: {
          "name": "${data.userFirstname }${data.userSecondname}",
          "phone_code": data.phoneCode,
          "phone": data.phone,
          "email": data.emaile,
          "password": data.password
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
  final String phone;
  final String phoneCode;
  SignUpData( {required this.phoneCode,required this.phone,required this.userFirstname, required this.password, required this.dateOfBirth,required this.userSecondname, required this.gender, required this.emaile, });
}
class OTPData extends AuthParamsAbstarct{
  final String phone;
  final String? otp;
  OTPData({required this.phone, this.otp, });
}

abstract class AuthParamsAbstarct{

}