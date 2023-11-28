class CartHead {
  int? autoId;
  String? total;
  String? tax;
  String? orderTime;
  String? userId;
  String? userName;
  String? status;
  String? serviceType;
  String? serviceTypeId;
  String? serviceTypeName;
  String? locationId;
  String? tableId;
  String? tableName;
  String? discountAmt;
  String? discountPercentage;
  int? sync;
  String? uId;
  int? businessDateId;
  String? customerId;
  String? customerName;
  String? gross;
  String? deliveryId;
  String? deliveryName;
  String? customerAddress;
  String? updatedAt;
  String? type;
  String? mongoId;
  String? referenceNumber;
  String? formatedRef;
  String? formType;
  String? dayId;
  String? tillId;
  int? kotRef;
  String? invRef;
  String? bussinessDate;
  String? discountUserId;
  String? discountUserName;
  String? invoicingTime;
  String? discountType;
  int? enteredDiscountAmt;
  String? saleReturnRef;

  CartHead(
      {this.autoId,
        this.total,
        this.tax,
        this.orderTime,
        this.userId,
        this.userName,
        this.status,
        this.serviceType,
        this.serviceTypeId,
        this.serviceTypeName,
        this.locationId,
        this.tableId,
        this.tableName,
        this.discountAmt,
        this.discountPercentage,
        this.sync,
        this.uId,
        this.businessDateId,
        this.customerId,
        this.customerName,
        this.gross,
        this.deliveryId,
        this.deliveryName,
        this.customerAddress,
        this.updatedAt,
        this.type,
        this.mongoId,
        this.referenceNumber,
        this.formatedRef,
        this.formType,
        this.dayId,
        this.tillId,
        this.kotRef,
        this.invRef,
        this.bussinessDate,
        this.discountUserId,
        this.discountUserName,
        this.invoicingTime,
        this.discountType,
        this.enteredDiscountAmt,
        this.saleReturnRef});

  CartHead.fromJson(Map<String, dynamic> json) {
    autoId = json['auto_id'];
    total = json['total'];
    tax = json['tax'];
    orderTime = json['orderTime'];
    userId = json['userId'];
    userName = json['userName'];
    status = json['status'];
    serviceType = json['serviceType'];
    serviceTypeId = json['serviceTypeId'];
    serviceTypeName = json['serviceTypeName'];
    locationId = json['locationId'];
    tableId = json['table_id'];
    tableName = json['table_name'];
    discountAmt = json['discountAmt'];
    discountPercentage = json['discountPercentage'];
    sync = json['sync'];
    uId = json['uId'];
    businessDateId = json['business_date_id'];
    customerId = json['customer_id'];
    customerName = json['customer_name'];
    gross = json['gross'];
    deliveryId = json['delivery_id'];
    deliveryName = json['delivery_name'];
    customerAddress = json['customer_address'];
    updatedAt = json['updated_at'];
    type = json['type'];
    mongoId = json['mongo_id'];
    referenceNumber = json['reference_number'];
    formatedRef = json['formated_ref'];
    formType = json['form_type'];
    dayId = json['dayId'];
    tillId = json['tillId'];
    kotRef = json['kot_ref'];
    invRef = json['inv_ref'];
    bussinessDate = json['bussinessDate'];
    discountUserId = json['discount_user_id'];
    discountUserName = json['discount_user_name'];
    invoicingTime = json['invoicing_time'];
    discountType = json['discount_type'];
    enteredDiscountAmt = json['entered_discount_amt'];
    saleReturnRef = json['sale_return_ref'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['auto_id'] = this.autoId;
    data['total'] = this.total;
    data['tax'] = this.tax;
    data['orderTime'] = this.orderTime;
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['status'] = this.status;
    data['serviceType'] = this.serviceType;
    data['serviceTypeId'] = this.serviceTypeId;
    data['serviceTypeName'] = this.serviceTypeName;
    data['locationId'] = this.locationId;
    data['table_id'] = this.tableId;
    data['table_name'] = this.tableName;
    data['discountAmt'] = this.discountAmt;
    data['discountPercentage'] = this.discountPercentage;
    data['sync'] = this.sync;
    data['uId'] = this.uId;
    data['business_date_id'] = this.businessDateId;
    data['customer_id'] = this.customerId;
    data['customer_name'] = this.customerName;
    data['gross'] = this.gross;
    data['delivery_id'] = this.deliveryId;
    data['delivery_name'] = this.deliveryName;
    data['customer_address'] = this.customerAddress;
    data['updated_at'] = this.updatedAt;
    data['type'] = this.type;
    data['mongo_id'] = this.mongoId;
    data['reference_number'] = this.referenceNumber;
    data['formated_ref'] = this.formatedRef;
    data['form_type'] = this.formType;
    data['dayId'] = this.dayId;
    data['tillId'] = this.tillId;
    data['kot_ref'] = this.kotRef;
    data['inv_ref'] = this.invRef;
    data['bussinessDate'] = this.bussinessDate;
    data['discount_user_id'] = this.discountUserId;
    data['discount_user_name'] = this.discountUserName;
    data['invoicing_time'] = this.invoicingTime;
    data['discount_type'] = this.discountType;
    data['entered_discount_amt'] = this.enteredDiscountAmt;
    data['sale_return_ref'] = this.saleReturnRef;
    return data;
  }
}
