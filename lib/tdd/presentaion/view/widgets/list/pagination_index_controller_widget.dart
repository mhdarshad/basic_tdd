import 'package:flutter/material.dart';
import 'package:number_pagination/number_pagination.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../domain/modle/vx_store.dart';

class PaginationIndexControllerWidget extends StatelessWidget {
  PaginationIndexControllerWidget({
    Key? key,
    required this.selectedPageNumber,
    required this.totalPage,
    required this.onPageChange,
  }) : super(key: key);

  final ValueNotifier<int> selectedPageNumber;
  final Function(int) onPageChange;
  final int totalPage;
  var store = (VxState.store as ProjectStore);
  @override
  Widget build(BuildContext context) {
    return buildPagination(store);
  }
  ValueListenableBuilder<int> buildPagination(ProjectStore store) {
    return ValueListenableBuilder<int>(
      builder: (BuildContext context, value, Widget? child) {
        return NumberPagination(
          onPageChanged:  onPageChange,
          pageTotal: totalPage,
          pageInit: value,
          // picked number when init page
          colorPrimary: Theme.of(context).primaryColor,
          colorSub: Colors.white,
        );
      },
      valueListenable: selectedPageNumber,
    );
  }
}