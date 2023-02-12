
import 'id.dart';

class Tax {
  Tax({
    required this.id,
    required this.name,
    required this.nameLang,
    required this.rate,
  });
  late final Id id;
  late final String name;
  late final String nameLang;
  late final int rate;

  Tax.fromJson(Map<String, dynamic> json){
    id = Id.fromJson(json['_id']);
    name = json['name'];
    nameLang = json['name_lang'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id.toJson();
    _data['name'] = name;
    _data['name_lang'] = nameLang;
    _data['rate'] = rate;
    return _data;
  }
}