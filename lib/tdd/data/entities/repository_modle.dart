
import 'dart:convert';

import 'modle_entities.dart';

class RepositoryModel extends ModelEntities{
  @override
  RepositoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'];
    flags = json['flags'];
  }
  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['msg'] = msg;
    data['data'] = this.data;
    data['flags'] = flags;
    return data;
  }
}
// class CacheRepositoryModel extends ModelEntities{
//   CacheRepositoryModel(Map<String, dynamic> data) : super(jsonEncode(data));
//   CacheRepositoryModel.fromJson(data):super(json);
//
//   @override
//   Map<String, dynamic> toJson() {
//     // TODO: implement toJson
//     throw UnimplementedError();
//   }
//
// }