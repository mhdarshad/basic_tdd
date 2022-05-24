import 'package:flutter/material.dart';
import '../../presentaion/view/screens/home/dash_board_home.dart';
import '../../presentaion/view/screens/home/downline.dart';

class DashBoardPageInfo{
   Function(int)? ontapNavigat;

  DashBoardPageInfo([this.ontapNavigat]);
  List<DashBoardPageModle>get  page => [
    DashBoardPageModle(title: "DASHBOARD", icon:  Icons.home,vstatus: true,widget: const HomeDash()),
    DashBoardPageModle(title: "DOWNLINE", icon:  Icons.home,vstatus: true,widget: const Downline()),
    DashBoardPageModle(title: "LEVEL", icon:  Icons.home,vstatus: true,widget: const HomeDash()),
    DashBoardPageModle(title: "FUND", icon:  Icons.home,vstatus: true,widget: const HomeDash()),
    DashBoardPageModle(title: "WITHDRAW", icon:  Icons.home,vstatus: true,widget: const HomeDash()),
    DashBoardPageModle(title: "TRANSACTION", icon:  Icons.home,vstatus: true,widget: const HomeDash()),
  ];
}
class DashBoardPageModle {
  late bool vstatus;
  String? title;
  Object? icon;
  Widget? widget;

  DashBoardPageModle({required this.vstatus, this.title, this.icon, this.widget});

  DashBoardPageModle.fromJson(Map<String, dynamic> json) {
    vstatus = json['status'];
    title = json['title'];
    icon = json['icon'];
    widget = json['widget'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.vstatus;
    data['title'] = this.title;
    data['icon'] = this.icon;
    data['widget'] = this.widget;
    return data;
  }
}
