import 'package:flutter/material.dart';
class MeterialBanners{
  BuildContext context;
  String text;
  List<Widget> actions;
  Widget leading;
  //[
  //           TextButton(
  //             onPressed: () {},
  //             child: const Text(
  //               'Activate',
  //               style: const TextStyle(color: Colors.purple),
  //             ),
  //           ),
  //         ]

  MeterialBanners(this.context, {
    required this.text,
    required this.actions,
    required this.leading,
  });
  show(){
    WidgetsBinding.instance
        .addPostFrameCallback((_) => ScaffoldMessenger.of(context) ..removeCurrentMaterialBanner()
      ..showMaterialBanner(MaterialBanner(content:  Text(text),
        backgroundColor: Colors.lightGreenAccent,
        leading:leading,
        contentTextStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.indigo),
        actions: actions,)));
    ;
  }
  remove(){
    WidgetsBinding.instance
        .addPostFrameCallback((_) => ScaffoldMessenger.of(context) .removeCurrentMaterialBanner(reason: MaterialBannerClosedReason.dismiss));
  }
  dispos(){
    WidgetsBinding.instance
        .addPostFrameCallback((_) => ScaffoldMessenger.of(context) .removeCurrentMaterialBanner(reason: MaterialBannerClosedReason.remove));
  }
}