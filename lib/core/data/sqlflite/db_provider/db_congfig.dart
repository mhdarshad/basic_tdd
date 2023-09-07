

import 'package:rising_gym/core/util/config/config.dart';
import 'package:flutter/foundation.dart';
import 'package:tekartik_app_flutter_sqflite/sqflite.dart';

import '../../../../injection_container.dart';
import '../../../../main_config.dart';
import '../../../../tdd/domain/usecase/db/db_config_usecase.dart';
import '../../../../tdd/domain/usecase/db/db_insert_usecase.dart';
import '../../../util/config/user_config.dart';
import 'sqlf_db_config/my_sql_db.dart';
import 'sqlf_db_config/sqlf_db.dart';

late DBProvider dbProvider;
abstract class DBTranslator {
  fetchAll(Map<String,dynamic> data);
}
class DBProvider extends sqlfDBProvider with MySqlDBProvider{
  initialState() async{
    // if(!kIsWeb) {
    //   initMySql();
    // }
    await initSqlflite();
  }
  BulkInsert(var inserQuery, var insertArray) async {
    //sl<Configration>().dbData['db_type']=='SQLFLITE'
    if (true) {
      Batch batch = db!.batch();
      for (var e in insertArray) {
        batch.rawInsert(inserQuery, e);
      }
      await batch.commit(noResult: true);
    } else {
      var results = await conn.queryMulti(inserQuery, insertArray);
      return results;
    }
  }
  Future<List<Map<String, dynamic>>> queryLanguage(query) async {
    if (sl<Configration>().dbType == DBType.sqlfite.name) {
      return (await db!.rawQuery(query)).map((e) => e.map((key, value) => MapEntry(key, value as dynamic))).toList();
    } else if (sl<Configration>().dbType == DBType.sqlfite.name){
      return (await conn.query(query)).map((e) => e.fields).toList();
    }else{
      throw "DB Not Specified";
    }
  }

}