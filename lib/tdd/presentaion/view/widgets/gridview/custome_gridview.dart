
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class CustomeGridView<T> extends StatelessWidget {

   CustomeGridView(BuildContext context,{
    Key? key,
     required this.scolldirection,
    required this.children,
     this.width,
     this.height,
  }) :
         _itemWidth = scolldirection ==Axis.horizontal&&width!=null? width.w:MediaQuery.of(context).size.width / children.length,
         _itemHeight =scolldirection ==Axis.vertical&&height!=null?height.h:MediaQuery.of(context).size.height / children.length,
         super(key: key);

  final double _itemWidth;
  final double _itemHeight;
  final List<Widget> children;
  final Axis scolldirection;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:scolldirection ==Axis.horizontal? height?.h:null,
      width: scolldirection ==Axis.vertical?width?.w:null,
      child: GridView.count(
          crossAxisCount:children.length,
          shrinkWrap: true,
          // scrollDirection: scolldirection,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio:scolldirection ==Axis.horizontal?(_itemHeight/_itemWidth) : (_itemWidth/_itemHeight),
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 8.0,
          children: children
      ),
    );
  }
}