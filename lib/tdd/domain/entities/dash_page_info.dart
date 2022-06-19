import 'package:flutter/material.dart';

import '../../presentaion/view/screens/Admin/home/admin_home_dash_board.dart';
import '../../presentaion/view/screens/User/home/dash_board_home.dart';
import '../../presentaion/view/screens/User/home/downline.dart';
import '../../presentaion/view/screens/User/withdraw/withdraw.dart';

class DashBoardPageInfo{
   Function(int)? ontapNavigat;

  DashBoardPageInfo([this.ontapNavigat]);
  List<DashBoardPageModle>get  userpage => [
    DashBoardPageModle(title: "DASHBOARD", icon:  Icons.home,vstatus: true,widget: const HomeDash(), key: 'dashboard'),
    DashBoardPageModle(title: "DOWNLINE", icon:  Icons.arrow_downward_sharp,vstatus: false,widget: const Downline(), key: 'downline'),
    DashBoardPageModle(title: "LEVEL", icon:  Icons.home,vstatus: false,widget: const HomeDash(), key: 'level'),
    DashBoardPageModle(title: "FUND", icon:  Icons.home,vstatus: false,widget: const HomeDash(), key: 'fund'),
    DashBoardPageModle(title: "WITHDRAW", icon:  Icons.home,vstatus: true,widget:  const Withdraw(), key: 'withdrew'),
    DashBoardPageModle(title: "TRANSACTION", icon:  Icons.home,vstatus: false,widget: const HomeDash(), key: 'transaction'),
  ];
  List<DashBoardPageModle>get  adminpage => [
    DashBoardPageModle(title: "DASHBOARD", icon:  Icons.home,vstatus: true,widget:  const AdminHomeDashBoard(), key: 'dashboard'),
    DashBoardPageModle(title: "DOWNLINE", icon:  Icons.home,vstatus: false,widget: const Downline(), key: 'downline'),
    DashBoardPageModle(title: "LEVEL", icon:  Icons.home,vstatus: false,widget: const HomeDash(), key: 'level'),
    DashBoardPageModle(title: "FUND", icon:  Icons.home,vstatus: false,widget: const HomeDash(), key: 'fund'),
    // DashBoardPageModle(title: "WITHDRAW", icon:  Icons.home,vstatus: true,widget: const HomeDash(), key: 'withdrew'),
    DashBoardPageModle(title: "TRANSACTION", icon:  Icons.home,vstatus: false,widget: const HomeDash(), key: 'transaction'),
  ];
}
class DashBoardPageModle {
  late bool vstatus;
  String? title;
  late String key;
  Object? icon;
  Widget? widget;

  DashBoardPageModle({required this.vstatus, this.title, this.icon, this.widget,required this.key});

  DashBoardPageModle.fromJson(Map<String, dynamic> json) {
    vstatus = json['status'];
    title = json['title'];
    icon = json['icon'];
    widget = json['widget'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.vstatus;
    data['title'] = this.title;
    data['icon'] = this.icon;
    data['widget'] = this.widget;
    data['key'] = this.key;
    return data;
  }
}
