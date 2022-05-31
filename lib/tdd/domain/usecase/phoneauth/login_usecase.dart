import 'package:asspa/core/error/failuers.dart';
import 'package:asspa/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/usecases/autrh_service_usecase.dart';
import '../../../presentaion/events/auth/phone_register_mutation.dart';
import '../../../presentaion/events/auth/setuser_store.dart';
import '../../entities/user/login_user.dart';
import '../../repositories/repository_provider.dart';

class PhoneLoginUseCase extends AuthUseCase<UsersData,PhoneRegisterModle>{
  DependencyRepostProvider<Map<String, dynamic>> repo;
  PhoneLoginUseCase(this.repo);

  @override
  Future<Either<Failure, UsersData>> regester({required PhoneRegisterModle data}) async{
    final  value = await repo.getRequest(Params(uri: Uri.parse("user/auth/register"), methed: Methed.Post,data: {
    "fname":data.fname,
    "lname":data.lname,
    "email":data.email,
    "ftocken":data.ftocken,
    "phone":data.phone,
    "password":data.password,
    "uid":data.uid,
    "refid":data.ref??'ADMIN001',
    "password_confirmation":data.password
    }));
    return  Future.value(value.fold((l) =>Left(l), (r) =>Right(UserData.fromJson(r).data!.first)));
  }

  @override
  Future<Either<Failure, UsersData>> login({required PhoneLoginModle data}) async{
    // TODO: implement login
    print("phone: ${data.phone}");
    final  value = await repo.getRequest(Params(uri: Uri.parse("user/auth/login"), methed: Methed.Post,data: {
      "phone":data.phone,
      "password":data.password,
    }));
    return  Future.value(value.fold((l) =>Left(l), (r) =>Right(UserData.fromJson(r).data!.first)));
  }

  @override
  Future<Either<Failure, bool>> logout() async{
    // print("phone: ${data.phone}");
    final  value = await repo.getRequest(Params(uri: Uri.parse("user/auth/logout"), methed: Methed.Get,));
    return value.fold((l) => Left(l), (r) => const Right(true));
  }
}
