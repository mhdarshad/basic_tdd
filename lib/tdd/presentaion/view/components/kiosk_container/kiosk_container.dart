import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_me_v2/core/controller/json_controller/json_save.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../core/helper/converter/extentions.dart';
import '../../../../../core/util/presentation/styles/container_style.dart';
import '../../../modules/product/product_data.dart';
import '../../widgets/gridview/grid_view_2.dart';
import '../../widgets/list/CListView.dart';
import '../../widgets/list/expansion_drawer_list_view.dart';


class KioskHomeContainer extends StatefulWidget {
  const KioskHomeContainer({Key? key}) : super(key: key);

  @override
  State<KioskHomeContainer> createState() => _KioskHomeContainerState();
}

class _KioskHomeContainerState extends State<KioskHomeContainer> {
final List expansinDatas = ['','','','','','','','','',''];
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Expanded(
          flex: 1,
          child: ExpansionDrawerListView(childrens: expansinDatas.map((e) => ExpansionDrawerData(title: 'Categories ${expansinDatas.indexOf(e)+1}'.text.make(),expanded:'Sub Categories ${expansinDatas.indexOf(e)+1}'.text.make())).toList(),),
        ),
        Expanded(flex:2,
            child: GridViewListWidget(width: 60,context,list: const ['','','','','','','','','','','','','','','','','','','','','','','','','',''],
              builder: (BuildContext context, value) {
          return ProductData(price: '20'' AED',title: 'Products',
            image: Uri.parse('uri'),
            onProductTap: () async{
              print("product tapped");
              await JsonSave.deleteFile('db_config');
            },);
        }, axisItemCount: 4,
              scolldirection: Axis.vertical,)),
      ],
    );
  }
}

