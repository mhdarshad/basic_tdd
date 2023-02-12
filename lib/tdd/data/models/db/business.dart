class Business {
  String? token;
  String? sId;
  String? name;
  String? timezone;
  String? currencyId;
  int? decimalPoint;
  String? tax;
  String? currency;
  String? currencyCode;
  String? currencySymbol;
  String? logoUrl;
  String? licenseKey;
  String? invPrefix;
  int? sync;

  Business(
      {
        this.token,
        this.sId,
        this.name,
        this.timezone,
        this.currencyId,
        this.decimalPoint,
        this.tax,
        this.currency,
        this.currencyCode,
        this.currencySymbol,
        this.logoUrl,
        this.licenseKey,
        this.invPrefix,
        this.sync});

  Business.fromJson(Map<String, dynamic> json) {

    token = json['token'];
    sId = json['_id'];
    name = json['name'];
    timezone = json['timezone'];
    currencyId = json['currency_id'];
    decimalPoint = json['decimal_point'];
    tax = json['tax'];
    currency = json['currency'];
    currencyCode = json['currencyCode'];
    currencySymbol = json['currencySymbol'];
    logoUrl = json['logo_url'];
    licenseKey = json['license_key'];
    invPrefix = json['inv_prefix'];
    sync = json['sync'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['token'] = this.token;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['timezone'] = this.timezone;
    data['currency_id'] = this.currencyId;
    data['decimal_point'] = this.decimalPoint;
    data['tax'] = this.tax;
    data['currency'] = this.currency;
    data['currencyCode'] = this.currencyCode;
    data['currencySymbol'] = this.currencySymbol;
    data['logo_url'] = this.logoUrl;
    data['license_key'] = this.licenseKey;
    data['inv_prefix'] = this.invPrefix;
    data['sync'] = this.sync;
    return data;
  }
}
