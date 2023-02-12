class Users {
  Users({
    required this.id,
    required this.name,
    required this.businessId,
    required this.email,
    required this.role,
    required this.isOwner,
    required this.updatedAt,
    required this.createdAt,
    required this.roleIds,
  });
  late final String id;
  late final String name;
  late final String businessId;
  late final String email;
  late final String? role;
  late final int? isOwner;
  late final String? updatedAt;
  late final String createdAt;
  late final List<dynamic> roleIds;

  Users.fromJson(Map<String, dynamic> json){
    // print(json['role_ids']);
    // print('role..............');
    id = json['_id'];
    name = json['name'];
    businessId = json['business_id']??'';
    email = json['email'];
    role = json['role'];
    isOwner = json['is_owner'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at']??'';
    roleIds = json['role_ids']??[];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['business_id'] = businessId;
    _data['email'] = email;
    _data['role'] = role;
    _data['is_owner'] = isOwner;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    _data['role_ids'] = roleIds;
    return _data;
  }
}