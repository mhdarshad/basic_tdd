
class SellingPriceGroup {
  SellingPriceGroup({
    required this.id,
    required this.name,
    required this.nameLang,
    required this.businessId,
    required this.isDefault,
    required this.updatedAt,
    required this.createdAt,
  });
  late final String id;
  late final String name;
  late final String nameLang;
  late final String businessId;
  late final bool isDefault;
  late final String updatedAt;
  late final String createdAt;

  SellingPriceGroup.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    name = json['name'];
    nameLang = json['name_lang'];
    businessId = json['business_id'];
    isDefault = json['is_default'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['name_lang'] = nameLang;
    _data['business_id'] = businessId;
    _data['is_default'] = isDefault;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    return _data;
  }
}