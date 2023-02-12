class Locations {
  int? id;
  String? sId;
  String? businessId;
  String? locationCode;
  String? address;
  String? altPhone;
  String? city;
  String? country;
  String? crNo;
  String? email;
  String? name;
  String? nameLang;
  String? phone;
  String? state;
  String? trn;
  String? website;
  String? voidPassword;
  String? managerPassword;

  Locations(
      {this.id,
        this.sId,
        this.businessId,
        this.locationCode,
        this.address,
        this.altPhone,
        this.city,
        this.country,
        this.crNo,
        this.email,
        this.name,
        this.nameLang,
        this.phone,
        this.state,
        this.trn,
        this.website,
        this.voidPassword,
        this.managerPassword});

  Locations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sId = json['_id'];
    businessId = json['business_id'];
    locationCode = json['location_code'];
    address = json['address'];
    altPhone = json['alt_phone'];
    city = json['city'];
    country = json['country'];
    crNo = json['cr_no'];
    email = json['email'];
    name = json['name'];
    nameLang = json['nameLang'];
    phone = json['phone'];
    state = json['state'];
    trn = json['trn'];
    website = json['website'];
    voidPassword = json['void_password'];
    managerPassword = json['manager_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['_id'] = this.sId;
    data['business_id'] = this.businessId;
    data['location_code'] = this.locationCode;
    data['address'] = this.address;
    data['alt_phone'] = this.altPhone;
    data['city'] = this.city;
    data['country'] = this.country;
    data['cr_no'] = this.crNo;
    data['email'] = this.email;
    data['name'] = this.name;
    data['nameLang'] = this.nameLang;
    data['phone'] = this.phone;
    data['state'] = this.state;
    data['trn'] = this.trn;
    data['website'] = this.website;
    data['void_password'] = this.voidPassword;
    data['manager_password'] = this.managerPassword;
    return data;
  }
}
