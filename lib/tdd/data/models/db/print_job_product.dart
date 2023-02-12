class PrintJobProduct {
  int? autoId;
  String? jobId;
  String? productIds;

  PrintJobProduct({this.autoId, this.jobId, this.productIds});

  PrintJobProduct.fromJson(Map<String, dynamic> json) {
    autoId = json['autoId'];
    jobId = json['job_id'];
    productIds = json['product_ids'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['autoId'] = this.autoId;
    data['job_id'] = this.jobId;
    data['product_ids'] = this.productIds;
    return data;
  }
}
