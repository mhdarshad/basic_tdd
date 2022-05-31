import 'package:asspa/core/event/event_hanling.dart';
import 'package:asspa/core/error/failuers.dart';
import 'package:asspa/core/util/presentation/Events/logic_event_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/cripto_algo.dart';
import '../../../../core/data/hive_db.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/util/presentation/constants/ic_constants.dart';
import '../../../../injection_container.dart';
import '../../../domain/entities/user/login_user.dart';
import '../../../domain/repositories/repository_provider.dart';
import '../../../domain/usecase/phoneauth/login_usecase.dart';

class GetUserBloc extends LogicHandler<PhoneLoginUseCase, NoPrams> {
  PhoneLoginUseCase usecase;

  GetUserBloc(this.usecase) : super(usecase);

  @override
  call({required NoPrams data}) {
    // TODO: implement call
    return GetUserEvents(usecase, data);
  }

}

class GetUserEvents extends EventMutations<NoPrams> {
  PhoneLoginUseCase usecase;

  GetUserEvents(this.usecase, NoPrams data) : super(data);

  @override
  perform() async {
    try {
      final request = await usecase.repo.getLocalDBRequest(LDBParams(methed: DB.GET,table: DBTable.UserProfile, key: 'user'));
      request.fold((l) => throw CacheFailure(), (r) {
        print(" user data: $r");
        final UsersData userData = UsersData.fromJson(r);
        // sl<SharedPreferences>().setBool(SFkeys.LOGEDIN,true);
        // sl<SharedPreferences>().setString(SFkeys.token,Cripto().encript(userData.tocken??""));
        // sl<SharedPreferences>().setString(SFkeys.UType,'user');
        // sl<SharedPreferences>().setString(SFkeys.UID,userData.user?.uid??"");
        store?.UserData = userData;
      });
    } on Exception catch (e) {
      // TODO
      throw CacheFailure();
    }
  }
}