import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../rought_genrator.dart';
import '../butttons/custome_button.dart';


class CompleateKYCDailog extends StatelessWidget {
  const CompleateKYCDailog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Card(elevation: 6,child: Column(mainAxisSize: MainAxisSize.min,children: [
      'Please Complete your KYC to get fund to your bank account '.text.size(16).bodyText1(context).make().p20(),
      CustomeButton(icon: const Icon(Icons.file_copy_rounded,color: Colors.white,size: 20),text: "Submit KYC", ontap:() {
        navigate.push(context, name: Routename.kyc,parms: {'user':'user'} );
      },)
    ],)));
  }
}
