import 'package:flutter/material.dart';

class WidgetViewHolder<T> extends InheritedWidget {
  const WidgetViewHolder({
    Key? key,
    required this.value,
    required Widget child,
  })
      : super(key: key, child: child);

  final T value;

  static WidgetViewHolder of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<WidgetViewHolder>() as WidgetViewHolder;
  }

  @override
  bool updateShouldNotify(WidgetViewHolder oldWidget) {
    return value != oldWidget.value;
  }
}