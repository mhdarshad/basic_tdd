import 'package:asspa/core/event/event_hanling.dart';
import 'package:asspa/core/error/failuers.dart';
import 'package:asspa/core/util/presentation/Events/logic_event_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/cripto_algo.dart';
import '../../../../core/data/hive_db.dart';
import '../../../../core/util/presentation/constants/ic_constants.dart';
import '../../../../injection_container.dart';
import '../../../domain/repositories/repository_provider.dart';
import '../../../domain/usecase/phoneauth/login_usecase.dart';

class SetAdminBloc extends LogicHandler<PhoneLoginUseCase, SetAdminModle> {
  PhoneLoginUseCase usecase;

  SetAdminBloc(this.usecase) : super(usecase);

  @override
  call({required SetAdminModle data}) {
    // TODO: implement call
    return SetAdminEvents(usecase, data);
  }

}

class SetAdminModle {
  late String phone;
  late String password;
  SetAdminModle(this.phone,this.password);
}

class SetAdminEvents extends EventMutations<SetAdminModle> {
  PhoneLoginUseCase usecase;

  SetAdminEvents(this.usecase, SetAdminModle data) : super(data);

  @override
  perform() async {
    // final user = await usecase.repo.getLocalDBRequest(LDBParams(methed: DB.SET,table: DBTable.UserProfile,data: data?.toJson()??{}, key: 'admin'));
    sl<SharedPreferences>().setBool(SFkeys.LOGEDIN,true);
    // sl<SharedPreferences>().setString(SFkeys.token,Cripto().encript(data?.tocken??""));
    sl<SharedPreferences>().setString(SFkeys.UType,'admin');
    // sl<SharedPreferences>().setString(SFkeys.UID,'1001');
    // store?.UserData = data!;
  }
}