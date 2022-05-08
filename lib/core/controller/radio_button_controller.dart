import 'package:flutter/material.dart';

class RadioButtonController {
  late ValueNotifier<int>  _selectedindex = ValueNotifier<int>(0);
  bool _disposed = false;

  bool get disposed => _disposed;
  ValueNotifier<int> get selectedindex => _selectedindex;
  set selectedindex(ValueNotifier<int> value) {
    _selectedindex = value;
   // _selectedindex.notifyListeners();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    // _selectedindex.dispose();
    _disposed = true;
  }
}