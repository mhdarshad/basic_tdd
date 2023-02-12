import 'use_data.dart';

class UserAccsessDataAPI {
  UserAccsessDataAPI({
    required this.status,
    required this.msg,
    required this.data,
    required this.flags,
  });
  late final String status;
  late final String msg;
  late final UserAcsessData data;
  late final List<Object> flags;

  UserAccsessDataAPI.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['msg'];
    data = UserAcsessData.fromJson(json['data']);
    flags = (json['flags'] is List<Object>) ?json['flags']:[];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['msg'] = msg;
    _data['data'] = data.toJson();
    _data['flags'] = flags;
    return _data;
  }
}
