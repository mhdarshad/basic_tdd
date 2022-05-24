/*
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:mapmyindia_gl/mapmyindia_gl.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yaan/models/vx_store/app_var_store.dart';
import 'package:yaan/services/map_requests.dart';

import 'flutter_flow_widgets.dart';

class FlutterFlowPlacePicker extends StatefulWidget {
  /// ## Map My India Place Picker Button
  /// map My India Place Picker Button Added Here You Can Customize Your Button Widget
  ///
  const FlutterFlowPlacePicker({
    Key? key,
    this.defaultText,
    required this.icon,
    required this.buttonOptions,
    required this.onSelect,
    this.proxyBaseUrl,
  }) : super(key: key);

  final String? defaultText;
  final Widget icon;
  final FFButtonOptions buttonOptions;
  final Function(ReverseGeocodePlace place) onSelect;
  final String? proxyBaseUrl;

  @override
  _FFPlacePickerState createState() => _FFPlacePickerState();
}

class _FFPlacePickerState extends State<FlutterFlowPlacePicker> {
  String? _selectedPlace;


  @override
  Widget build(BuildContext context) => FFButtonWidget(
        text: _selectedPlace ?? widget.defaultText ?? "Search places",
        icon: widget.icon,
        onPressed: () async {
          final _currentlocation = (VxState.store as AppVarStore).map.currentlocdata;
          final  _mapService = MapService();
          _mapService.openMapmyIndiaPlacePickerWidget(onSucsess:(value)=> widget.onSelect(value), initposition: LatLng(double.parse(_currentlocation!.latitude!), double.parse(_currentlocation.longitude!)));
        },
        options: widget.buttonOptions,
      );


}
*/
