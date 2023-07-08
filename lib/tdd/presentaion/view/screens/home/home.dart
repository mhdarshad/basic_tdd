
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_me_v2/rought_genrator.dart';
import 'package:cloud_me_v2/tdd/presentaion/modules/database_module/db_config_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../core/util/config/user_config.dart';
import '../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import '../../../../../core/util/presentation/template/custom_scafold.dart';

import '../../../../../injection_container.dart';
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
            child: GestureDetector(
              onTap: (){
                sl<Configration>().custTocken = null;
                navigate.push(context, name: Routename.profile,);
              },
              child: Container(
                width: 60,
                height: 60,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: CachedNetworkImage(
                  imageUrl:'',
                  fit: BoxFit.cover,
                  errorWidget: (contxt,url,data){
                    return Image.asset('assets/icons/profile.jpeg');
                  },
                ),
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



