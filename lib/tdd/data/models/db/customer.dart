class Customer {
  int? autoId;
  String? sId;
  String? name;
  String? trn;
  String? email;
  String? phone;
  String? contactId;
  String? lastName;
  String? landLine;
  int? sync;
  int? isDefault;
  String? serviceRouteId;
  String? serviceRouteName;
  String? serviceRouteEmirate;

  Customer(
      {this.autoId,
        this.sId,
        this.name,
        this.trn,
        this.email,
        this.phone,
        this.contactId,
        this.lastName,
        this.landLine,
        this.sync,
        this.isDefault,
        this.serviceRouteId,
        this.serviceRouteName,
        this.serviceRouteEmirate});

  Customer.fromJson(Map<String, dynamic> json) {
    autoId = json['auto_id'];
    sId = json['_id'];
    name = json['name'];
    trn = json['trn'];
    email = json['email'];
    phone = json['phone'];
    contactId = json['contact_id'];
    lastName = json['last_name'];
    landLine = json['land_line'];
    sync = json['sync'];
    isDefault = json['is_default'];
    serviceRouteId = json['service_route_id'];
    serviceRouteName = json['service_route_name'];
    serviceRouteEmirate = json['service_route_emirate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['auto_id'] = this.autoId;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['trn'] = this.trn;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['contact_id'] = this.contactId;
    data['last_name'] = this.lastName;
    data['land_line'] = this.landLine;
    data['sync'] = this.sync;
    data['is_default'] = this.isDefault;
    data['service_route_id'] = this.serviceRouteId;
    data['service_route_name'] = this.serviceRouteName;
    data['service_route_emirate'] = this.serviceRouteEmirate;
    return data;
  }
}
