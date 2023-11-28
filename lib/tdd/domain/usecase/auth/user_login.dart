import 'package:rising_gym/core/error/failuers.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../core/util/config/user_config.dart';
import '../../../../injection_container.dart';
import '../../../data/entities/api/user/user_data.dart';
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
      if(data.otpType == OTPType.SignUp) {
        result =  await repo.getRequest(Params(uri: Uri.parse("verify_otp"), methed: Methed.Post,
          data: {
            'cus_id':sl<Configration>().cid,
            'otp':data.otp,
            // 'license_key':data.key,
          }));
      }else{
        result =  await repo.getRequest(Params(uri: Uri.parse("customer_forget_password_otp_vry"), methed: Methed.Post,
            data: {
              'cus_id':sl<Configration>().cid,
              'otp':data.otp,
              // 'license_key':data.key,
            }));
      }
    }else{
      if(data.otpType == OTPType.SignUp) {
        result = await repo.getRequest(
            Params(uri: Uri.parse("resend_otp"), methed: Methed.Post,
                data: {
                  'cus_id': data.phone,
                  // 'license_key':data.key,
                }));
      }else{
        result = await repo.getRequest(
            Params(uri: Uri.parse("customer_forget_password"), methed: Methed.Post,
                data: {
                  'phone_no': data.phone,
                  // 'license_key':data.key,
                }));
      }
    }

   return result.fold((l) => Left(l), (r) {
     if(r is List<dynamic>){
       return r.isNotEmpty?Right(r.first):Right({});
     }
     return Right(r);
   });
  }
}
class ChangePasswordUseCase extends UseCase<bool,ChangePassData>{
  DependencyRepostProvider repo;
  ChangePasswordUseCase({required this.repo});
  @override
  Future<Either<Failure, bool>> call({required ChangePassData data}) async{
   final result =  await repo.getRequest(Params(uri: Uri.parse("customer_forget_password_update"), methed: Methed.Post,
       data: {
         'cus_id':sl<Configration>().cid,
         'password':data.password,
         // 'license_key':data.key,
       }));
   return result.fold((l) => Left(l), (r) =>const Right( true));
  }
}
class SingUpUseCase extends UseCase<UserAcsessData,SignUpData>{
  DependencyRepostProvider repo;
  SingUpUseCase({required this.repo});
  @override
  Future<Either<Failure, UserAcsessData>> call({required SignUpData data}) async{
   final result =  await repo.getRequest(Params(uri: Uri.parse("signup"), methed: Methed.Post,
        data: {
          "name": "${data.userFirstname } ${data.userSecondname}",
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
  final OTPType otpType;
  OTPData(this.otpType, {required this.phone, this.otp, });
}
class ChangePassData extends AuthParamsAbstarct{
  final String password;
   ChangePassData(this.password);
}
enum OTPType{
  forgetPass,SignUp
}
abstract class AuthParamsAbstarct{
BuildContext? context;
AuthParamsAbstarct({this.context});
}