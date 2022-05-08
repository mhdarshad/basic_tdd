
import 'package:data_connection_checker_tv/data_connection_checker.dart' if (dart.library.html) "core/network/data_connection_checker_web.dart";
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'core/network/network_info.dart';
import 'core/util/input_data_converter.dart';
import 'package:http/http.dart' as http;

import 'tdd/data/datasource/local_data_source.dart';
import 'tdd/data/datasource/remote_data_sources.dart';
import 'tdd/data/models/modle_entities.dart';
import 'tdd/data/repository/data_layer_repo_impl.dart';
final sl = GetIt.instance;

 init() async{
  _bloc();
  _datasource();
  _core();
  await _external();
}
_bloc(){
  //Bloc
  // sl.registerFactory(() => LoginBloc(LoginUseCase(sll()),));

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
}
_core(){
  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
_external()async {
  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  //
  Hive.registerAdapter(ModelEntitiesAdapter() );
}
sll(){
 return DataLayerRepositoryImpl (
    remoteDataSource:  RemoteDataSourceImpl(client: sl()),
    localDataSource: LocalDataSourceImpl(sharedPreferences: sl()),
    networkInfo: NetworkInfoImpl(sl()),
  );
}