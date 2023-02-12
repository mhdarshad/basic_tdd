

import 'package:dartz/dartz.dart';

import '../../../../core/event/event_hanling.dart';
import '../../../../core/util/presentation/Events/logic_event_handler.dart';
import '../../../domain/repositories/repository_provider.dart';
import '../../../domain/usecase/auth/db_config_usecase.dart';
import '../../../domain/usecase/auth/user_login.dart';
import '../database_module/do_congig_module.dart';

class   GetUserController extends LogicHandler<LoginUseCase, LoginData> {
  LoginUseCase usecase;

  GetUserController(this.usecase) : super(usecase);

  @override
  call({required LoginData data}) {
    // TODO: implement call
    return GetUserEvents(usecase, data);
  }

}

class GetUserEvents extends EventMutations<LoginData> {
  LoginUseCase usecase;

  GetUserEvents(this.usecase, LoginData data) : super(data);

  @override
  perform() async {
    final request = await usecase(data:data);
   if(!request.isLeft()){
     request.forEach((r) {
       next(() => DBCongigMutation(DBConfigUseCase(repo: usecase.repo as DependencyRepostProvider<Map<String, dynamic>>),r));
     });
   }
  }
}