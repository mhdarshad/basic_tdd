
class Setting {
  bool? tax;
  bool? assemblyByInvoice;
  int? productSearchListLimit;
  String? businessTaxMethod;
  String? existingItemAddMethodSale;
  String? existingItemAddMethodPurchase;
  bool? enableMultiCurrencyGrn;
  bool? customerEmailUnique;
  bool? customerPhoneUnique;

  Setting(
      {this.tax,
        this.assemblyByInvoice,
        this.productSearchListLimit,
        this.businessTaxMethod,
        this.existingItemAddMethodSale,
        this.existingItemAddMethodPurchase,
        this.enableMultiCurrencyGrn,
        this.customerEmailUnique,
        this.customerPhoneUnique});

  Setting.fromJson(Map<String, dynamic> json) {
    tax = json['tax'];
    assemblyByInvoice = json['assembly_by_invoice'];
    productSearchListLimit = json['product_search_list_limit'];
    businessTaxMethod = json['business_tax_method'];
    existingItemAddMethodSale = json['existing_item_add_method_sale'];
    existingItemAddMethodPurchase = json['existing_item_add_method_purchase'];
    enableMultiCurrencyGrn = json['enable_multi_currency_grn'];
    customerEmailUnique = json['customer_email_unique'];
    customerPhoneUnique = json['customer_phone_unique'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tax'] = this.tax;
    data['assembly_by_invoice'] = this.assemblyByInvoice;
    data['product_search_list_limit'] = this.productSearchListLimit;
    data['business_tax_method'] = this.businessTaxMethod;
    data['existing_item_add_method_sale'] = this.existingItemAddMethodSale;
    data['existing_item_add_method_purchase'] =
        this.existingItemAddMethodPurchase;
    data['enable_multi_currency_grn'] = this.enableMultiCurrencyGrn;
    data['customer_email_unique'] = this.customerEmailUnique;
    data['customer_phone_unique'] = this.customerPhoneUnique;
    return data;
  }
}