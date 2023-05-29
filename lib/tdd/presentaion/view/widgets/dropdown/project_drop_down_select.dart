import 'package:flutter/material.dart';

import '../../../../../core/util/presentation/flutter_flow/flutter_flow_drop_down.dart';
import '../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import '../../../../../core/util/presentation/flutter_flow/form_field_controller.dart';

class ProjectDropDownSelect<T> extends StatelessWidget {
  ValueNotifier<T?> valueListenable = ValueNotifier(null);
  final  dynamic Function(T?) onChanged;
  final List<T> values;
  ProjectDropDownSelect({
    super.key,
    required this. valueListenable, required this.values, required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<T?>(
        valueListenable:valueListenable ,
        builder: (context,gender,_) {
          return FlutterFlowDropDown<T>(
            controller:
            FormFieldController<T>(
              gender ??= values.first,
            ),
            options:values,
            onChanged:onChanged,
            searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium,
            textStyle: FlutterFlowTheme.of(context).bodyMedium,
            hintText: 'Gender',
            searchHintText: 'Search for an item...',
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 24,
            ),
            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
            elevation: 2,
            borderColor: FlutterFlowTheme.of(context).alternate,
            borderWidth: 2,
            borderRadius: 8,
            margin: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
            hidesUnderline: true,
            isSearchable: false,
          );
        }
    );
  }
}