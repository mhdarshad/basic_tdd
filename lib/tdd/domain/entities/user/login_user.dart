
class UserData {
  int? status;
  List<UsersData>? data;

  UserData({this.status, this.data});

  UserData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <UsersData>[];
      json['data'].forEach((v) {
        data!.add(new UsersData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UsersData {
  User? user;
  Wallet? wallet;
  String? tocken;
  UsersData({this.user, this.wallet, this.tocken});

  UsersData.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    wallet =
    json['wallet'] != null ? new Wallet.fromJson(json['wallet']) : null;
    tocken = json['tocken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.wallet != null) {
      data['wallet'] = this.wallet!.toJson();
    }
    data['tocken'] = this.tocken;
    return data;
  }
}

class User {
  int? id;
  String? fname;
  String? lname;
  String? uid;
  String? ftocken;
  String? phone;
  String? email;
  String? acountno;
  Null? emailVerifiedAt;
  String? accountstatus;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.fname,
        this.lname,
        this.uid,
        this.ftocken,
        this.phone,
        this.email,
        this.acountno,
        this.emailVerifiedAt,
        this.accountstatus,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fname = json['fname'];
    lname = json['lname'];
    uid = json['uid'];
    ftocken = json['ftocken'];
    phone = json['phone'];
    email = json['email'];
    acountno = json['acountno'];
    emailVerifiedAt = json['email_verified_at'];
    accountstatus = json['accountstatus'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['uid'] = this.uid;
    data['ftocken'] = this.ftocken;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['acountno'] = this.acountno;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['accountstatus'] = this.accountstatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}


class Wallet {
  String? genw;
  String? genwstatus;
  String? afw;
  String? afwstatus;
  String? iw;
  String? iwstatus;
  String? ref;
  String? refstatus;

  Wallet(
      {this.genw,
        this.genwstatus,
        this.afw,
        this.afwstatus,
        this.iw,
        this.iwstatus,
        this.ref,
        this.refstatus});

  Wallet.fromJson(Map<String, dynamic> json) {
    genw = json['genw'];
    genwstatus = json['genwstatus'];
    afw = json['afw'];
    afwstatus = json['afwstatus'];
    iw = json['iw'];
    iwstatus = json['iwstatus'];
    ref = json['ref'];
    refstatus = json['refstatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['genw'] = this.genw;
    data['genwstatus'] = this.genwstatus;
    data['afw'] = this.afw;
    data['afwstatus'] = this.afwstatus;
    data['iw'] = this.iw;
    data['iwstatus'] = this.iwstatus;
    data['ref'] = this.ref;
    data['refstatus'] = this.refstatus;
    return data;
  }
}
