class Users {

  String? name;
  String? email;
  String? role;
  int? passcode;
  String? sId;
  int? isDeliverer;

  Users(
      {
        this.name,
        this.email,
        this.role,
        this.passcode,
        this.sId,
        this.isDeliverer});

  Users.fromJson(Map<String, dynamic> json) {

    name = json['name'];
    email = json['email'];
    role = json['role'];
    passcode = json['passcode'];
    sId = json['_id'];
    isDeliverer = json['is_deliverer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['role'] = this.role;
    data['passcode'] = this.passcode;
    data['_id'] = this.sId;
    data['is_deliverer'] = this.isDeliverer;
    return data;
  }
}
