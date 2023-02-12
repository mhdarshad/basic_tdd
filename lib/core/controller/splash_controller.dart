import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../rought_genrator.dart';
import 'state_controller.dart';

class SplashController extends GoNavigations implements StateController{

  @override
  initialState(BuildContext context) {
    // Navigator.of(context).pushReplacementNamed(RoutName.login, arguments: 2);
    GNavigation(context, type: NavigatoreTyp.logedout);
    // Future.delayed(const Duration(seconds: 3),(){
    // if (kDebugMode) {
    //   print("nextpage Exicuted");
    //
    //   Navigator.of(context).pushReplacementNamed('/login', arguments: 2);
    //   // Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginView()),);
    // }
    // });
  }

  @override
  onDispose() {
    // TODO: implement onDispose
    throw UnimplementedError();
  }
}