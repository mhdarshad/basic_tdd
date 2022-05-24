import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'flutter_flow_theme.dart';

class FFButtonOptions {

  const FFButtonOptions({
    this.textStyle,
    this.elevation,
    this.height,
    this.width,
    this.padding,
    this.color,
    this.disabledColor,
    this.disabledTextColor,
    this.splashColor,
    this.iconSize,
    this.iconColor,
    this.iconPadding,
    this.borderRadius,
    this.borderSide,
    this.gradiant,
    this.border
  });

  final TextStyle? textStyle;
  final double? elevation;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final Color? splashColor;
  final double? iconSize;
  final Color? iconColor;
  final EdgeInsetsGeometry? iconPadding;
  final double? borderRadius;
  final BorderSide? borderSide;
  final Border? border;
  final LinearGradient? gradiant;
}

class FFButtonWidget extends StatelessWidget {
  const FFButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.iconData,
    required this.options,
    this.loading = false,
  }) : super(key: key);

  final String text;
  final Widget? icon;
  final IconData? iconData;
  final VoidCallback onPressed;
  final FFButtonOptions options;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    Widget textWidget = loading
        ? Center(
      child: Container(
        width: 23,
        height: 23,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            options.textStyle!.color ?? Colors.white,
          ),
        ),
      ),
    )
        : AutoSizeText(
      text,
      style: options.textStyle,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
    if (icon != null || iconData != null) {
      textWidget = Flexible(child: textWidget);
      return Container(
        height: options.height,
        width: options.width,

        child: RaisedButton.icon(
          icon: Padding(
            padding: options.iconPadding ?? EdgeInsets.zero,
            child: icon ??
                FaIcon(
                  iconData,
                  size: options.iconSize,
                  color: options.iconColor ?? options.textStyle!.color,
                ),
          ),
          label: textWidget,
          onPressed: loading ? () {} : onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(options.borderRadius!),
            side: options.borderSide ?? BorderSide.none,
          ),
          color: options.color,
          colorBrightness: ThemeData.estimateBrightnessForColor(options.color!),
          textColor: options.textStyle!.color,
          disabledColor: options.disabledColor,
          disabledTextColor: options.disabledTextColor,
          elevation: options.elevation,
          splashColor: options.splashColor,
        ),
      );
    }

    return GestureDetector(
      onTap: ()=>onPressed(),
      child: Container(
        height: options.height,
        width: options.width,
      decoration: BoxDecoration(color: Colors.white,gradient: options.gradiant,),
        child: Container(
          width: options.width,
          height: options.height,
          decoration: BoxDecoration(
            border:options.border,
            color: options.color,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: options.textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
