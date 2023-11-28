
import 'package:flutter/foundation.dart';

import '../../../../core/event/event_hanling.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../data/entities/api/user/user_data.dart';
import '../../../domain/usecase/db/db_config_usecase.dart';
import '../../../domain/usecase/db/db_insert_usecase.dart';
import '../notifier/error/error_notifier_controller.dart';
import 'package:rising_gym/core/error/failuers.dart';

class DBCongigMutation extends EventMutations<dynamic> {
  UseCase usecase;

  DBCongigMutation(this.usecase, dynamic data) : super(data);

  @override
  perform() async {
  /*  if(usecase is DBInsertUseCase) {
      final request =  await (usecase as DBInsertUseCase)(data:data);
      request.fold((l) => errorToast(l.properties.first), (r) => null);
    }else */if(usecase is BDConfigUseCase){
      if (kDebugMode) {
        print("configuration Sql DB");
      }
      final  request = await (usecase as BDConfigUseCase)(data:data);
      request.fold((l) => errorToast(l.properties.first), (r) => (r)?successToast("Successfully Configured"):errorToast("Error Occurred"),);
    }
  }
}