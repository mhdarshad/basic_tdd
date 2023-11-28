class ServiceTypePayments {
  int? autoId;
  String? serviceTypeId;
  String? paymentTypeId;

  ServiceTypePayments({this.autoId, this.serviceTypeId, this.paymentTypeId});

  ServiceTypePayments.fromJson(Map<String, dynamic> json) {
    autoId = json['autoId'];
    serviceTypeId = json['serviceTypeId'];
    paymentTypeId = json['paymentTypeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['autoId'] = this.autoId;
    data['serviceTypeId'] = this.serviceTypeId;
    data['paymentTypeId'] = this.paymentTypeId;
    return data;
  }
}
