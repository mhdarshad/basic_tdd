class Floor {
  int? autoId;
  String? sId;
  String? name;
  String? nameLang;
  int? sortOrder;
  String? locationId;
  String? locationName;
  String? businessId;

  Floor(
      {this.autoId,
        this.sId,
        this.name,
        this.nameLang,
        this.sortOrder,
        this.locationId,
        this.locationName,
        this.businessId});

  Floor.fromJson(Map<String, dynamic> json) {
    autoId = json['auto_id'];
    sId = json['_id'];
    name = json['name'];
    nameLang = json['nameLang'];
    sortOrder = json['sort_order'];
    locationId = json['location_id'];
    locationName = json['location_name'];
    businessId = json['business_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['auto_id'] = autoId;
    data['_id'] = sId;
    data['name'] = name;
    data['nameLang'] = nameLang;
    data['sort_order'] = sortOrder;
    data['location_id'] = locationId;
    data['location_name'] = locationName;
    data['business_id'] = businessId;
    return data;
  }
}
