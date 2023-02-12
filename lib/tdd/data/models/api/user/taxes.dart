
import 'tax.dart';

class Taxes {
  Taxes({
    required this.id,
    required this.name,
    this.nameLang,
    required this.isGroup,
    required this.businessId,
    required this.updatedAt,
    required this.createdAt,
    required this.tax,
  });
  late final String id;
  late final String name;
  late final Null nameLang;
  late final bool isGroup;
  late final String businessId;
  late final String updatedAt;
  late final String createdAt;
  late final List<Tax> tax;

  Taxes.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    name = json['name'];
    nameLang = null;
    isGroup = json['is_group'] ?? false;
    businessId = json['business_id'] ??'';
    updatedAt = json['updated_at'] ??'';
    createdAt = json['created_at'] ??'';
    tax = List.from(json['tax']??'').map((e)=>Tax.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['name_lang'] = nameLang;
    _data['is_group'] = isGroup;
    _data['business_id'] = businessId;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    _data['tax'] = tax.map((e)=>e.toJson()).toList();
    return _data;
  }
}