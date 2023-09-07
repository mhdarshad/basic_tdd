import 'package:rising_gym/core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import 'package:rising_gym/rought_genrator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/gym_page/dash_boaard_conteainer/dash_board.dart';
import '../../components/gym_page/plan_select_container/plan_select_container.dart';
import '../../components/gym_page/scedule_listing/class_list.dart';
import '../../components/gym_page/scedule_listing/scedule_listing.dart';
import '../../components/gym_page/web_view/webview.dart';

class DashBoardController {
  static late BuildContext _context;
  static List<BottomNavigationBarItem> navigationItems = navigations.keys.map((e) => bottomNavigationBarItem(e)).toList();
static setContext(BuildContext context)=>_context = context;
 static BottomNavigationBarItem bottomNavigationBarItem(BottemNavigationsData item) {

   return  BottomNavigationBarItem(activeIcon:SvgPicture.asset(
       // width:20,
       // height:20,
       navigations[item]?['icon']??'assets/icons/home.svg',
       color:FlutterFlowTheme.of(_context).primary ,
       colorFilter:  ColorFilter.mode(FlutterFlowTheme.of(_context).primary, BlendMode.srcIn),
       semanticsLabel: 'A red up arrow'
   ), icon: SvgPicture.asset(
       navigations[item]?['icon']??'assets/icons/home.svg',
       colorFilter:  const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
       semanticsLabel: 'A red up arrow'
   ),label: navigations[item]!['label'] as String);
 }
 static String? currentPageName(String pageName){
   return navigations[navigations.keys.toList().where((element) => element.name == pageName).first]?['label'];
 }
  static onTapavigation(BuildContext context, int index){
    navigate.push(context, name:Routename.home,parms: {
      'page': navigations.keys.elementAt(index).name
    });
  }
  static int setNavigationIndex(String index) {
    return navigations.keys.toList().indexWhere((element) => element.name == index);
  }
  static Widget getPageOnWidget(String pageName){
   return navigations[navigations.keys.toList().where((element) => element.name == pageName).first]?['page'] as Widget;
  }
}
Map<BottemNavigationsData,Map<String,dynamic>> navigations= {
  BottemNavigationsData.dashboard:{
    'icon':'assets/icons/home.svg',
    'label':"DashBoard",
    'page':const DashBoard()
  },
  BottemNavigationsData.plans:{
    'icon':'assets/icons/dollar-circle.svg',
    'label':"Plan",
    'page':const PlanSelectList()
  },
  BottemNavigationsData.scedule:{
    'icon':'assets/icons/calendar.svg',
    'label':"Schedule",
    'page':const SceduleListing()
  },
  BottemNavigationsData.webView:{
    'icon':'assets/icons/menu.svg',
    'label':"Rising",
    'page': Webview()
  }
};

enum BottemNavigationsData{
  dashboard,plans,scedule,webView
}
//  BottemNavigationsData.dashboard:{
//     'icon':'assets/icons/home.svg',
//     'label':"DashBoard",
//     'page':const DashBoard()
//   },
//   BottemNavigationsData.plans:{
//     'icon':'assets/icons/dollar-circle.svg',
//     'label':"Plan",
//     'page':const PlanSelectList()
//   },
//   BottemNavigationsData.scedule:{
//     'icon':'assets/icons/calendar.svg',
//     'label':"Scedule",
//     'page':const SceduleListing()
//   }