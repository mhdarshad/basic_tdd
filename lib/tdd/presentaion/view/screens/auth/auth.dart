import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/util/presentation/flutter_flow/flutter_flow_animations.dart';
import '../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import '../../../../../core/util/presentation/template/custom_scafold.dart';
import '../../../modules/notifier/error/error_notifier_container.dart';
import '../../components/login/mobile_password_login.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return ProjectScafold(displayLogoHead:true, child: const Padding(
      padding: EdgeInsets.all(10.0),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: LoginFormComponent2Widget(),
      ),
    ),);
  }
}

