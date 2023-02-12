import 'package:cloud_me_v2/tdd/presentaion/view/widgets/list/widget_view_holder.dart';
import 'package:flutter/material.dart';

import '../expansion_widget/expansion_list.dart';


class ExpansionDrawerListView extends StatelessWidget {
  const ExpansionDrawerListView({Key? key, required this.childrens}) : super(key: key);
  final List<ExpansionDrawerData> childrens;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(key:const PageStorageKey<String>('expansion_page_key'),
      child: Column(
          children:childrens.map((e) => WidgetViewHolder(value: null,
          child: Card(child: ExpansionDrawer(title: e.title, expanded: e.expanded)))).toList()),
    );
  }
}
class ExpansionDrawerData{
  final Widget title;
  late Widget? expanded;
  ExpansionDrawerData({required this.title, this.expanded,});
}