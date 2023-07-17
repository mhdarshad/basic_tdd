
class PlansAndTrainerData {
  List<PlanData>? plans;
  List<TrainerDetails>? trainerDetails;

  PlansAndTrainerData({this.plans, this.trainerDetails});

  PlansAndTrainerData.fromJson(Map<String, dynamic> json) {
    if (json['plans'] != null) {
      plans = <PlanData>[];
      json['plans'].forEach((v) {
        plans!.add(PlanData.fromJson(v));
      });
    }
    if (json['trainer_details'] != null) {
      trainerDetails = <TrainerDetails>[];
      json['trainer_details'].forEach((v) {
        trainerDetails!.add(TrainerDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.plans != null) {
      data['plans'] = this.plans!.map((v) => v.toJson()).toList();
    }
    if (this.trainerDetails != null) {
      data['trainer_details'] =
          this.trainerDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlanData {
  String? groupName;
  int? itemCode;
  String? itemDescription;
  String? secItemDescription;
  int? registerTrainer;
  int? itemPrice;
  int? durationByDay;
  int? noOfDays;
  int? noOfMonths;
  int? itemWac;
  String? itemVat;
  int? itemBarcode;
  int? itemStock;
  String? subgroupName;
  int? groupId;

  PlanData(
      {this.groupName,
        this.itemCode,
        this.itemDescription,
        this.secItemDescription,
        this.registerTrainer,
        this.itemPrice,
        this.durationByDay,
        this.noOfDays,
        this.noOfMonths,
        this.itemWac,
        this.itemVat,
        this.itemBarcode,
        this.itemStock,
        this.subgroupName,
        this.groupId});

  PlanData.fromJson(Map<String, dynamic> json) {
    groupName = json['group_name'];
    itemCode = json['item_code'];
    itemDescription = json['item_description'];
    secItemDescription = json['sec_item_description'];
    registerTrainer = json['register_trainer'];
    itemPrice = json['item_price'];
    durationByDay = json['duration_by_day'];
    noOfDays = json['no_of_days'];
    noOfMonths = json['no_of_months'];
    itemWac = json['item_wac'];
    itemVat = json['item_vat'];
    itemBarcode = json['item_barcode'];
    itemStock = json['item_stock'];
    subgroupName = json['subgroup_name'];
    groupId = json['group_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['group_name'] = this.groupName;
    data['item_code'] = this.itemCode;
    data['item_description'] = this.itemDescription;
    data['sec_item_description'] = this.secItemDescription;
    data['register_trainer'] = this.registerTrainer;
    data['item_price'] = this.itemPrice;
    data['duration_by_day'] = this.durationByDay;
    data['no_of_days'] = this.noOfDays;
    data['no_of_months'] = this.noOfMonths;
    data['item_wac'] = this.itemWac;
    data['item_vat'] = this.itemVat;
    data['item_barcode'] = this.itemBarcode;
    data['item_stock'] = this.itemStock;
    data['subgroup_name'] = this.subgroupName;
    data['group_id'] = this.groupId;
    return data;
  }
}


class TrainerDetails {
  int? invoiceNo;
  int? addonItem;
  int? parentItem;
  int? qty;
  int? cost;
  Null? price;
  int? nett;
  String? updatedAt;
  int? trCode;
  String? trName;
  var image;
  var trainerMail;

  TrainerDetails(
      {this.invoiceNo,
        this.addonItem,
        this.parentItem,
        this.qty,
        this.cost,
        this.price,
        this.nett,
        this.updatedAt,
        this.trCode,
        this.trName});

  TrainerDetails.fromJson(Map<String, dynamic> json) {
    invoiceNo = json['invoice_no'];
    addonItem = json['addon_item'];
    parentItem = json['parent_item'];
    qty = json['qty'];
    cost = json['cost'];
    price = json['price'];
    nett = json['nett'];
    updatedAt = json['updated_at'];
    trCode = json['tr_code'];
    trName = json['tr_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invoice_no'] = this.invoiceNo;
    data['addon_item'] = this.addonItem;
    data['parent_item'] = this.parentItem;
    data['qty'] = this.qty;
    data['cost'] = this.cost;
    data['price'] = this.price;
    data['nett'] = this.nett;
    data['updated_at'] = this.updatedAt;
    data['tr_code'] = this.trCode;
    data['tr_name'] = this.trName;
    return data;
  }
}

