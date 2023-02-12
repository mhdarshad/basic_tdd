class PriceMaster {
  int? id;
  String? priceMasterProductId;
  String? priceMasterVariantId;
  String? taxId;
  String? taxName;
  String? taxRate;
  String? cost;
  String? price;
  String? status;
  String? locationId;
  String? locationName;
  String? locationCode;
  String? priceInc;
  String? taxAmount;
  String? sellingPriceGroupId;

  PriceMaster(
      {this.id,
        this.priceMasterProductId,
        this.priceMasterVariantId,
        this.taxId,
        this.taxName,
        this.taxRate,
        this.cost,
        this.price,
        this.status,
        this.locationId,
        this.locationName,
        this.locationCode,
        this.priceInc,
        this.taxAmount,
        this.sellingPriceGroupId});

  PriceMaster.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    priceMasterProductId = json['price_master_product_id'];
    priceMasterVariantId = json['price_master_variant_id'];
    taxId = json['tax_id'];
    taxName = json['tax_name'];
    taxRate = json['tax_rate'];
    cost = json['cost'];
    price = json['price'];
    status = json['status'];
    locationId = json['location_id'];
    locationName = json['location_name'];
    locationCode = json['location_code'];
    priceInc = json['price_inc'];
    taxAmount = json['tax_amount'];
    sellingPriceGroupId = json['selling_price_group_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price_master_product_id'] = this.priceMasterProductId;
    data['price_master_variant_id'] = this.priceMasterVariantId;
    data['tax_id'] = this.taxId;
    data['tax_name'] = this.taxName;
    data['tax_rate'] = this.taxRate;
    data['cost'] = this.cost;
    data['price'] = this.price;
    data['status'] = this.status;
    data['location_id'] = this.locationId;
    data['location_name'] = this.locationName;
    data['location_code'] = this.locationCode;
    data['price_inc'] = this.priceInc;
    data['tax_amount'] = this.taxAmount;
    data['selling_price_group_id'] = this.sellingPriceGroupId;
    return data;
  }
}
