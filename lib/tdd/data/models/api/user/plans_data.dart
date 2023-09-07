
import 'package:rising_gym/core/util/calculations/calculation.dart';

class PlanDatas {
  PlanDatas({
    this.groupName,
    required this.plans,
  });
  late final String? groupName;
  late final List<Plans> plans;

  PlanDatas.fromJson(Map<String, dynamic> json){
    groupName = json['group_name'];
    plans = List.from(json['plans']).map((e)=>Plans.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['group_name'] = groupName;
    data['plans'] = plans.map((e)=>e.toJson()).toList();
    return data;
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
    this.image,
  });
  late final String? image;
  late final String? groupName;
  late final int itemCode;
  late final String itemDescription;
  late final double itemPrice;
  late final int? durationByDay;
  late final int? noOfDays;
  late final int? noOfMonths;
  late final int itemWac;
  late final String itemVat;
  late final Null itemBarcode;
  late final int? itemStock;
  late final String? subgroupName;
  late final String? sec_item_description;
  late final int? register_trainer;

  Plans.fromJson(Map<String, dynamic> json){
    groupName = null;
    itemCode = json['item_code'];
    itemDescription = json['item_description'];
    itemPrice = json['item_price'].toString().parseDouble??0.0;
    durationByDay = json['duration_by_day'];
    noOfDays = json['no_of_days'];
    noOfMonths = json['no_of_months'];
    itemWac = json['item_wac'];
    itemVat = json['item_vat'];
    itemBarcode = null;
    itemStock = json['item_stock'];
    image = json['image'];
    sec_item_description = json['sec_item_description'];
    register_trainer = json['register_trainer'];
    subgroupName = null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['group_name'] = groupName;
    data['item_code'] = itemCode;
    data['item_description'] = itemDescription;
    data['item_price'] = itemPrice;
    data['duration_by_day'] = durationByDay;
    data['no_of_days'] = noOfDays;
    data['no_of_months'] = noOfMonths;
    data['item_wac'] = itemWac;
    data['item_vat'] = itemVat;
    data['item_barcode'] = itemBarcode;
    data['image'] = image;
    data['item_stock'] = itemStock;
    data['sec_item_description'] = sec_item_description;
    data['subgroup_name'] = subgroupName;
    data['register_trainer'] = register_trainer;
    return data;
  }
}