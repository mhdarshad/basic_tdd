import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../domain/entities/vx_store.dart';
import 'login_form_controller.dart';

class LoginFormConsumer extends StatelessWidget {
  final Widget Function(BuildContext, ProjectStore, VxStatus?) builder;

  const LoginFormConsumer({Key? key,required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxConsumer<ProjectStore>(
      builder: (context,store,_) {
        return builder(context,store,_);
      }, mutations: const {GetUserEvents},
    );
  }
}
