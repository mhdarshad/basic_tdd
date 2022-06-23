import 'package:asspa/core/error/failuers.dart';
import 'package:asspa/core/usecases/usecase.dart';
import 'package:asspa/tdd/domain/entities/user/login_user.dart';
import 'package:asspa/tdd/presentaion/view/components/dashboard/list_component/user_lsit_component.dart';
import 'package:dartz/dartz.dart';
import '../../../core/util/presentation/constants/ic_constants.dart';
import '../entities/analitics/user_analitics.dart';
import '../repositories/repository_provider.dart';

class GetWalletdataUseCase extends UseCase<Wallet,String>{
  @override
  Future<Either<Failure, Wallet>> call({required String data}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
class GetUserDataUsecase extends UseCase<UserData,Param>{
  DependencyRepostProvider<Map<String, dynamic>> repo;
  GetUserDataUsecase(this.repo);
  @override
  Future<Either<Failure, UserData>> call({required Param data}) async{
    // TODO: implement call
    final  value = await repo.getRequest(Params(uri: Uri.parse("userdata/${data.data['u_status']!=USTatus.all.name?data.data['u_status']==USTatus.active.name?'1':'0':'2'}"), methed: Methed.Get,data: {'page':data.data['pageno']}));
    return  Future.value(value.fold((l) =>Left(l), (r) =>Right(UserData.fromJson(r))));
  }
  Future<Either<Failure, Analytics>> getAnalytics() async{
    // TODO: implement call
    final  value = await repo.getRequest(Params(uri: Uri.parse("user/analitics"), methed: Methed.Get,data: {}));
    return  Future.value(value.fold((l) =>Left(l), (r) {
      print('analitics data: ${r['data']}');
      return Right(Analytics.fromJson(r['data']));
    }));
  }

}
