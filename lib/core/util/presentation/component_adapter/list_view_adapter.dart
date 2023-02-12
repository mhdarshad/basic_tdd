import 'package:flutter/material.dart';

abstract class ListViewAdapter<T>{
  onListSelected(T);
   builder(T){}
}
class ListViewImplimentation extends ListViewAdapter{

  @override
  onListSelected(T) {
    // TODO: implement onListSelected
    throw UnimplementedError();
  }
}
class List implements ListViewImplimentation {
  @override
  Widget builder(T) {
    // TODO: implement builder
    throw UnimplementedError();
  }

  @override
  onListSelected(T) {
    // TODO: implement onListSelected
    throw UnimplementedError();
  }
}