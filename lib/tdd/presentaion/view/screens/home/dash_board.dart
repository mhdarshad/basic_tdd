
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../rought_genrator.dart';
import '../../../../domain/entities/vx_store.dart';

import '../../../modules/notifier/error/error_notifier_container.dart';
import '../../components/kiosk_container/kiosk_container.dart';
import '../../widgets/drawer/end_drawer.dart';

class DashBoard extends StatefulWidget {
  DashBoard(String param, {Key? key}) :super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        late PageController pageViewController ;

  final GlobalKey _key = GlobalKey();

  @override
  void initState() {
    // pageViewController = PageController(initialPage: widget.index);
    // sl<GetUserBloc>()(data: NoPrams());
    // (VxState.store as ProjectStore).user_type = widget.usertype;

  }
  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }
  @override
  void didUpdateWidget(DashBoard oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      endDrawer: EndDrawer(),
      body:    const SafeArea(child: CustomNotifier(child: KioskHomeContainer())),
      );
  }
}



