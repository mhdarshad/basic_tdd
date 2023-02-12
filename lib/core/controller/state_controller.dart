import 'package:flutter/material.dart';

abstract class StateController{
  initialState(BuildContext context);
  onDispose();
}