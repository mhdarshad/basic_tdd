
import 'package:cloud_me_v2/tdd/presentaion/view/components/gym_page/dash_boaard_conteainer/dash_board.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../core/util/presentation/template/custom_scafold.dart';
import '../../../../../rought_genrator.dart';
import '../../../../domain/entities/vx_store.dart';

import '../../../modules/notifier/error/error_notifier_container.dart';
import '../../components/kiosk_container/kiosk_container.dart';
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



