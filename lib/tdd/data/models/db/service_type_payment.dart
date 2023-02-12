class ServiceTypePayments {
  int? autoId;
  String? sId;
  String? type;
  String? name;
  String? nameLang;
  String? sortOrder;
  String? isThirdParty;
  String? commission;
  String? businessId;

  ServiceTypePayments(
      {this.autoId,
        this.sId,
        this.type,
        this.name,
        this.nameLang,
        this.sortOrder,
        this.isThirdParty,
        this.commission,
        this.businessId});

  ServiceTypePayments.fromJson(Map<String, dynamic> json) {
    autoId = json['auto_id'];
    sId = json['_id'];
    type = json['type'];
    name = json['name'];
    nameLang = json['name_lang'];
    sortOrder = json['sort_order'];
    isThirdParty = json['is_third_party'];
    commission = json['commission'];
    businessId = json['business_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['auto_id'] = this.autoId;
    data['_id'] = this.sId;
    data['type'] = this.type;
    data['name'] = this.name;
    data['name_lang'] = this.nameLang;
    data['sort_order'] = this.sortOrder;
    data['is_third_party'] = this.isThirdParty;
    data['commission'] = this.commission;
    data['business_id'] = this.businessId;
    return data;
  }
}
