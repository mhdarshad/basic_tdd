
class PlanDatas {
  PlanDatas({
    this.groupName,
    required this.plans,
  });
  late final String? groupName;
  late final List<Plans> plans;

  PlanDatas.fromJson(Map<String, dynamic> json){
    groupName = null;
    plans = List.from(json['plans']).map((e)=>Plans.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['group_name'] = groupName;
    _data['plans'] = plans.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Plans {
  Plans({
    this.groupName,
    required this.itemCode,
    required this.itemDescription,
    required this.itemPrice,
    this.durationByDay,
    this.noOfDays,
    this.noOfMonths,
    required this.itemWac,
    required this.itemVat,
    this.itemBarcode,
    required this.itemStock,
    this.subgroupName,
  });
  late final String? groupName;
  late final int itemCode;
  late final String itemDescription;
  late final int itemPrice;
  late final int? durationByDay;
  late final int? noOfDays;
  late final int? noOfMonths;
  late final int itemWac;
  late final String itemVat;
  late final Null itemBarcode;
  late final int itemStock;
  late final String? subgroupName;

  Plans.fromJson(Map<String, dynamic> json){
    groupName = null;
    itemCode = json['item_code'];
    itemDescription = json['item_description'];
    itemPrice = json['item_price'];
    durationByDay = null;
    noOfDays = null;
    noOfMonths = null;
    itemWac = json['item_wac'];
    itemVat = json['item_vat'];
    itemBarcode = null;
    itemStock = json['item_stock'];
    subgroupName = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['group_name'] = groupName;
    _data['item_code'] = itemCode;
    _data['item_description'] = itemDescription;
    _data['item_price'] = itemPrice;
    _data['duration_by_day'] = durationByDay;
    _data['no_of_days'] = noOfDays;
    _data['no_of_months'] = noOfMonths;
    _data['item_wac'] = itemWac;
    _data['item_vat'] = itemVat;
    _data['item_barcode'] = itemBarcode;
    _data['item_stock'] = itemStock;
    _data['subgroup_name'] = subgroupName;
    return _data;
  }
}