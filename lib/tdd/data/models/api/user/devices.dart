class Device {
  String? sId;
  String? licenseKey;
  int? invNo;
  int? rtnNo;
  bool? status;
  String? businessId;
  String? prefix;
  String? updatedAt;
  String? createdAt;

  Device(
      {this.sId,
        this.licenseKey,
        this.invNo,
        this.rtnNo,
        this.status,
        this.businessId,
        this.prefix,
        this.updatedAt,
        this.createdAt});

  Device.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    licenseKey = json['license_key'];
    invNo = json['inv_no'];
    rtnNo = json['rtn_no'];
    status = json['status'];
    businessId = json['business_id'];
    prefix = json['prefix'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['license_key'] = this.licenseKey;
    data['inv_no'] = this.invNo;
    data['rtn_no'] = this.rtnNo;
    data['status'] = this.status;
    data['business_id'] = this.businessId;
    data['prefix'] = this.prefix;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    return data;
  }
}
