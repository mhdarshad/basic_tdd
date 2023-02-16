import 'dart:convert';

import 'package:cloud_me_v2/core/controller/json_controller/json_save.dart';
import 'package:cloud_me_v2/core/data/hive_db.dart';
import 'package:cloud_me_v2/core/error/failuers.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../presentaion/modules/database_module/db_config_controller.dart';
import '../../repositories/repository_provider.dart';

class BDConfigUseCase extends UseCase<bool,ConfigData>{
  DependencyRepostProvider<Map<String, dynamic>> repo;
  BDConfigUseCase({required this.repo});
  /// call meted for inserting product to db

/// Use Case For Setup DB
  @override
  Future<Either<Failure, bool>> call({required ConfigData data}) async{
    Map<String,dynamic> configdata = {
      'db_type':data.dbType.name,
    };

    if(data.dbdata!=null){
      configdata.addAll(data.dbdata!.toJson());
    }
    await JsonSave.writeJsonData('db_config', jsonEncode(configdata));
    return const Right(true);
  }

  Future<void> _createDB(DBTable table,List<Map<String, dynamic>> data) async{
    await repo.GetLocalSQLDBRequest(SQLDBParams(methed: DB.SET, table: table,data: data));
  }
}
class DBSetupParams{

}
enum DBType{
  msql,sqlfite,Hive,MicrosoftSql,
}
