import 'package:flutter/material.dart';

BoxDecoration ProductContainerDecoration(color, double radius) => BoxDecoration(
  color: color,
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.2),
      blurRadius: 10,
      spreadRadius: 0.4,
      offset: const Offset(6, 6),
    ),
  ],
  borderRadius: BorderRadius.all(Radius.circular(radius)),
);