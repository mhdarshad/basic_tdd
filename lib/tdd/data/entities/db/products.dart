class Products {
  int? id;
  String? sId;
  String? name;
  String? nameLang;
  String? categorySelected;
  String? itemType;
  Null? sku;
  String? baseUnit;
  String? baseUnitName;
  String? businessId;
  Null? printerId;
  Null? subgroupStatus;
  Null? comboType;
  Null? isHalfHalf;

  Products(
      {this.id,
        this.sId,
        this.name,
        this.nameLang,
        this.categorySelected,
        this.itemType,
        this.sku,
        this.baseUnit,
        this.baseUnitName,
        this.businessId,
        this.printerId,
        this.subgroupStatus,
        this.comboType,
        this.isHalfHalf});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sId = json['_id'];
    name = json['name'];
    nameLang = json['name_lang'];
    categorySelected = json['category_selected'];
    itemType = json['item_type'];
    sku = json['sku'];
    baseUnit = json['base_unit'];
    baseUnitName = json['base_unitName'];
    businessId = json['business_id'];
    printerId = json['printer_id'];
    subgroupStatus = json['subgroup_status'];
    comboType = json['combo_type'];
    isHalfHalf = json['is_half_half'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['name_lang'] = this.nameLang;
    data['category_selected'] = this.categorySelected;
    data['item_type'] = this.itemType;
    data['sku'] = this.sku;
    data['base_unit'] = this.baseUnit;
    data['base_unitName'] = this.baseUnitName;
    data['business_id'] = this.businessId;
    data['printer_id'] = this.printerId;
    data['subgroup_status'] = this.subgroupStatus;
    data['combo_type'] = this.comboType;
    data['is_half_half'] = this.isHalfHalf;
    return data;
  }
}
