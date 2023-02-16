
import '../../../../core/event/event_hanling.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../data/models/api/user/use_data.dart';
import '../../../domain/usecase/db/db_config_usecase.dart';
import '../../../domain/usecase/db/db_insert_usecase.dart';

class DBCongigMutation extends EventMutations<dynamic> {
  UseCase usecase;

  DBCongigMutation(this.usecase, dynamic data) : super(data);

  @override
  perform() async {
    if(usecase is DBInsertUseCase) {
      final request = await usecase(data:data);
    }else if(usecase is BDConfigUseCase){
      final request = await usecase(data:data);
    }
  }
}