class InvoiceRef {
  int? autoId;
  int? invRef;
  int? kotRef;
  int? saleReturnRef;

  InvoiceRef({this.autoId, this.invRef, this.kotRef, this.saleReturnRef});

  InvoiceRef.fromJson(Map<String, dynamic> json) {
    autoId = json['autoId'];
    invRef = json['inv_ref'];
    kotRef = json['kot_ref'];
    saleReturnRef = json['sale_return_ref'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['autoId'] = this.autoId;
    data['inv_ref'] = this.invRef;
    data['kot_ref'] = this.kotRef;
    data['sale_return_ref'] = this.saleReturnRef;
    return data;
  }
}