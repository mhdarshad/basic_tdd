import 'dart:convert';

import 'package:rising_gym/core/controller/json_controller/json_save.dart';
import 'package:rising_gym/core/data/hive_db.dart';
import 'package:rising_gym/core/error/failuers.dart';
import 'package:rising_gym/tdd/data/models/exception_modle.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/data/db_abstract.dart';
import '../../../../core/data/sqlflite/sql_db.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../injection_container.dart';
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
    try {
      await sl<SQLDBFunctions>().initilaize(DBType.sqlfite.name,data.dbdata);
      await JsonSave.writeJsonData(JsonDatakey.db_config, configdata);
      return const Right(true);
    } on Exception catch (e) {
      print("error:$e");
      // TODO
      return Left(ServerFailure(ExceptiomModle(message: "Cannot Connect to DB")));
    }
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
