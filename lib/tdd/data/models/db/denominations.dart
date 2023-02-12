class Denominations {
  int? autoId;
  String? sId;
  String? name;
  double? value;

  Denominations({this.autoId, this.sId, this.name, this.value});

  Denominations.fromJson(Map<String, dynamic> json) {
    autoId = json['autoId'];
    sId = json['_id'];
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['autoId'] = this.autoId;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}
