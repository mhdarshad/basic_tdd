import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
  final String? text;
  final Widget? icon;
  final Function ontap;
  final double? fontsize;
  const CustomeButton({
    this.text,
    Key? key,
    this.icon,
    required this.ontap,
    this.fontsize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () =>ontap(),
      child: Card(
        color:  Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          // padding: const EdgeInsets.all(6.0),
          child: Row  (
            mainAxisSize: MainAxisSize.min,
            children:  [
              if(text!=null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(text!,style:  TextStyle(color: Colors.white,fontSize: fontsize??12)),
                ),
              if(icon!=null)
                icon!,
            ],
          ),
        ),
      ),
    );
  }
}