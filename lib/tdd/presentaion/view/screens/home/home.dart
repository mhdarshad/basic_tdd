
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';
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
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'Home',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
            fontFamily: 'Outfit',
            color: FlutterFlowTheme.of(context).primaryText,
            fontSize: 22,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: Container(
              width: 60,
              height: 60,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                'https://images.unsplash.com/photo-1489980557514-251d61e3eeb6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTR8fHVzZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      endDrawer: EndDrawer(),
      bottomNavigationBar: BottomNavigationBar(items: DashBoardController.navigationItems,
      currentIndex: DashBoardController.setNavigationIndex(widget.pageName??BotemNavigations.dashboard.name),
        onTap:(index) =>DashBoardController.onTapavigation(context,index),),
      body: SafeArea(child:  ProjectScafold(child: DashBoardController.getPageOnWidget(widget.pageName??BotemNavigations.dashboard.name)),));
  }
}



