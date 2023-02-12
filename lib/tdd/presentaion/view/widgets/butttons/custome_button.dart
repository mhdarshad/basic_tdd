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
        color:  Colors.green,
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
                  child: Text(text!,style:  Theme.of(context).textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold,fontSize: fontsize??12,color: Colors.white),
                ),),
              if(icon!=null)
                icon!,
            ],
          ),
        ),
      ),
    );
  }
}