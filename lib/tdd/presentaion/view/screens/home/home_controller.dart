import 'package:cloud_me_v2/rought_genrator.dart';
import 'package:flutter/material.dart';

import '../../components/gym_page/dash_boaard_conteainer/dash_board.dart';
import '../../components/gym_page/plan_select_container/plan_select_container.dart';
import '../../components/gym_page/scedule_listing/scedule_listing.dart';

class DashBoardController {
  static List<BottomNavigationBarItem> navigationItems = navigations.keys.map((e) => bottomNavigationBarItem(e)).toList();

 static BottomNavigationBarItem bottomNavigationBarItem(BotemNavigations item) {
   return  BottomNavigationBarItem(icon: Icon(navigations[item]!['icon'] as IconData),label: navigations[item]!['label'] as String);
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
Map<BotemNavigations,Map<String,dynamic>> navigations= {
  BotemNavigations.dashboard:{
    'icon':Icons.home,
    'label':"DashBoard",
    'page':const DashBoard()
  },
  BotemNavigations.plans:{
    'icon':Icons.event_busy,
    'label':"Plan",
    'page':const PlanSelectList()
  },
  BotemNavigations.scedule:{
    'icon':Icons.event_busy,
    'label':"Scedule",
    'page':const SceduleListing()
  }
};

enum BotemNavigations{
  dashboard,plans,scedule
}