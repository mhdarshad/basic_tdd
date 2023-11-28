class Addons {
  int? id;
  String? sId;
  String? name;
  String? nameLang;
  String? parentId;
  String? rate;

  Addons(
      {this.id, this.sId, this.name, this.nameLang, this.parentId, this.rate});

  Addons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sId = json['_id'];
    name = json['name'];
    nameLang = json['name_lang'];
    parentId = json['parent_id'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['name_lang'] = this.nameLang;
    data['parent_id'] = this.parentId;
    data['rate'] = this.rate;
    return data;
  }
}
