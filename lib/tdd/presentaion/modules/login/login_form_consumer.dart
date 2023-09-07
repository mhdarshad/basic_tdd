import 'package:rising_gym/rought_genrator.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../domain/entities/vx_store.dart';
import '../../../domain/usecase/auth/user_login.dart';
import '../../view/screens/home/home_controller.dart';
import 'login_form_controller.dart';

class LoginFormConsumer extends StatelessWidget {
  final Widget Function(BuildContext, ProjectStore, VxStatus?) builder;
  final void Function(BuildContext, VxMutation<VxStore?>, VxStatus?) listner;

  const LoginFormConsumer({Key? key,required this.builder, required this.listner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxConsumer<ProjectStore>(
      notifications:  {
        GetUserEvents:(context,store, {VxStatus? status}){
        listner(context,store,status);

        }
      },
      builder: (context,store,_) {
        return builder(context,store,_);
      }, mutations: const {GetUserEvents},
    );
  }
}
