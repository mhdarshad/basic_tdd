import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';
import '../../../core/data/hive_db.dart';
import '../models/modle_entities.dart';
import '../models/repository_modle.dart';


abstract class LocalDataSource{
  Future<ModelEntities> getCachedData({required DBTable table ,required String key});
  Future<void> removeCachedData({required DBTable table ,required String key});
  Future<void> cachedData({required DBTable table ,required String key,required RepositoryModel value});
  Future<void> updateCachedData({required DBTable table ,required String key,required RepositoryModel value});
}
class LocalDataSourceImpl implements LocalDataSource{
   final SharedPreferences sharedPreferences;
   LocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<void> cachedData({required DBTable table ,required String key,required RepositoryModel value}) {
    // TODO: implement cacheNumberTrivia
    // return HiveDB<ModelEntities>(database: table).add(key: key,value: ModelEntities.fromJson(value.data));
    return sharedPreferences.setString(
      key,
      json.encode(value.data),
    );
  }

  @override
  Future<ModelEntities> getCachedData({required DBTable table ,required String key}) async{
    // TODO: implement getLastNumberTrivia
    //  sharedPreferences.getString(key);
     try {
       final jsonString = await HiveDB<ModelEntities>(database: table).get(key: key);
       // print("cached data:"+jsonString);
           // Future which is immediately completed
           if (jsonString != null) {
        /*if(jsonString == ""||jsonString =="{}"){
          return Future.value(CacheRepositoryModel.fromJson(jsonDecode(jsonString)));
        }*/
        return Future.value(jsonString);
           } else{
             return Future.value(RepositoryModel.fromJson({}));
           }
     }  catch (e) {
       throw CacheExceptions();
       // TODO
     }
  }

  @override
  Future<void> removeCachedData({required DBTable table, required String key}) async{
    // TODO: implement removeCachedData
    final jsonString = await HiveDB<ModelEntities>(database: table).remove(key: key);
    if (jsonString != null) {
      return Future.value(jsonString);
    } else{
      return Future.value(RepositoryModel.fromJson({}));
    }
  }

  @override
  Future<void> updateCachedData({required DBTable table, required String key, required RepositoryModel value}) {
    // TODO: implement updateCachedData
    throw CacheExceptions();
  }

}