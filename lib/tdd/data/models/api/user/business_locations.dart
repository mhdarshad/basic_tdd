
class BusinessLocations {
  BusinessLocations({
    required this.id,
    required this.businessId,
    required this.locationCode,
    required this.updatedAt,
    required this.createdAt,
    required this.address,
    this.altPhone,
    required this.city,
    required this.country,
    this.crNo,
    this.email,
    required this.name,
    required this.nameLang,
    required this.phone,
    required this.state,
    required this.trn,
    this.website,
    required this.invoiceLayoutId,
    required this.voidPassword,
    required this.managerPassword,
  });
  late final String id;
  late final String businessId;
  late final String locationCode;
  late final String updatedAt;
  late final String createdAt;
  late final String address;
  late final Null altPhone;
  late final String city;
  late final String country;
  late final Null crNo;
  late final Null email;
  late final String name;
  late final String nameLang;
  late final String phone;
  late final String state;
  late final String trn;
  late final Null website;
  late final String invoiceLayoutId;
  late final String voidPassword;
  late final String managerPassword;

  BusinessLocations.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    businessId = json['business_id'];
    locationCode = json['location_code'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    address = json['address'] ??'';
    altPhone = null;
    city = json['city'] ??'';
    country = json['country'] ??'';
    crNo = null;
    email = null;
    name = json['name'];
    nameLang = json['name_lang'] ??'';
    phone = json['phone']??'';
    state = json['state']??'';
    trn = json['trn']??'';
    website = null;
    invoiceLayoutId = json['invoice_layout_id']??'';
    voidPassword = json['void_password']??'';
    managerPassword = json['manager_password']??'';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['business_id'] = businessId;
    _data['location_code'] = locationCode;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    _data['address'] = address;
    _data['alt_phone'] = altPhone;
    _data['city'] = city;
    _data['country'] = country;
    _data['cr_no'] = crNo;
    _data['email'] = email;
    _data['name'] = name;
    _data['name_lang'] = nameLang;
    _data['phone'] = phone;
    _data['state'] = state;
    _data['trn'] = trn;
    _data['website'] = website;
    _data['invoice_layout_id'] = invoiceLayoutId;
    _data['void_password'] = voidPassword;
    _data['manager_password'] = managerPassword;
    return _data;
  }
}