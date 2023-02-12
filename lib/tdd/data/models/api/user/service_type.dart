
class ServiceTypes {
  ServiceTypes({
    required this.id,
    required this.type,
    required this.name,
    this.nameLang,
    required this.sortOrder,
    required this.isThirdParty,
    required this.commission,
    required this.paymentMethods,
    required this.businessId,
    required this.updatedAt,
    required this.createdAt,
  });
  late final String id;
  late final String type;
  late final String name;
  late final Null nameLang;
  late final int sortOrder;
  late final bool isThirdParty;
  late final int commission;
  late final List<String> paymentMethods;
  late final String businessId;
  late final String updatedAt;
  late final String createdAt;

  ServiceTypes.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    type = json['type'];
    name = json['name'];
    nameLang = null;
    sortOrder = json['sort_order'];
    isThirdParty = json['is_third_party'];
    commission = json['commission'];
    paymentMethods = List.castFrom<dynamic, String>(json['payment_methods']??[
      {'':''}
    ]);
    businessId = json['business_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['type'] = type;
    _data['name'] = name;
    _data['name_lang'] = nameLang;
    _data['sort_order'] = sortOrder;
    _data['is_third_party'] = isThirdParty;
    _data['commission'] = commission;
    _data['payment_methods'] = paymentMethods;
    _data['business_id'] = businessId;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    return _data;
  }
}
