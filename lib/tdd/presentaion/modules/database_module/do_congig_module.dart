
import '../../../../core/event/event_hanling.dart';
import '../../../data/models/api/user/use_data.dart';
import '../../../domain/usecase/auth/db_config_usecase.dart';

class DBCongigMutation extends EventMutations<UserAcsessData> {
  DBConfigUseCase usecase;

  DBCongigMutation(this.usecase, UserAcsessData data) : super(data);

  @override
  perform() async {

    final request = await usecase(data:data);
  }
}