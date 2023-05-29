import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';

class ProjectExpansion extends StatelessWidget {
  final Widget expandedChild;

  const ProjectExpansion({Key? key, required this.title, required this.discription, required this.expandedChild}) : super(key: key);
  final String title;
  final Widget discription;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      color: const Color(0x00000000),
      child: ExpandableNotifier(
        initialExpanded: false,
        child: ExpandablePanel(
          header: Text(
            title,
            style: FlutterFlowTheme.of(context).displaySmall.override(
              fontFamily: 'Outfit',
              color: FlutterFlowTheme.of(context).alternate,
              fontSize: 20,
            ),
          ),
          collapsed: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: discription,
          ),
          expanded: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: FlutterFlowTheme.of(context).secondaryBackground,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: expandedChild,
          ),
          theme: ExpandableThemeData(
            tapHeaderToExpand: true,
            tapBodyToExpand: false,
            tapBodyToCollapse: false,
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            hasIcon: true,
            iconColor: FlutterFlowTheme.of(context).alternate,
          ),
        ),
      ),
    );
  }
}
