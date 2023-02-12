import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

/// This Widget Require Expandable package
class ExpansionDrawer extends StatelessWidget {
  const ExpansionDrawer({Key? key, required this.title, this.expanded,}) : super(key: key);
  final Widget title;
  final Widget? expanded;

  @override
  Widget build(BuildContext context) {
    return expanded!=null?ExpandableNotifier(
      controller: ExpandableController(),
      child: ExpandableTheme(
          data: ExpandableThemeData(iconColor: Theme.of(context).textTheme.bodyText1?.color,animationDuration: const Duration(milliseconds: 500)),
          child: ScrollOnExpand(child: ExpandablePanel(
            header: ExpandedHeaderWidget(),
            collapsed: const SizedBox.shrink(),
            expanded: ExpandedContentWidget(), ))
      ),
    ):Row(
      children: [
        ExpandedHeaderWidget(),
      ],
    );
  }

  Padding ExpandedContentWidget() {
    return Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: expanded!,
          );
  }

  Widget ExpandedHeaderWidget() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: title,
    );
  }
}
