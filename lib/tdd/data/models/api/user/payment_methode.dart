
class PaymentMethods {
  PaymentMethods({
    required this.id,
    required this.name,
    required this.status,
    required this.groupId,
    required this.groupName,
    required this.type,
    required this.sortOrder,
    this.nameLang,
    required this.businessId,
    required this.updatedAt,
    required this.createdAt,
  });
  late final String id;
  late final String name;
  late final int? status;
  late final String groupId;
  late final String groupName;
  late final String type;
  late final int sortOrder;
  late final Null nameLang;
  late final String businessId;
  late final String updatedAt;
  late final String createdAt;

  PaymentMethods.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    name = json['name'];
    status = json['status']??0;
    groupId = json['group_id']??'';
    groupName = json['group_name']??'';
    type = json['type']??'';
    sortOrder = int.parse((json['sort_order']??'0').toString());
    nameLang = null;
    businessId = json['business_id']??'';
    updatedAt = json['updated_at']??'';
    createdAt = json['created_at']??'';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['status'] = status;
    _data['group_id'] = groupId;
    _data['group_name'] = groupName;
    _data['type'] = type;
    _data['sort_order'] = sortOrder;
    _data['name_lang'] = nameLang;
    _data['business_id'] = businessId;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    return _data;
  }
}
