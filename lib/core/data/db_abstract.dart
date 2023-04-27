import 'package:cloud_me_v2/core/data/sqlflite/db_provider/db_congfig.dart';
import 'package:flutter/foundation.dart';
import 'package:mysql1/mysql1.dart';

import '../../tdd/domain/usecase/db/db_config_usecase.dart';
import '../../tdd/domain/usecase/db/db_insert_usecase.dart';
import '../controller/json_controller/json_save.dart';

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
  initilaize(String type,[DBConnectionParams? parms]) async{
    print("initial called");
    dbProvider = DBProvider();
    if(DBType.msql.name == type ){
      // await JsonSave.writeJsonData(JsonDatakey.db_config, parms.toJson());

      try {
        dbProvider.conn = await MySqlConnection.connect(
                  ConnectionSettings(
                      host: parms!.host,
                      // host: '127.0.0.1',
                      port: parms.port,
                      user: parms.user,
                      password: parms.pwd,
                      db: parms.db));
      } catch (e) {
        rethrow;
      }
          }else if(DBType.sqlfite.name == type ){
        await dbProvider.initialState();
        if(kIsWeb){
          dbProvider.dbpath = '/test/$_dbname.db';
        }else {
          dbProvider.dbpath = _dbname;
        }
        dbProvider.ready;
      }else if(DBType.Hive.name == type ){

    }else if(DBType.MicrosoftSql.name == type){

    }
  }
  setDBType(){

  }
}
class DBConnectionParams{
  final String host;
  final int port;
  final String user;
  final String pwd;
  final String db;
  DBConnectionParams(this.host, this.port, this.user, this.pwd, this.db);
  static DBConnectionParams fromJson(Map<String,dynamic> data,){
    return DBConnectionParams(data['host'],data['port'],data['user'],data['password'],data['db']);
  }
  Map<String,dynamic> toJson(){
    return {
      'host':host,
      'port':port,
      'user':user,
      'password':pwd,
      'db':db
    };
  }
}
enum Variabels{
  int,notnull,primarryKey,autoIncrement,charecter,double
}