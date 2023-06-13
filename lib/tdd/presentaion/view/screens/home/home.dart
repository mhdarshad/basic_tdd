
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../core/util/presentation/template/custom_scafold.dart';

import '../../widgets/drawer/end_drawer.dart';
import 'home_controller.dart';

class DashBoardPage extends StatefulWidget {
  String? pageName;

  DashBoardPage(this.pageName, {Key? key}) :super(key: key);

  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {

  final GlobalKey _key = GlobalKey();

  @override
  void initState() {
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  void didUpdateWidget(DashBoardPage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      endDrawer: EndDrawer(),
      bottomNavigationBar: BottomNavigationBar(items: DashBoardController.navigationItems,
      currentIndex: DashBoardController.setNavigationIndex(widget.pageName??BotemNavigations.dashboard.name),
        onTap:(index) =>DashBoardController.onTapavigation(context,index),),
      body: SafeArea(child:  ProjectScafold(child: DashBoardController.getPageOnWidget(widget.pageName??BotemNavigations.dashboard.name)),
      ));
  }
}



