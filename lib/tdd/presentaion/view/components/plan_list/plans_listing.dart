import 'package:flutter/material.dart';

import '../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';

class PlansListing extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const PlansListing({Key? key,required this.title, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: FlutterFlowTheme.of(context).displaySmall.override(
                fontFamily: 'Outfit',
                color: FlutterFlowTheme.of(context).primary,
                fontSize: 20,
              ),
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}
