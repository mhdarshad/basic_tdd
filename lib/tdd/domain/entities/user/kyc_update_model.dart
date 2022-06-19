class KycUpdateModel {
  String? uid;
  String? holderName;
  String? branchName;
  String? panCard;
  String? address;
  String? bankName;
  String? ifsc;
  String? updatedAt;
  String? createdAt;
  String? accountNumber;
  bool? status;
  int? id;

  KycUpdateModel(
      {this.uid,
        this.holderName,
        this.branchName,
        this.panCard,
        this.address,
        this.bankName,
        this.ifsc,
        this.updatedAt,
        this.createdAt,
        this.accountNumber,
        this.status,
        this.id});

  KycUpdateModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    holderName = json['holder_name'];
    branchName = json['branch_name'];
    panCard = json['pan_card'];
    address = json['address'];
    bankName = json['bank_name'];
    ifsc = json['ifsc'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    accountNumber = json['account_number'];
    status = (json['status']??'0').toString()=='1';
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['holder_name'] = this.holderName;
    data['branch_name'] = this.branchName;
    data['pan_card'] = this.panCard;
    data['address'] = this.address;
    data['bank_name'] = this.bankName;
    data['ifsc'] = this.ifsc;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['account_number'] = this.accountNumber;
    data['status'] =( this.status??false)?'1':'0';
    data['id'] = this.id;
    return data;
  }
}