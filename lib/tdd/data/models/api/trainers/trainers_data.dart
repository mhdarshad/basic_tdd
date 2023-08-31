import 'package:cloud_me_v2/core/util/calculations/calculation.dart';

class PersonalTrainerData {
  int addonItem;
  int itprRetlPrice;
  String itemDescription;
  String itemDescriptionName;
  int qty;
  String? image;
  String? email;

  PersonalTrainerData({
    required this.addonItem,
    required this.itprRetlPrice,
    required this.itemDescription,
    required this.itemDescriptionName,
    required this.qty,
     this.image,
     this.email,
  });

  factory PersonalTrainerData.fromJson(Map<String, dynamic> json) {
    return PersonalTrainerData(
      addonItem: json['addon_item'],
      itprRetlPrice: json['ITPR_RETL_PRICE'],
      itemDescription: json['item_Description'],
      itemDescriptionName: json['item_desc_name']??'',
      qty: json['qty'].toString().parseInt??0,
      image: json['image'],
      email: json['trainer_mail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'addon_item': addonItem,
      'ITPR_RETL_PRICE': itprRetlPrice,
      'item_Description': itemDescription,
      'item_desc_name': itemDescriptionName,
      'qty': qty,
      'image': image,
      'email': email,
    };
  }
}