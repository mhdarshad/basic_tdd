class PaymentMethod {
  int? autoId;
  String? sId;
  String? name;
  int? status;
  String? type;
  String? nameLang;
  String? businessId;
  String? sortOrder;
  String? icon;
  String? isCategory;
  String? groupId;

  PaymentMethod(
      {this.autoId,
        this.sId,
        this.name,
        this.status,
        this.type,
        this.nameLang,
        this.businessId,
        this.sortOrder,
        this.icon,
        this.isCategory,
        this.groupId});

  PaymentMethod.fromJson(Map<String, dynamic> json) {
    autoId = json['auto_id'];
    sId = json['_id'];
    name = json['name'];
    status = json['status'];
    type = json['type'];
    nameLang = json['name_lang'];
    businessId = json['business_id'];
    sortOrder = json['sort_order'];
    icon = json['icon'];
    isCategory = json['is_category'];
    groupId = json['group_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['auto_id'] = this.autoId;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['status'] = this.status;
    data['type'] = this.type;
    data['name_lang'] = this.nameLang;
    data['business_id'] = this.businessId;
    data['sort_order'] = this.sortOrder;
    data['icon'] = this.icon;
    data['is_category'] = this.isCategory;
    data['group_id'] = this.groupId;
    return data;
  }
}
