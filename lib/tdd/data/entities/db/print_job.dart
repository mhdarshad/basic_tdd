class PrintJob {
  int? autoId;
  String? sId;
  String? name;
  String? event;
  String? locationCode;
  String? locationName;
  String? printerId;
  String? locationId;
  int? ignoreProducts;

  PrintJob(
      {this.autoId,
        this.sId,
        this.name,
        this.event,
        this.locationCode,
        this.locationName,
        this.printerId,
        this.locationId,
        this.ignoreProducts});

  PrintJob.fromJson(Map<String, dynamic> json) {
    autoId = json['autoId'];
    sId = json['_id'];
    name = json['name'];
    event = json['event'];
    locationCode = json['location_code'];
    locationName = json['location_name'];
    printerId = json['printer_id'];
    locationId = json['location_id'];
    ignoreProducts = json['ignore_products'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['autoId'] = this.autoId;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['event'] = this.event;
    data['location_code'] = this.locationCode;
    data['location_name'] = this.locationName;
    data['printer_id'] = this.printerId;
    data['location_id'] = this.locationId;
    data['ignore_products'] = this.ignoreProducts;
    return data;
  }
}
