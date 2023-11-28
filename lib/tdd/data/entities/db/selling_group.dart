class SellingGroup {
  int? autoId;
  String? sId;
  String? name;
  int? isDefault;

  SellingGroup({this.autoId, this.sId, this.name, this.isDefault});

  SellingGroup.fromJson(Map<String, dynamic> json) {
    autoId = json['autoId'];
    sId = json['_id'];
    name = json['name'];
    isDefault = json['is_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['autoId'] = this.autoId;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['is_default'] = this.isDefault;
    return data;
  }
}