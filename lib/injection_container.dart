
import 'package:cloud_me_v2/core/controller/json_controller/json_save.dart';
import 'package:cloud_me_v2/tdd/domain/usecase/auth/db_config_usecase.dart';
import 'package:cloud_me_v2/tdd/domain/usecase/product/product_usecase.dart';
import 'package:cloud_me_v2/tdd/presentaion/modules/product/product_event.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart' if (dart.library.html) "core/network/data_connection_checker_web.dart";
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'core/data/db_abstract.dart';
import 'core/data/sqlflite/sql_db.dart';
import 'core/network/network_info.dart';
import 'core/util/config/user_config.dart';
import 'core/util/input_data_converter.dart';
import 'package:http/http.dart' as http;

import 'tdd/data/datasource/local_data_source.dart';
import 'tdd/data/datasource/local_sql_data_source.dart';
import 'tdd/data/datasource/remote_data_sources.dart';
import 'tdd/data/models/modle_entities.dart';
import 'tdd/data/repository/data_layer_repo_impl.dart';
import 'tdd/domain/repositories/repository_provider.dart';
import 'tdd/domain/usecase/auth/user_login.dart';
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
 await sl<SQLDBFunctions>().initilaize(DBType.sqlfite);
 final user_db_config = await JsonSave.getJsonData('db_config');
 print(user_db_config);
 sl<Configration>().dbData = user_db_config;
 if(sl<Configration>().dbData!=null){
   sl<SQLDBFunctions>().tablename = 'business';
  try {
    final data = await sl<SQLDBFunctions>().fetchAll();
    sl<Configration>().tocken = data.first['tocken'];

  } on Exception catch (e) {
    print('Need Login');
  }
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