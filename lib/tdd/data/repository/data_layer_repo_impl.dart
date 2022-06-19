import 'dart:convert';

import 'package:asspa/tdd/data/models/exception_modle.dart';
import 'package:dartz/dartz.dart';
import '../../../core/data/hive_db.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/error/failuers.dart';
import '../../../core/network/network_info.dart';
import '../../domain/repositories/repository_provider.dart';
import '../datasource/local_data_source.dart';
import '../datasource/remote_data_sources.dart';

import '../models/repository_modle.dart';

typedef GetRequest = Future<RepositoryModel> Function();
class DataLayerRepositoryImpl implements DependencyRepostProvider<Map<String, dynamic>>{
  RemoteDataSourceImpl remoteDataSource;
  NetworkInfoImpl networkInfo;
  LocalDataSourceImpl localDataSource;
  DataLayerRepositoryImpl({required this.remoteDataSource, required this.localDataSource, required this. networkInfo});

  @override
  Future<Either<Failure, Map<String, dynamic>>> getRequest(Params param) =>_getRequest(param.uri.path,() => remoteDataSource.getRequest(param));
  Future<Either<Failure, Map<String, dynamic>>> _getRequest(String key,GetRequest getRequest) async{
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia = await getRequest();
        localDataSource.cachedData(key:key,value: remoteTrivia,table: DBTable.DataFetchHistory);
        // final localTrivia = await localDataSource.getCachedData(key: key, table: DBTable.DataFetchHistory);
        return Right(jsonDecode(remoteTrivia.data));
      } on ServerExceptions catch(e){
        print("server exception");
        // ServerExceptions? exceptions ;
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
          print("cache execution");
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

}