
import 'package:cloud_me_v2/tdd/presentaion/view/components/sign_up/otp_signup.dart';
import 'package:flutter/material.dart';

import '../../../../../core/util/presentation/template/custom_scafold.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  @override
  Widget build(BuildContext context) {
    return const ProjectScafold( displayLogoHead:true,child: Padding(
      padding: EdgeInsets.all(10.0),
      child: SignupOtp(),
    ),);
  }
}



