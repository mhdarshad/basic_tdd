class Variants {
  int? id;
  String? variantProductId;
  String? sId;
  String? vName;
  String? vSku;
  String? photo;
  String? vIds;
  String? isDefault;
  String? isHalfHalf;

  Variants(
      {this.id,
        this.variantProductId,
        this.sId,
        this.vName,
        this.vSku,
        this.photo,
        this.vIds,
        this.isDefault,
        this.isHalfHalf});

  Variants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    variantProductId = json['variant_product_id'];
    sId = json['_id'];
    vName = json['v_name'];
    vSku = json['v_sku'];
    photo = json['photo'];
    vIds = json['v_ids'];
    isDefault = json['is_default'];
    isHalfHalf = json['is_half_half'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['variant_product_id'] = this.variantProductId;
    data['_id'] = this.sId;
    data['v_name'] = this.vName;
    data['v_sku'] = this.vSku;
    data['photo'] = this.photo;
    data['v_ids'] = this.vIds;
    data['is_default'] = this.isDefault;
    data['is_half_half'] = this.isHalfHalf;
    return data;
  }
}
