class PaymentTransactionModel {
  String? tId;
  String? tAmt;
  String? tType;
  String? sender;
  String? reciver;
  String? wallet;
  String? updatedAt;
  String? createdAt;
  int? id;

  PaymentTransactionModel(
      {this.tId,
        this.tAmt,
        this.tType,
        this.sender,
        this.reciver,
        this.wallet,
        this.updatedAt,
        this.createdAt,
        this.id});

  PaymentTransactionModel.fromJson(Map<String, dynamic> json) {
    tId = json['t_id'];
    tAmt = json['t_amt'];
    tType = json['t_type'];
    sender = json['sender'];
    reciver = json['reciver'];
    wallet = json['wallet'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['t_id'] = this.tId;
    data['t_amt'] = this.tAmt;
    data['t_type'] = this.tType;
    data['sender'] = this.sender;
    data['reciver'] = this.reciver;
    data['wallet'] = this.wallet;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
