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
  });
  late final Customer customer;
  late final String customerAuth;

  UserAcsessData.fromJson(Map<String, dynamic> json){
    customer = Customer.fromJson(json['customer']);
    customerAuth = json['customer_auth'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['customer'] = customer.toJson();
    _data['customer_auth'] = customerAuth;
    return _data;
  }
}

class Customer {
  Customer({
    required this.id,
    required this.custName,
    required this.phone1,
    required this.countryCodePh1,
    required this.userName,
    required this.email,
  });
  late final int id;
  late final String custName;
  late final String phone1;
  late final String countryCodePh1;
  late final String userName;
  late final String email;

  Customer.fromJson(Map<String, dynamic> json){
    id = json['id'];
    custName = json['cust_name'];
    phone1 = json['phone1'];
    countryCodePh1 = json['country_code_ph1'];
    userName = json['user_name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['cust_name'] = custName;
    _data['phone1'] = phone1;
    _data['country_code_ph1'] = countryCodePh1;
    _data['user_name'] = userName;
    _data['email'] = email;
    return _data;
  }
}