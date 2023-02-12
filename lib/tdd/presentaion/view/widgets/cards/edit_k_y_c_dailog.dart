import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../rought_genrator.dart';
import '../butttons/custome_button.dart';


class EditKYCDailog extends StatelessWidget with GoNavigations{
  const EditKYCDailog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Card(elevation: 6,child: Column(mainAxisSize: MainAxisSize.min,children: [
      'Your KYC is been submitted, We will Review and notify you Shortly. '.text.size(16).bodyText1(context).make().p20(),
      'You Can Edit Your KYC Details. '.text.size(10).bodyText1(context).make().p20(),
      CustomeButton(icon: const Icon(Icons.file_copy_rounded,color: Colors.white,size: 20),text: "Edit KYC", ontap:() {
      GNavigation(context, type: NavigatoreTyp.push,name: Routename.kyc,parms: {'user':'user'});
      },)
    ],)));
  }
}
