import 'package:cloud_me_v2/rought_genrator.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../domain/entities/vx_store.dart';
import '../../../domain/usecase/auth/user_login.dart';
import '../../view/screens/home/home_controller.dart';
import 'login_form_controller.dart';

class LoginFormConsumer extends StatelessWidget {
  final Widget Function(BuildContext, ProjectStore, VxStatus?) builder;

  const LoginFormConsumer({Key? key,required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxConsumer<ProjectStore>(
      notifications:  {
        GetUserEvents:(context,store, {VxStatus? status}){
          if((store as GetUserEvents).usecase  is LoginUseCase){
            if(status == VxStatus.success){
              navigate.pushReplace(context, name: Routename.home,parms: {
                'page':BottemNavigationsData.dashboard.name
              });
            }
          }
          if((store).usecase  is OtpUseCase){
            if(status == VxStatus.success){
              navigate.pushReplace(context, name: Routename.home,parms: {
                'page':BottemNavigationsData.dashboard.name
              });
            }
          }
        }
      },
      builder: (context,store,_) {
        return builder(context,store,_);
      }, mutations: const {GetUserEvents},
    );
  }
}
