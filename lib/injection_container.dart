
import 'dart:convert';

import 'package:cloud_me_v2/core/controller/json_controller/json_save.dart';
import 'package:cloud_me_v2/core/cripto_algo.dart';
import 'package:cloud_me_v2/tdd/domain/usecase/db/db_insert_usecase.dart';
import 'package:cloud_me_v2/tdd/domain/usecase/product/product_usecase.dart';
import 'package:cloud_me_v2/tdd/presentaion/modules/checkout/checkout_controller.dart';
import 'package:cloud_me_v2/tdd/presentaion/modules/dashboard/dashboard_controller.dart';
import 'package:cloud_me_v2/tdd/presentaion/modules/product/product_controller.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart' if (dart.library.html) "core/network/data_connection_checker_web.dart";
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabby_flutter_inapp_sdk/tabby_flutter_inapp_sdk.dart';


import 'core/data/db_abstract.dart';
import 'core/data/sqlflite/sql_db.dart';
import 'core/network/network_info.dart';
import 'core/util/config/config.dart';
import 'core/util/config/user_config.dart';
import 'core/util/input_data_converter.dart';
import 'package:http/http.dart' as http;

import 'core/util/presentation/constants/ic_constants.dart';
import 'tdd/data/datasource/local_data_source.dart';
import 'tdd/data/datasource/local_sql_data_source.dart';
import 'tdd/data/datasource/remote_data_sources.dart';
import 'tdd/data/repository/data_layer_repo_impl.dart';
import 'tdd/domain/repositories/repository_provider.dart';
import 'tdd/domain/usecase/attadence_transfer/attadence_usecase.dart';
import 'tdd/domain/usecase/auth/user_login.dart';
import 'tdd/domain/usecase/dashboard/dashboard_usecase.dart';
import 'tdd/domain/usecase/db/db_config_usecase.dart';
import 'tdd/domain/usecase/edit_profile/edit_profile_usecase.dart';
import 'tdd/domain/usecase/genrateInvoice/trainer_usecase.dart';
import 'tdd/domain/usecase/plan_and_trainer_detail/plan_and_trainer_usecase.dart';
import 'tdd/domain/usecase/plans/plans_usecase.dart';
import 'tdd/domain/usecase/room_scedule/room_scedule_usecase.dart';
import 'tdd/domain/usecase/scedule/scedule_usecase.dart';
import 'tdd/domain/usecase/trainer/trainer_usecase.dart';
import 'tdd/domain/usecase/update_trainer_usecase/update_trainer_usecase.dart';
import 'tdd/presentaion/modules/attaindence/Attaidence_controller.dart';
import 'tdd/presentaion/modules/database_module/db_config_controller.dart';
import 'tdd/presentaion/modules/database_module/do_congig_module.dart';
import 'tdd/presentaion/modules/edit_profile/edit_profile_module_controller.dart';
import 'tdd/presentaion/modules/genrateInvoice/genrate_Invoice_controller.dart';
import 'tdd/presentaion/modules/login/login_form_controller.dart';
import 'tdd/presentaion/modules/plan_trainer_data/plan_trainer_detail_controller.dart';
import 'tdd/presentaion/modules/plans/plans_list_controller.dart';
import 'tdd/presentaion/modules/room_scedule/room_scedule_controller.dart';
import 'tdd/presentaion/modules/scedule/scedule_controller.dart';
import 'tdd/presentaion/modules/trainer/trainer_controller.dart';
import 'tdd/presentaion/modules/update_trainer/updateTrainer_controller.dart';


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
  sl.registerFactory(() => PlansListEvent(PlansUseCase( repo: sl(),),));
  sl.registerFactory(() => AttaidenceEvent(AttaidenceUseCase( repo: sl(),),));
  sl.registerFactory(() => RoomSceduleEvent(RoomSceduleUseCase( repo: sl(),),BookMatUseCase(repo: sl())));
  sl.registerFactory(() => SceduleEvent(SceduleUseCase( repo: sl(),),DashBoardUseCase( repo: sl(),),TrainersUseCase(repo: sl())));
  sl.registerFactory(() => TrainerEvent(TrainersUseCase( repo: sl(),),));
  sl.registerFactory(() => DashboardEvent(DashBoardUseCase( repo: sl(),),));
  sl.registerFactory(() => CheckoutEvent(DashBoardUseCase( repo: sl(),),));
  sl.registerFactory(() => GenrateInvoiceEvent(GenrateInvoiceUseCase( repo: sl(),),));
  sl.registerFactory(() => EditProfileModuleEvent(EditProfileModuleUseCase( repo: sl(),),));
  sl.registerFactory(() => PlanTrainerDetailEvent(PlanTrainerDetailUseCase( repo: sl(),),));
  sl.registerFactory(() => UpdatetrainerEvent(UpdatetrainerUseCase( repo: sl(),),));
  sl.registerFactory(() => GetUserController(LoginUseCase( repo: sl(),), OtpUseCase(repo:sl()), SingUpUseCase(repo: sl()) ));
  sl.registerFactory(() => GetDBController(BDConfigUseCase( repo: sl(),),));
  // TabbySDK().setup(
  //   withApiKey: '', // Put here your Api key
  //   environment: Environment.stage, // Or use Environment.production
  // );

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
  final userDbConfig = Config.stgConstants[Config.DB_DATA] ?? await JsonSave.getJsonData(JsonDatakey.db_config);
  debugPrint(userDbConfig.toString());
  /// Getting the Configuration File from Local Json File
  sl<Configration>().dbData = userDbConfig!=null?userDbConfig is String?jsonDecode(userDbConfig):userDbConfig:null;
  /// Checking the Configuration File Exist
     sl<Configration>().tocken = const String.fromEnvironment(Config.CLIENT_ID).encript;
  if (kDebugMode) {
    print("Token: ${sl<Configration>().tocken}");
  }
  if(sl<SharedPreferences>().containsKey(SFkeys.token)){
    sl<Configration>().custTocken = sl<SharedPreferences>().getString(SFkeys.token);
  }
  if(sl<SharedPreferences>().containsKey(SFkeys.UID)){
    sl<Configration>().custId =  sl<SharedPreferences>().getString(SFkeys.UID);
  }
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
      sl<Configration>().tocken = const String.fromEnvironment(Config.CLIENT_ID);
      if (kDebugMode) {
        print("Token: ${sl<Configration>().tocken}");
      }
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
  sl.registerLazySingleton<DependencyRepostProvider<dynamic>>(() => DataLayerRepositoryImpl (
    remoteDataSource:  sl<RemoteDataSource>(),
    localDataSource: sl<LocalDataSource>(),
    networkInfo: sl<NetworkInfo>(),
    sqlDataSourceImpl: sl<SQLDBFunctions>(),
  ));
  // sl.registerLazySingleton<DependencyRepostProvider>(() => DataLayerRepositoryImpl (
  //   remoteDataSource:  sl<RemoteDataSource>(),
  //   localDataSource: sl<LocalDataSource>(),
  //   networkInfo: sl<NetworkInfo>(),
  //   sqlDataSourceImpl: sl<SQLDBFunctions>(),
  // ));
}