import 'package:cloud_me_v2/core/data/hive_db.dart';
import 'package:cloud_me_v2/core/error/failuers.dart';
import 'package:cloud_me_v2/tdd/data/models/db/business.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../data/models/api/user/use_data.dart';
import '../../../data/models/db/users.dart';
import '../../repositories/repository_provider.dart';

class DBConfigUseCase extends UseCase<bool,UserAcsessData>{
  DependencyRepostProvider<Map<String, dynamic>> repo;
  DBConfigUseCase({required this.repo});
  /// call meted for inserting product to db

  Future<bool> setUpDB() async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> call({required UserAcsessData data}) async{
    final db_user = data.users.map((e) => Users(name: e.name,email: e.email,role: e.role,passcode: e.passcode,sId: e.sId,isDeliverer: e.isDeliverer).toJson()).toList();
    await _inserttoDB(DBTable.user,db_user);
    // final business =
    final business = data.businessDetails;
   final db_business = Business(token: data.token,sId: business.id,name: business.name,timezone: business.timezone,currency: business.currency.currency,decimalPoint: business.decimalPoint,tax: (business.settings.tax??false).toString(),currencyCode: business.currency.code,currencySymbol: business.currency.symbol,logoUrl: '',licenseKey: data.device?.licenseKey,invPrefix: data.device?.prefix,sync: 1,currencyId: business.currencyId).toJson();
    await _inserttoDB(DBTable.user,[db_business]);

    return const Right(true);
  }

  Future<void> _inserttoDB(DBTable table,List<Map<String, dynamic>> data) async{
    await repo.GetLocalSQLDBRequest(SQLDBParams(methed: DB.SET, table: table,data: data));
  }
}
class DBSetupParams{

}
enum DBType{
  msql,sqlfite,Hive,MicrosoftSql,
}
