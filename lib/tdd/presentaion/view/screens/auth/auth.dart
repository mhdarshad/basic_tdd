import 'dart:convert';

import 'package:cloud_me_v2/injection_container.dart';
import 'package:flutter/material.dart';

import '../../../../../core/controller/json_controller/json_save.dart';
import '../../../../domain/usecase/auth/user_login.dart';
import '../../../modules/login/login_form_controller.dart';
import '../../widgets/butttons/custome_button.dart';
import '../../widgets/custome_widget/brnd_login_logo.dart';
import '../../widgets/textForm/form_text_filed.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          // height: size.height,
          // width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: 380,
                  width: 350,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          LoginLogo()
                        ],
                      ),
                      Text('Login',style: Theme.of(context).textTheme.subtitle1,),
                      FormTextFiled(labelText: 'Email', controller: TextEditingController(),),
                      FormTextFiled(labelText: 'Password', controller: TextEditingController(),keyboardType: TextInputType.visiblePassword,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomeButton(text:'Login',fontsize:30,ontap: (){
                          sl<GetUserController>()(data:LoginData(username: 'admin@cinnamontree.com', password: '123456', key: 'c413ft5arycm4oo9mam7ux3h24m93zk49k02'));
                        },),
                      ),
                      //  ts('Forgot Password ? Help', Colors.grey, 12)
                    ],
                  ),
                ),
              ),
              const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}

