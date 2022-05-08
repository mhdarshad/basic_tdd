class WalletModle {
  int? status;
  String? message;
  List<WalletData>? data;
  int? otp;

  WalletModle({this.status, this.message, this.data, this.otp});

  WalletModle.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <WalletData>[];
      json['data'].forEach((v) {
        data!.add(new WalletData.fromJson(v));
      });
    }
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['otp'] = this.otp;
    return data;
  }
}

class WalletData {
  String? id;
  String? user;
  String? balance;
  List<Logs>? logs;

  WalletData({this.id, this.user, this.balance, this.logs});

  WalletData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    balance = json['balance'];
    if (json['logs'] != null) {
      logs = <Logs>[];
      json['logs'].forEach((v) {
        logs!.add(new Logs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['balance'] = this.balance;
    if (this.logs != null) {
      data['logs'] = this.logs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Logs {
  String? id;
  String? ref;
  String? credit;
  String? debit;
  String? date;
  String? balance;
  String? note;
  String? type;
  String? status;
  String? dateTime;
  String? mode;
  String? customerD;

  Logs(
      {this.id,
        this.ref,
        this.credit,
        this.debit,
        this.date,
        this.balance,
        this.note,
        this.type,
        this.status,
        this.dateTime,
        this.mode,
        this.customerD});

  Logs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ref = json['ref'];
    credit = json['credit'];
    debit = json['debit'];
    date = json['date'];
    balance = json['balance'];
    note = json['note'];
    type = json['type'];
    status = json['status'];
    dateTime = json['dateTime'];
    mode = json['mode'];
    customerD = json['customer_d'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ref'] = this.ref;
    data['credit'] = this.credit;
    data['debit'] = this.debit;
    data['date'] = this.date;
    data['balance'] = this.balance;
    data['note'] = this.note;
    data['type'] = this.type;
    data['status'] = this.status;
    data['dateTime'] = this.dateTime;
    data['mode'] = this.mode;
    data['customer_d'] = this.customerD;
    return data;
  }
}
