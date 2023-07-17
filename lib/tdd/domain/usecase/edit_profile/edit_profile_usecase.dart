import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../core/util/config/user_config.dart';
import '../../../../injection_container.dart';
import '../../entities/edit_profile/edit_profile_modle.dart';
import '../../repositories/repository_provider.dart';

class EditProfileModuleUseCase {
  DependencyRepostProvider<dynamic> repo;
  EditProfileModuleUseCase({required this.repo});
  call({required EditProfileModuleDatas data}) async {
    final result =  await repo.getRequest(Params(uri: Uri.parse("customer_profile_edit"), methed: Methed.Post,data: {
        "cus_id": "${sl<Configration>().custId}",
        "cust_name" : data.name,
        "cust_country" : data.contry,
        "cust_add": data.address,
        "cust_state" : data.state,
        "emirates_id" :data.emeratesId,
        "cust_emergency_number" :data.emergencyNumber,
        "cust_emergency_address" :data.emergencyAddress,
        "cust_image" :data.profilePic,
    }));
    return result.fold((l) => Left(l), (r) {
      if (kDebugMode) {
        print(r);
      }
      return  const Right(true);
    });
  }
}
