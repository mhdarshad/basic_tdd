import 'package:asspa/core/error/failuers.dart';
import 'package:asspa/core/util/presentation/constants/ic_constants.dart';
import 'package:asspa/injection_container.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../data/models/exception_modle.dart';
import '../../entities/user/kyc_update_model.dart';
import '../../repositories/repository_provider.dart';

class KycUpdateUseCase extends UseCase<KycUpdateModel,KycUpdateModle>{
  final DependencyRepostProvider<Map<String, dynamic>> repo;
  KycUpdateUseCase(this.repo);

  @override
  Future<Either<Failure, KycUpdateModel>> call({required KycUpdateModle data}) async{
    // TODO: implement call
    try {
      // throw UnimplementedError();
      final  request = await repo.getRequest(Params(uri: Uri.parse('kyc'),methed: Methed.Post,data: data.toJson()));
      return request.fold((l) => Left(l), (r) {
        print(r);
        return Right(KycUpdateModel.fromJson(r['data'][0]));
      });
    } on Failure catch (e) {
      print(e.toString());
      return Future.value(Left(ServerFailure(ExceptiomModle(message: 'Some thing Went Wron'))));
    }
  }

  Future<Either<Failure, KycUpdateModel>> check() async{
    final  request = await repo.getRequest(Params(uri: Uri.parse('kyc/${sl<SharedPreferences>().getString(SFkeys.UID)}'),methed: Methed.Get,));
    return request.fold((l) => Left(l), (r) {
      print(r);
      return Right(KycUpdateModel.fromJson(r['data']));
    });
  }
}

class KycUpdateModle {
  String? uid;
  String? holderName;
  String? branchName;
  String? panCard;
  String? address;
  String? bankName;
  String? ifsc;
  String? accountNumber;

  KycUpdateModle(
      {this.uid,
        this.holderName,
        this.branchName,
        this.panCard,
        this.address,
        this.bankName,
        this.accountNumber,
        this.ifsc,});

  KycUpdateModle.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    holderName = json['holder_name'];
    branchName = json['branch_name'];
    panCard = json['pan_card'];
    address = json['address'];
    bankName = json['bank_name'];
    ifsc = json['ifsc'];
    accountNumber = json['account_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['holder_name'] = this.holderName;
    data['branch_name'] = this.branchName;
    data['pan_card'] = this.panCard;
    data['address'] = this.address;
    data['bank_name'] = this.bankName;
    data['ifsc'] = this.ifsc;
    data['account_number'] = this.accountNumber;
    return data;
  }
}
