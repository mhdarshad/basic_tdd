import 'dart:convert';


import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import '../../../core/data/hive_db.dart';
import '../../../core/data/sqlflite/sql_db.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/error/failuers.dart';
import '../../../core/network/network_info.dart';
import '../../domain/repositories/repository_provider.dart';
import '../datasource/local_data_source.dart';
import '../datasource/remote_data_sources.dart';

import '../models/exception_modle.dart';
import '../models/repository_modle.dart';

typedef GetRequest = Future<RepositoryModel> Function();
class DataLayerRepositoryImpl implements DependencyRepostProvider<Map<String, dynamic>>{
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final LocalDataSource localDataSource;
  final SQLDBFunctions sqlDataSourceImpl;
  DataLayerRepositoryImpl({required this.remoteDataSource, required this.localDataSource,required this.sqlDataSourceImpl, required this. networkInfo});

  @override
  Future<Either<Failure, Map<String, dynamic>>> getRequest(Params param) =>_getRequest(param.uri.path,() => remoteDataSource.getRequest(param));
  Future<Either<Failure, Map<String, dynamic>>> _getRequest(String key,GetRequest getRequest) async{
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia = await getRequest();
        return Right(remoteTrivia.data);
      } on ServerExceptions catch(e){
        if (kDebugMode) {
          print("server exception ${e.messege}");
        }
        // ServerExceptions? exceptions ;
        if (kDebugMode) {
          print(e.messege);
        }
        if(e.code == 401){
          return Left(ClintFailure(ExceptiomModle(message: e.messege!.message,errors: e.messege!.errors)));
        }
        return Left(ServerFailure(ExceptiomModle(message: e.messege!.message,errors: e.messege!.errors)));
      }
    } else {
      try {
        final localTrivia = await localDataSource.getCachedData(key: key,table: DBTable.DataFetchHistory);
        return Right(jsonDecode(localTrivia.data));
      } on CacheExceptions {
        return Left(CacheFailure());
        // TODO
      }
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getLocalDBRequest(LDBParams param) async{
    try{
      if(param.methed==DB.GET) {
        final localTrivia = await localDataSource.getCachedData(
            key: param.key, table: param.table);
        if(localTrivia.data.trim().trimRight().toString()=="{}"){
          if (kDebugMode) {
            print("cache execution");
          }
          return Left(CacheFailure());
        }else{
          return Right(jsonDecode(localTrivia.data));
        }
      }
      else if(param.methed==DB.SET){
        localDataSource.cachedData(key:param.key,value: RepositoryModel.fromJson(param.data!),table: param.table);
        final localTrivia = await localDataSource.getCachedData(key: param.key,table: param.table);
        return Right(jsonDecode(localTrivia.data));
      } else if(param.methed==DB.UPDATE){
        final localTrivia = await localDataSource.getCachedData(key: param.key,table: param.table);
        return Right(jsonDecode(localTrivia.data));
      }else if(param.methed==DB.REMOVE){
        localDataSource.removeCachedData(key:param.key,table: param.table);
        final localTrivia = await localDataSource.getCachedData(key: param.key,table: param.table);
        return Right(jsonDecode(localTrivia.data));
      }else {
        final localTrivia = await localDataSource.getCachedData(key: param.key,table: DBTable.DataFetchHistory);
        return Right(jsonDecode(localTrivia.data));
      }
    }on CacheExceptions{
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> GetLocalSQLDBRequest(SQLDBParams param) async{
    // TODO: implement GetLocalSQLDBRequest
    sqlDataSourceImpl.tablename = param.table.name;
    switch(param.methed){
      case DB.GET:
      // TODO: Handle this case.
        break;
      case DB.SET:
        await sqlDataSourceImpl.insert(param.data!);
        break;
      case DB.UPDATE:
      // TODO: Handle this case.
        break;
      case DB.REMOVE:
      // TODO: Handle this case.
        break;
      case DB.CREATE:
        await sqlDataSourceImpl.create(param.data!.first);
        break;
    }
    // sqlDataSourceImpl.
    print(await sqlDataSourceImpl.fetchAll());
    return Right(sqlDataSourceImpl.fetchAll());
  }

}