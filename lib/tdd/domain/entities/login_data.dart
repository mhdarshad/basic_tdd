class LoginDatas {
  late bool _newuser;
  late bool _active;
  late int _otp;
  late UserData? _userData = UserData();

  UserData? get userData => _userData;

  set userData(UserData? value) {
    _userData = value;
  }

  int get otp => _otp;

  set otp(int value) {
    _otp = value;
  }

  bool get newuser => _newuser;

  set newuser(bool value) {
    _newuser = value;
  }

  bool get active => _active;

  set active(bool value) {
    _active = value;
  }
}
class UserData {
  String? message;
  List<ProfileData>? data ;
  int? otp;

  UserData({ this.message,   this.data, this.otp});

  UserData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null&& json["data"] is! String) {
      data = <ProfileData>[];
      json['data'].forEach((v) {
        data?.add(ProfileData.fromJson(v));
      });
    }
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    data['otp'] = this.otp;
    return data;
  }
}

class ProfileData {
  String? id;
  String? firstname;
  String? company;
  String? mobileNo;
  String? email;
  Null? token;
  String? password;
  String? primaryAddress;
  String? country;
  String? currency;
  String? branchtype;
  String? isActive;
  String? gst;
  String? livedate;
  String? plan;
  String? domain;
  String? createdTime;
  String? city;
  String? state;
  String? note;
  String? wallet;
  List<Address>? address;
  List<VaicelData>? vehicle;

  ProfileData(
      {this.id,
        this.firstname,
        this.company,
        this.mobileNo,
        this.email,
        this.token,
        this.password,
        this.primaryAddress,
        this.country,
        this.currency,
        this.branchtype,
        this.isActive,
        this.gst,
        this.livedate,
        this.plan,
        this.domain,
        this.createdTime,
        this.city,
        this.state,
        this.note,
        this.wallet,
        this.address,
        this.vehicle});

  ProfileData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    company = json['company'];
    mobileNo = json['mobileNo'];
    email = json['email'];
    token = json['token'];
    password = json['password'];
    primaryAddress = json['primary_address'];
    country = json['country'];
    currency = json['currency'];
    branchtype = json['branchtype'];
    isActive = json['isActive'];
    gst = json['gst'];
    livedate = json['livedate'];
    plan = json['plan'];
    domain = json['domain'];
    createdTime = json['created_time'];
    city = json['city'];
    state = json['state'];
    note = json['note'];
    wallet = json['wallet'].toString();
    if (json['address'] != null) {
      address = <Address>[];
      json['address'].forEach((v) {
        address!.add(new Address.fromJson(v));
      });
    }
    if (json['vehicle'] != null) {
      vehicle = <VaicelData>[];
      json['vehicle'].forEach((v) {
        vehicle!.add(new VaicelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstname'] = this.firstname;
    data['company'] = this.company;
    data['mobileNo'] = this.mobileNo;
    data['email'] = this.email;
    data['token'] = this.token;
    data['password'] = this.password;
    data['primary_address'] = this.primaryAddress;
    data['country'] = this.country;
    data['currency'] = this.currency;
    data['branchtype'] = this.branchtype;
    data['isActive'] = this.isActive;
    data['gst'] = this.gst;
    data['livedate'] = this.livedate;
    data['plan'] = this.plan;
    data['domain'] = this.domain;
    data['created_time'] = this.createdTime;
    data['city'] = this.city;
    data['state'] = this.state;
    data['note'] = this.note;
    data['wallet'] = this.wallet;
    if (this.address != null) {
      data['address'] = this.address!.map((v) => v.toJson()).toList();
    }
    if (this.vehicle != null) {
      data['vehicle'] = this.vehicle!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Address {
  String? id;
  String? name;
  String? mobile;
  Null? pincode;
  Null? flat;
  String? area;
  String? landmark;
  String? type;
  String? user;
  String? status;
  String? createdTime;
  String? latitude;
  String? longitude;
  Null? ref;
  String? areaid;

  Address(
      {this.id,
        this.name,
        this.mobile,
        this.pincode,
        this.flat,
        this.area,
        this.landmark,
        this.type,
        this.user,
        this.status,
        this.createdTime,
        this.latitude,
        this.longitude,
        this.ref,
        this.areaid});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    pincode = json['pincode'];
    flat = json['flat'];
    area = json['area'];
    landmark = json['landmark'];
    type = json['type'];
    user = json['user'];
    status = json['status'];
    createdTime = json['created_time'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    ref = json['ref'];
    areaid = json['areaid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['pincode'] = this.pincode;
    data['flat'] = this.flat;
    data['area'] = this.area;
    data['landmark'] = this.landmark;
    data['type'] = this.type;
    data['user'] = this.user;
    data['status'] = this.status;
    data['created_time'] = this.createdTime;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['ref'] = this.ref;
    data['areaid'] = this.areaid;
    return data;
  }
}


class VaicelData {
  String? id;
  String? user;
  String? vehicleId;
  String? vehicleName;
  String? modelId;
  String? modelName;
  String? color;
  String? createdDate;
  String? status;
  String? numberPlate;

  VaicelData(
      {this.id,
        this.user,
        this.vehicleId,
        this.vehicleName,
        this.modelId,
        this.modelName,
        this.color,
        this.createdDate,
        this.status,
        this.numberPlate});

  VaicelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    vehicleId = json['vehicle_id'];
    vehicleName = json['vehicle_name'];
    modelId = json['model_id'];
    modelName = json['model_name'];
    color = json['color'];
    createdDate = json['created_date'];
    status = json['status'];
    numberPlate = json['number_plate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['vehicle_id'] = this.vehicleId;
    data['vehicle_name'] = this.vehicleName;
    data['model_id'] = this.modelId;
    data['model_name'] = this.modelName;
    data['color'] = this.color;
    data['created_date'] = this.createdDate;
    data['status'] = this.status;
    data['number_plate'] = this.numberPlate;
    return data;
  }
}
