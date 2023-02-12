import 'package:flutter/material.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      //TODO: Need to add condition for Live And Dev
      child: Text('Dev',style: TextStyle(color: Colors.red,fontSize: 40,fontWeight: FontWeight.bold),),
    );
  }
}
