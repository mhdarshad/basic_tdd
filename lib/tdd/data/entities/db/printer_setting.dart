class PrinterSetting {
  int? autoId;
  String? id;
  String? name;
  String? type;
  String? localIp;
  String? locationId;
  String? locationName;
  String? businessId;
  String? isReceipt;

  PrinterSetting(
      {this.autoId,
        this.id,
        this.name,
        this.type,
        this.localIp,
        this.locationId,
        this.locationName,
        this.businessId,
        this.isReceipt});

  PrinterSetting.fromJson(Map<String, dynamic> json) {
    autoId = json['autoId'];
    id = json['id'];
    name = json['name'];
    type = json['type'];
    localIp = json['local_ip'];
    locationId = json['location_id'];
    locationName = json['location_name'];
    businessId = json['business_id'];
    isReceipt = json['is_receipt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['autoId'] = this.autoId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['local_ip'] = this.localIp;
    data['location_id'] = this.locationId;
    data['location_name'] = this.locationName;
    data['business_id'] = this.businessId;
    data['is_receipt'] = this.isReceipt;
    return data;
  }
}
