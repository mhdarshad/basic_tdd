
import 'dart:convert';

import 'package:cloud_me_v2/core/controller/json_controller/json_save.dart';
import 'package:cloud_me_v2/tdd/domain/usecase/db/db_insert_usecase.dart';
import 'package:cloud_me_v2/tdd/domain/usecase/product/product_usecase.dart';
import 'package:cloud_me_v2/tdd/presentaion/modules/product/product_controller.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart' if (dart.library.html) "core/network/data_connection_checker_web.dart";
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'core/data/db_abstract.dart';
import 'core/data/sqlflite/sql_db.dart';
import 'core/network/network_info.dart';
import 'core/util/config/config.dart';
import 'core/util/config/user_config.dart';
import 'core/util/input_data_converter.dart';
import 'package:http/http.dart' as http;

import 'tdd/data/datasource/local_data_source.dart';
import 'tdd/data/datasource/local_sql_data_source.dart';
import 'tdd/data/datasource/remote_data_sources.dart';
import 'tdd/data/repository/data_layer_repo_impl.dart';
import 'tdd/domain/repositories/repository_provider.dart';
import 'tdd/domain/usecase/auth/user_login.dart';
import 'tdd/domain/usecase/db/db_config_usecase.dart';
import 'tdd/presentaion/modules/database_module/db_config_controller.dart';
import 'tdd/presentaion/modules/database_module/do_congig_module.dart';
import 'tdd/presentaion/modules/login/login_form_controller.dart';


final sl = GetIt.instance;

init() async{
  _core();
  _bloc();
  _datasource();
  sll();

  await _external();
}
_bloc(){
  //Bloc

  sl.registerFactory(() => ProductEvent(ProductUseCase( repo: sl(),),));
  sl.registerFactory(() => GetUserController(LoginUseCase( repo: sl(),),));
  sl.registerFactory(() => GetDBController(BDConfigUseCase( repo: sl(),),));
  // sl.registerFactory(() => GetUserController(LoginUseCase( repo: sl(),),));
  // sl.registerFactory(() => RegisterEvent(RegisterUseCase(sll()),));
  // sl.registerFactory(() => RegisterBloc(customerRegisterUsecase: CustomerRegisterUsecase(repo: sll()), checkEmailUsecase: CheckEmailUsecase(repo: sll()), checkMobileUsecase: CheckMobileUsecase(repo: sll()),
  // ));
  // sl.registerFactory(() => LoyaltyBloc(getLoyaltyUsecase: GetLoyaltyUsecase(sll(),), checkLoyaltyUsecase: CheckLoyaltyUsecase( DataLayerRepositoryImpl (
  //   remoteDataSource:  RemoteDataSourceImpl(client: sl()),
  //   localDataSource: LocalDataSourceImpl(sharedPreferences: sl()),
  //   networkInfo: NetworkInfoImpl(sl()),
  // ),),
  // ));
  // //Bloc
  // sl.registerFactory(() => CategoryBloc(GetCategory( sll()),));//Bloc
  // sl.registerFactory(() => SubcategoryBloc(GetSubCategory( sll()),));//Bloc
  // sl.registerFactory(() => ProductBloc(GetCategoryProduct( sll()),));//Bloc
  // sl.registerFactory(() => MyShopBloc(GetShopUseCase( repo:  sll(),),));//Bloc
  //   sl.registerFactory(() => CartItemBloc(CartItemUseCase( sll()),));//Bloc
  //   // sl.registerFactory(() => CartItemBloc(CartItemUseCase( sll()),));//Bloc
  //     sl.registerFactory(() => CheckOutBloc(CheckOutUsecase( sll()),));
  // sl.registerFactory(() => UserProfileBloc(profileUserUsecase:GetProfileCustomerUcase(repo:  sll()),),);
  // sl.registerFactory(() => SearchBloc(searchUserrUsecase:SearchUserUsecase(repo:  sll()), searchProductUsecase: SearchProductUsecase(repo:  sll()),),);//Bloc/Bloc
}
// _repo(){
//   sl.registerLazySingleton<DependencyRepostProvider<Map<String,dynamic>>>(
//         () => DataLayerRepositoryImpl(
//       remoteDataSource: RemoteDataSourceImpl(client: sl()),
//       localDataSource: LocalDataSourceImpl(sharedPreferences: sl()),
//       networkInfo: NetworkInfoImpl(sl()),
//     ),
//   );//Repository
// }
_datasource(){
  sl.registerLazySingleton<RemoteDataSource>(
        () => RemoteDataSourceImpl(client: sl()),
  );//DataSource

  sl.registerLazySingleton<LocalDataSource>(
        () => LocalDataSourceImpl(sharedPreferences: sl()),
  );//DataSource
  sl.registerLazySingleton<SQLDBFunctions>(
        () => LocalSqlDataSourceImpl('cloudme_db'),
  );//DataSource
}
_core(){
  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton<Configration>(() => Configration());
}
_external()async {
  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  //
  // Hive.registerAdapter(ModelEntitiesAdapter() );
  // await sl<SQLDBFunctions>().initilaize(DBType.sqlfite);
  ///Get DB data from CI \ CD Methode if no CI\ CD than take from Json
  final userDbConfig = Config.stgConstants[Config.DB_DATA] ?? await JsonSave.getJsonData('db_config');
  debugPrint(userDbConfig);
  /// Getting the Configuration File from Local Json File
  sl<Configration>().dbData = userDbConfig!=null?jsonDecode(userDbConfig):null;
  /// Checking the Configuration File Exist
  if(sl<Configration>().dbData!=null){
    /// Providing the table name to fetch from SQL
    sl<Configration>().dbType = sl<Configration>().dbData!['db_type'];
    sl<SQLDBFunctions>().tablename = 'business';
    try {
      await sl<SQLDBFunctions>().initilaize(sl<Configration>().dbType!,DBConnectionParams.fromJson(sl<Configration>().dbData!));
    } catch (e) {
      await JsonSave.deleteFile('db_config');
      debugPrint(e.toString());
    }
    try {
      /// fetching the Business table which has already Provided in [sl<SQLDBFunctions>().tablename]
      final data = await sl<SQLDBFunctions>().fetchAll();
      /// getting the token and Adding in Json Configuration File
      sl<Configration>().tocken = data.first['tocken'];
    } on Exception catch (e) {
      //TODO: Need Log Implementation
      debugPrint('Need Login');
    }
  }else{
    //TODO: Need Log Implementation
    debugPrint('Need Configuration');
  }
  // sl.registerLazySingleton<SQLDBFunctions>(() => init);
}
sll(){
  sl.registerLazySingleton<DependencyRepostProvider>(() => DataLayerRepositoryImpl (
    remoteDataSource:  sl<RemoteDataSource>(),
    localDataSource: sl<LocalDataSource>(),
    networkInfo: sl<NetworkInfo>(),
    sqlDataSourceImpl: sl<SQLDBFunctions>(),
  ));
}