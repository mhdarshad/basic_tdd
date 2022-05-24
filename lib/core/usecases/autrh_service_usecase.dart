import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../tdd/presentaion/events/phoneauth/setuser_store.dart';
import '../error/failuers.dart';

abstract class AuthUseCase<type,Params>{
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<ConfirmationResult> phoneauth({required String phone}) => auth.signInWithPhoneNumber(phone);
  Future<UserCredential> otp(ConfirmationResult result,{required String otp}) => result.confirm(otp);
  Future<Either<Failure, type>>  regester({required Params data});
  Future<Either<Failure, type>>  login({required PhoneLoginModle data});
  Future<Either<Failure, bool>>  logout();
}