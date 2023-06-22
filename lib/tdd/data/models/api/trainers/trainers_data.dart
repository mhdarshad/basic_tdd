class TranersList {
  TranersList({
    required this.personalTrainers,
  });
  late final List<PersonalTrainers> personalTrainers;

  TranersList.fromJson(Map<String, dynamic> json){
    personalTrainers = List.from(json['personal_trainers']).map((e)=>PersonalTrainers.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['personal_trainers'] = personalTrainers.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class PersonalTrainers {
  PersonalTrainers({
    required this.ItemCode,
    required this.itemDescription,
  });
  late final int ItemCode;
  late final String itemDescription;

  PersonalTrainers.fromJson(Map<String, dynamic> json){
    ItemCode = json['Item_code'];
    itemDescription = json['item_Description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Item_code'] = ItemCode;
    _data['item_Description'] = itemDescription;
    return _data;
  }
}