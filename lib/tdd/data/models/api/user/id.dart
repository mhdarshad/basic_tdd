

class Id {
  Id({
    required this.$oid,
  });
  late final String $oid;

  Id.fromJson(Map<String, dynamic> json){
    $oid = json['oid'] ??'';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['oid'] = $oid;
    return _data;
  }
}