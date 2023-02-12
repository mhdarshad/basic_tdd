
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class GridViewListWidget<T> extends StatelessWidget {
  final Widget Function(BuildContext context,T value,) builder;
  final List<T> list;

  final double _itemWidth;
  final double _itemHeight;
  final Axis scolldirection;
  final double? width;
  final double? height;
  final int _itemcount;
  GridViewListWidget(context,{Key? key,
    required this.builder,
    required this.list ,
    required int axisItemCount,
    required this.scolldirection,
    this.width,
    this.height}):
        _itemcount = axisItemCount,
        _itemWidth = scolldirection ==Axis.horizontal&&width!=null? width.w:MediaQuery.of(context).size.height / axisItemCount,
        _itemHeight =scolldirection ==Axis.vertical&&height!=null? height.h:MediaQuery.of(context).size.height / axisItemCount,
        super(key: key);



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:scolldirection ==Axis.horizontal? ((height??0).h):null,
      width: scolldirection ==Axis.vertical? ((width??0)):null,
      child: GridView.count(
          crossAxisCount:_itemcount,
          shrinkWrap: true,
          // scrollDirection: scolldirection,
          // physics: const NeverScrollableScrollPhysics(),
          childAspectRatio:scolldirection ==Axis.horizontal?(_itemHeight/_itemWidth) : (_itemWidth/_itemHeight),
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 8.0,
          children:  list.map((ex) {
            return builder(context,ex);
          }).toList()
      ),
    );
  }
}