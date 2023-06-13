import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

abstract class ModelEntities extends Equatable {
  String? status;
  String? msg;
  dynamic? data;
  List<dynamic>? flags;

  ModelEntities({this.status, this.msg, this.data, this.flags});

  ModelEntities.fromJson(Map<String, dynamic> json) ;

  Map<String, dynamic> toJson();
  // }
  @override
  // TODO: implement props
  List<Object?> get props => [];

}