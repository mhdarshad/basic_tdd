import 'package:asspa/core/error/failuers.dart';
import 'package:asspa/core/util/presentation/constants/ic_constants.dart';
import 'package:asspa/injection_container.dart';
import 'package:asspa/tdd/domain/usecase/update_membership_status.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
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
      if (kDebugMode) {
        print(r);
      }
      return Right(KycUpdateModel.fromJson(r['data'][0]));
    });
  }
  Future<Either<Failure, KycUpdateData>> fetchkyc(Param? param) async{
    List<KycUpdateModel> data = [];
    final  request = await repo.getRequest(Params(uri: Uri.parse('fetch_kyc/${param?.data['status']!=USTatus.all.name?param?.data['status']==USTatus.active.name?'1':'0':'2'}'),methed: Methed.Get,data: {
      'page':param?.data['pageno']
    }));
    return request.fold((l) => Left(l), (r) {
      if (kDebugMode) {
        print(r);
      }
      return Right(KycUpdateData.fromJson(r));
      // return Right(data);
    });
  }
  Future<Either<Failure, List<KycUpdateModel>>> updateStatus(ActivateParam datas) async{
    List<KycUpdateModel> data = [];
    final  request = await repo.getRequest(Params(uri: Uri.parse('kyc_update/${datas.uid}'),methed: Methed.Post,data: {
      'status':datas.status?'1':'0'
    }));
    return request.fold((l) => Left(l), (r) {
      if (kDebugMode) {
        print(r);

      }
      if (r['data'] != null) {
        data = <KycUpdateModel>[];
        r['data'].forEach((v) {
          data.add(KycUpdateModel.fromJson(v));
        });
      }
      return Right(data);
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
    final Map<String, dynamic> data = Map<String, dynamic>();
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
