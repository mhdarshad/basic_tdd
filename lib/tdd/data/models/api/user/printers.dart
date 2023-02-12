
class Printers {
  Printers({
    required this.id,
    required this.name,
    required this.type,
    required this.localIp,
    required this.locationId,
    required this.locationName,
    required this.isReceipt,
    required this.businessId,
    required this.updatedAt,
    required this.createdAt,
  });
  late final String id;
  late final String name;
  late final String type;
  late final String localIp;
  late final String locationId;
  late final String locationName;
  late final String isReceipt;
  late final String businessId;
  late final String updatedAt;
  late final String createdAt;

  Printers.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    name = json['name'];
    type = json['type'];
    localIp = json['local_ip'];
    locationId = json['location_id'];
    locationName = json['location_name'];
    isReceipt = json['is_receipt']??'';
    businessId = json['business_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['type'] = type;
    _data['local_ip'] = localIp;
    _data['location_id'] = locationId;
    _data['location_name'] = locationName;
    _data['is_receipt'] = isReceipt;
    _data['business_id'] = businessId;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    return _data;
  }
}