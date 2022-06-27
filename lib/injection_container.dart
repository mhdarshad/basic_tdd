
import 'package:data_connection_checker_tv/data_connection_checker.dart' if (dart.library.html) "core/network/data_connection_checker_web.dart";
import 'package:firebase_core/firebase_core.dart';
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
import 'tdd/domain/usecase/get_dash_data.dart';
import 'tdd/domain/usecase/kyc/kyc_update_usecase.dart';
import 'tdd/domain/usecase/phoneauth/login_usecase.dart';
import 'tdd/domain/usecase/refer_friend_usecase.dart';
import 'tdd/domain/usecase/transaction/payment_transation.dart';
import 'tdd/domain/usecase/update_membership_status.dart';
import 'tdd/presentaion/events/auth/get_user_mutation.dart';
import 'tdd/presentaion/events/auth/logout_mutation.dart';
import 'tdd/presentaion/events/auth/phone_login_mutation.dart';
import 'tdd/presentaion/events/auth/phone_otp_mutation.dart';
import 'tdd/presentaion/events/auth/phone_register_mutation.dart';
import 'tdd/presentaion/events/auth/set_admin.dart';
import 'tdd/presentaion/events/auth/setuser_store.dart';
import 'tdd/presentaion/events/dashboard/ReferFriend.dart';
import 'tdd/presentaion/events/dashboard/get_user_data.dart';
import 'tdd/presentaion/events/dashboard/update_status.dart';
import 'tdd/presentaion/events/dashboard/update_wallet.dart';
import 'tdd/presentaion/events/transaction/payment_transaction.dart';
import 'tdd/presentaion/events/user_update/check_kyc.dart';
import 'tdd/presentaion/events/user_update/fetch_kycs.dart';
import 'tdd/presentaion/events/user_update/kyc_status_update.dart';
import 'tdd/presentaion/events/user_update/kyc_update.dart';
final sl = GetIt.instance;

 init() async{
  _bloc();
  _datasource();
  _core();
  await _external();
}
_bloc(){
  //Bloc
  sl.registerFactory(() => PhoneLoginBloc(PhoneLoginUseCase(sll()),));
  sl.registerFactory(() => ReferfriendBloc(ReferfriendUseCase(),));
  sl.registerFactory(() => PhoneOtpBloc(PhoneLoginUseCase(sll()),));
  sl.registerFactory(() => LogoutBloc(PhoneLoginUseCase(sll()),));
  sl.registerFactory(() => SetUserBloc(PhoneLoginUseCase(sll()),));
  sl.registerFactory(() => GetUserBloc(PhoneLoginUseCase(sll()),));
  sl.registerFactory(() => PhoneRegisterBloc(PhoneLoginUseCase(sll()),));
  sl.registerFactory(() => SetAdminBloc(PhoneLoginUseCase(sll()),));
  sl.registerFactory(() => GetUserDataBloc(GetUserDataUsecase(sll()),));
  sl.registerFactory(() => UpdateStatusBloc(UpdateStatusUseCase(sll()),));
  sl.registerFactory(() => UpdateWalletBloc(UpdateStatusUseCase(sll()),));
  sl.registerFactory(() => KycUpdateBloc(KycUpdateUseCase(sll()),));
  sl.registerFactory(() => CheckKycBloc(KycUpdateUseCase(sll()),));
  sl.registerFactory(() => FetchKycsBloc(KycUpdateUseCase(sll()),));
  sl.registerFactory(() => KycUpdateStatusBloc(KycUpdateUseCase(sll()),));
  sl.registerFactory(() => PaymentTransactionBloc(PaymentTransactionUseCase(sll()),));
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