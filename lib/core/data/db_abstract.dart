import 'package:cloud_me_v2/core/data/sqlflite/db_provider/db_congfig.dart';
import 'package:flutter/foundation.dart';

import '../../tdd/domain/usecase/auth/db_config_usecase.dart';

abstract class DBBaseFunctions{
  final String _dbname;
  const DBBaseFunctions(String dbname):_dbname = dbname;
  fetchAll();
  updateAll(List<Map<String, dynamic>> data);
  updateWhere(List<Map<String, dynamic>> data,String where);
  create(Map<String,dynamic> data);
  Future<List<Map<String, dynamic>>> fetchWhere(Map<String,dynamic> conditions,[List<String>? forColumn,]) ;
  Future<List<Map<String, dynamic>>> fetchMultipleWhere(Map<String,List<dynamic>> conditions,[List<String>? forColumn,]) ;
  Future<List<Map<String, dynamic>>> fetchQuery(String query);
  insert(List<Map<String,dynamic>> data);
  initilaize(DBType type) async{
    print("initial called");
    dbProvider = DBProvider();
    switch(type){
      case DBType.msql:
        break;
      case DBType.sqlfite:
        await dbProvider.initialState();
        if(kIsWeb){
          dbProvider.dbpath = '/test/test.db';
        }else {
          dbProvider.dbpath = _dbname;
        }
        dbProvider.ready;
        break;
      case DBType.Hive:
        // TODO: Handle this case.
        break;
      case DBType.MicrosoftSql:
        // TODO: Handle this case.
        break;
    }
  }
}

enum Variabels{
  int,notnull,primarryKey,autoIncrement,charecter,double
}