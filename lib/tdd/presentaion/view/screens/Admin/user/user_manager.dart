import 'package:flutter/material.dart';

import '../../../components/dashboard/list_component/user_lsit_component.dart';

class UserManager extends StatefulWidget {
  const UserManager({Key? key}) : super(key: key);

  @override
  _UserManagerState createState() => _UserManagerState();
}

class _UserManagerState extends State<UserManager> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Theme.of(context).primaryColor.withAlpha(45),
      child: Column(
        children: const [
          UserLsitWidget(),
        ],
      ),
    );
  }
}
