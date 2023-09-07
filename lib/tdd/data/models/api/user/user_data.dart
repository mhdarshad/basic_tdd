// class UserAcsessData {
//   UserAcsessData({
//     required this.status,
//     required this.msg,
//     required this.data,
//     required this.flags,
//   });
//   late final String status;
//   late final String msg;
//   late final Data data;
//   late final List<dynamic> flags;
//
//   UserAcsessData.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//     msg = json['msg'];
//     data = Data.fromJson(json['data']);
//     flags = List.castFrom<dynamic, dynamic>(json['flags']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['msg'] = msg;
//     _data['data'] = data.toJson();
//     _data['flags'] = flags;
//     return _data;
//   }
// }

class UserAcsessData {
  UserAcsessData({
    required this.customer,
    required this.customerAuth,
    required this.customerID,
  });
  Customer? customer;
  late final String? customerAuth;
  late final String? customerID;

  UserAcsessData.fromJson(Map<String, dynamic> json){
    if(json['customer']!=null) {
      customer = Customer.fromJson(json['customer']);
    }
    customerAuth = json['customer_auth'];
    customerID = json['customer_id'].toString();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['customer'] = customer?.toJson();
    _data['customer_auth'] = customerAuth;
    _data['customer_id'] = customerID.toString();
    return _data;
  }
}

class Customer {
  String? memCode;
  String? custName;
  String? custLastName;
  String? custGender;
  int? custId;
  int? id;
  String? custMob;
  String? custAdd1;
  String? email;
  String? custNationality;
  String? custState;
  String? dateOfBrith;
  String? company;
  String? custCountry;
  String? custImage;
  String? emiratesId;
  String? custEmergencyName;
  String? custEmergencyRelation;
  String? custEmergencyNumber;
  String? custEmergencyAddress;
  String? remarks;

  Customer(
      {this.memCode,
        this.custName,
        this.custLastName,
        this.custGender,
        this.custId,
        this.custMob,
        this.custAdd1,
        this.email,
        this.custNationality,
        this.custState,
        this.dateOfBrith,
        this.company,
        this.custCountry,
        this.custImage,
        this.emiratesId,
        this.custEmergencyName,
        this.custEmergencyRelation,
        this.id,
        this.custEmergencyNumber,
        this.custEmergencyAddress,
        this.remarks});

  Customer.fromJson(Map<String, dynamic> json) {
    memCode = json['mem_code'];
    id = json['id'];
    custName = json['cust_name'];
    custLastName = json['cust_last_name'];
    custGender = json['cust_gender'];
    custId = json['cust_id'];
    custMob = json['cust_mob'];
    custAdd1 = json['cust_add1'];
    email = json['email'];
    custNationality = json['cust_nationality'];
    custState = json['cust_state'];
    dateOfBrith = json['Date_of_brith'];
    company = json['Company'];
    custCountry = json['cust_country'];
    custImage = json['cust_image'];
    emiratesId = json['emirates_id'];
    custEmergencyName = json['cust_emergency_name'];
    custEmergencyRelation = json['cust_emergency_relation'];
    custEmergencyNumber = json['cust_emergency_number'];
    custEmergencyAddress = json['cust_emergency_address'];
    remarks = json['remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mem_code'] = this.memCode;
    data['id'] = this.id;
    data['cust_name'] = this.custName;
    data['cust_last_name'] = this.custLastName;
    data['cust_gender'] = this.custGender;
    data['cust_id'] = this.custId;
    data['cust_mob'] = this.custMob;
    data['cust_add1'] = this.custAdd1;
    data['email'] = this.email;
    data['cust_nationality'] = this.custNationality;
    data['cust_state'] = this.custState;
    data['Date_of_brith'] = this.dateOfBrith;
    data['Company'] = this.company;
    data['cust_country'] = this.custCountry;
    data['cust_image'] = this.custImage;
    data['emirates_id'] = this.emiratesId;
    data['cust_emergency_name'] = this.custEmergencyName;
    data['cust_emergency_relation'] = this.custEmergencyRelation;
    data['cust_emergency_number'] = this.custEmergencyNumber;
    data['cust_emergency_address'] = this.custEmergencyAddress;
    data['remarks'] = this.remarks;
    return data;
  }
}