
import 'package:asspa/core/util/presentation/constants/ic_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/cripto_algo.dart';
import '../../../../injection_container.dart';

class UserData {
  int? status;
  List<UsersData>? data;
  Pagination? pagination;
  UserData({this.status, this.data});

  UserData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <UsersData>[];
      json['data'].forEach((v) {
        data!.add(new UsersData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
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
    data['tocken'] = this.tocken?? Cripto().decript(sl<SharedPreferences>().getString(SFkeys.token)!);
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
  String? refid;
  String? email;
  String? acountno;
  Null? emailVerifiedAt;
  String? accountstatus;
  String? createdAt;
  String? updatedAt;
  String? kys_status;

  User(
      {this.id,
        this.fname,
        this.lname,
        this.uid,
        this.ftocken,
        this.phone,
        this.refid,
        this.email,
        this.acountno,
        this.emailVerifiedAt,
        this.accountstatus,
        this.createdAt,
        this.kys_status,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fname = json['fname'];
    lname = json['lname'];
    uid = json['uid'];
    ftocken = json['ftocken'];
    phone = json['phone'];
    refid = json['refid'];
    email = json['email'];
    acountno = json['acountno'].toString();
    emailVerifiedAt = json['email_verified_at'];
    accountstatus = json['accountstatus'];
    createdAt = json['created_at'];
    kys_status = json['kyc'].toString();
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
    data['refid'] = this.refid;
    data['email'] = this.email;
    data['acountno'] = this.acountno;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['accountstatus'] = this.accountstatus;
    data['created_at'] = this.createdAt;
    data['kyc'] = this.kys_status;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}



class Wallet {
  String? genw;//general
  String? genwstatus;//general status
  String? afw;//autofill
  String? afwstatus;//autofill status
  String? iw;//income
  String? iwstatus;//income status
  String? ref;//reference
  String? refstatus;//reference status
  String? rw;//Royalty
  String? rwstatus;//Royalty status

  Wallet(
      {this.genw,
        this.genwstatus,
        this.afw,
        this.afwstatus,
        this.iw,
        this.iwstatus,
        this.ref,
        this.rw,
        this.rwstatus,
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
    refstatus = json['rw'];
    refstatus = json['rwstatus'];
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
    data['rw'] = this.rw;
    data['rwstatus'] = this.rwstatus;
    return data;
  }
}

class Pagination {
  int? currentPage;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Pagination(
      {this.currentPage,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  Pagination.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}