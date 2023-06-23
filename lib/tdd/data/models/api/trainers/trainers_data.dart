class PersonalTrainerData {
  int addonItem;
  int itprRetlPrice;
  String itemDescription;
  int qty;

  PersonalTrainerData({
    required this.addonItem,
    required this.itprRetlPrice,
    required this.itemDescription,
    required this.qty,
  });

  factory PersonalTrainerData.fromJson(Map<String, dynamic> json) {
    return PersonalTrainerData(
      addonItem: json['addon_item'],
      itprRetlPrice: json['ITPR_RETL_PRICE'],
      itemDescription: json['item_Description'],
      qty: json['qty'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'addon_item': addonItem,
      'ITPR_RETL_PRICE': itprRetlPrice,
      'item_Description': itemDescription,
      'qty': qty,
    };
  }
}
