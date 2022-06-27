import 'package:flutter/material.dart';
import 'package:number_pagination/number_pagination.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../../../injection_container.dart';
import '../../../../domain/entities/vx_store.dart';
import '../../../events/dashboard/get_user_data.dart';

class PaginationIndexControllerWidget extends StatelessWidget {
  PaginationIndexControllerWidget({
    Key? key,
    required this.selectedPageNumber,
    required this.onPageChange,
  }) : super(key: key);

  final ValueNotifier<int> selectedPageNumber;
  final Function(int) onPageChange;
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
          pageTotal: store.pagination?.lastPage??1,
          pageInit: store.pagination?.currentPage??1,
          // picked number when init page
          colorPrimary: Theme.of(context).primaryColor,
          colorSub: Colors.white,
        );
      },
      valueListenable: selectedPageNumber,
    );
  }
}