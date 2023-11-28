// import 'package:rising_gym/core/util/calculations/calculation.dart';
// import 'package:rising_gym/tdd/data/entities/api/scdule/scedule_api.dart';
//
// import '../../db/customer.dart';
// import 'user_data.dart';
//
// class DashBoardData {
//   Customer? customer;
//   List<SubscribedPlans>? subscribedPlans;
//   List<Scedule>? schedules;
//
//   DashBoardData({this.subscribedPlans, this.schedules});
//
//   DashBoardData.fromJson(Map<String, dynamic> json) {
//     if(json['customer']!=null) {
//       customer = Customer.fromJson(json['customer']);
//     }
//     if (json['subscribed_plans'] != null) {
//       subscribedPlans = <SubscribedPlans>[];
//       json['subscribed_plans'].forEach((v) {
//         subscribedPlans!.add(SubscribedPlans.fromJson(v));
//       });
//     }
//     if (json['schedules'] != null) {
//       schedules = <Scedule>[];
//       json['schedules'].forEach((v) {
//         schedules!.add(Scedule.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['customer'] = customer;
//     if (subscribedPlans != null) {
//       data['subscribed_plans'] =
//           subscribedPlans!.map((v) => v.toJson()).toList();
//     }
//     if (schedules != null) {
//       data['schedules'] = schedules!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class SubscribedPlans {
//   int? id;
//   int? invoiceNo;
//   int? itemCode;
//   String? invoiceReturnNo;
//   int? custId;
//   String? fromDate;
//   String? toDate;
//   String? actualStartDate;
//   String? actualExpiryDate;
//   int? returnStatus;
//   int? activeStatus;
//   String? createdAt;
//   String? updatedAt;
//   int? detailSno;
//   int? sessions;
//   String? startTime;
//   String? durationTime;
//   InvoiceDetail? invoiceDetail;
//   String? image;
//
//   SubscribedPlans(
//       {this.id,
//         this.invoiceNo,
//         this.itemCode,
//         this.invoiceReturnNo,
//         this.custId,
//         this.fromDate,
//         this.toDate,
//         this.actualStartDate,
//         this.actualExpiryDate,
//         this.returnStatus,
//         this.activeStatus,
//         this.createdAt,
//         this.updatedAt,
//         this.detailSno,
//         this.sessions,
//         this.startTime,
//         this.durationTime,
//         this.image,
//         this.invoiceDetail});
//
//   SubscribedPlans.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     invoiceNo = json['invoice_no'];
//     itemCode = json['item_code'];
//     invoiceReturnNo = json['invoice_return_no'].toString();
//     custId = json['cust_id'];
//     fromDate = json['from_date'];
//     toDate = json['to_date'];
//     actualStartDate = json['actual_start_date'];
//     actualExpiryDate = json['actual_expiry_date'];
//     returnStatus = json['return_status'];
//     activeStatus = json['active_status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     detailSno = json['detail_sno'];
//     sessions = json['sessions'];
//     startTime = json['start_time'];
//     durationTime = json['duration_time'];
//     image = json['small_image'];
//     invoiceDetail = json['invoice_detail'] != null
//         ? InvoiceDetail.fromJson(json['invoice_detail'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['id'] = id;
//     data['invoice_no'] = invoiceNo;
//     data['item_code'] = itemCode;
//     data['invoice_return_no'] = invoiceReturnNo;
//     data['cust_id'] = custId;
//     data['from_date'] = fromDate;
//     data['to_date'] = toDate;
//     data['actual_start_date'] = actualStartDate;
//     data['actual_expiry_date'] = actualExpiryDate;
//     data['return_status'] = returnStatus;
//     data['active_status'] = activeStatus;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['detail_sno'] = detailSno;
//     data['sessions'] = sessions;
//     data['start_time'] = startTime;
//     data['small_image'] = image;
//     data['duration_time'] = durationTime;
//     if (invoiceDetail != null) {
//       data['invoice_detail'] = invoiceDetail!.toJson();
//     }
//     return data;
//   }
// }
//
// class InvoiceDetail {
//   int? invoiceTranNo;
//   int? invoiceNo;
//   int? invoiceItemCode;
//   String? invoiceItemDiscription;
//   int? invoiceItemQty;
//   double? invoiceItemPrice;
//   double? invoiceItemGross;
//   int? invoiceItemDisount;
//   int? invoiceItemNett;
//   int? returnQty;
//   int? travelAgentCost;
//   String? passengerName;
//   Null? route;
//   Null? pNRNo;
//   Null? travelDate;
//   Null? travelReference;
//   Null? travelCarrier;
//   Null? travelFlightClass;
//   Null? travelTime;
//   Null? travelStatus;
//   Null? travelCustId;
//   Null? travelTranDate;
//   Null? historyValue1;
//   Null? historyValue2;
//   Null? travelPassengerType;
//   Null? suppId;
//   int? invoiceItemWac;
//   Null? travelReturnDate;
//   Null? returnStatus;
//   Null? travelFare;
//   Null? travelTax;
//   Null? travelCommision;
//   Null? travelReturnClass;
//   String? salePersonId;
//   Null? invoiceBusinessDate;
//   Null? slotName;
//   Null? restItemOption;
//   Null? redeemBalance;
//   Null? saloonItemRedeemStatus;
//   Null? bookingDate;
//   Null? serialNo;
//   int? serverUpdateFlag;
//   Null? batchNo;
//   Null? itemSize;
//   String? itemMemo;
//   Null? itemSizeB;
//   Null? itemSizeL;
//   Null? itemTempQty;
//   Null? voucherValue;
//   Null? salesPerson;
//   Null? course;
//   String? addons;
//   int? sno;
//   String? invoiceItemVat;
//   String? invoiceItemVatPER;
//   String? unitpriceExvat;
//   Null? itemBarcode;
//   String? addonCode;
//   Null? auditUploadStatus;
//   Null? igstIndia;
//   Null? cgstIndia;
//   Null? sgstIndia;
//   String? deliveryDate;
//   int? stichingCharge;
//   String? discountType;
//   String? netDiscountValue;
//   String? stichingCost;
//   String? expCharge;
//   int? bookingStatus;
//   String? routeCost;
//   int? routeCostRedeemStatus;
//   int? discTypeId;
//   Null? fromLocation;
//   String? serviceCharge;
//   String? extraTax;
//   Null? taxType;
//   int? baseTime;
//   String? startTime;
//   String? endTime;
//   int? comboPid;
//   String? comboTitle;
//
//   InvoiceDetail(
//       {this.invoiceTranNo,
//         this.invoiceNo,
//         this.invoiceItemCode,
//         this.invoiceItemDiscription,
//         this.invoiceItemQty,
//         this.invoiceItemPrice,
//         this.invoiceItemGross,
//         this.invoiceItemDisount,
//         this.invoiceItemNett,
//         this.returnQty,
//         this.travelAgentCost,
//         this.passengerName,
//         this.route,
//         this.pNRNo,
//         this.travelDate,
//         this.travelReference,
//         this.travelCarrier,
//         this.travelFlightClass,
//         this.travelTime,
//         this.travelStatus,
//         this.travelCustId,
//         this.travelTranDate,
//         this.historyValue1,
//         this.historyValue2,
//         this.travelPassengerType,
//         this.suppId,
//         this.invoiceItemWac,
//         this.travelReturnDate,
//         this.returnStatus,
//         this.travelFare,
//         this.travelTax,
//         this.travelCommision,
//         this.travelReturnClass,
//         this.salePersonId,
//         this.invoiceBusinessDate,
//         this.slotName,
//         this.restItemOption,
//         this.redeemBalance,
//         this.saloonItemRedeemStatus,
//         this.bookingDate,
//         this.serialNo,
//         this.serverUpdateFlag,
//         this.batchNo,
//         this.itemSize,
//         this.itemMemo,
//         this.itemSizeB,
//         this.itemSizeL,
//         this.itemTempQty,
//         this.voucherValue,
//         this.salesPerson,
//         this.course,
//         this.addons,
//         this.sno,
//         this.invoiceItemVat,
//         this.invoiceItemVatPER,
//         this.unitpriceExvat,
//         this.itemBarcode,
//         this.addonCode,
//         this.auditUploadStatus,
//         this.igstIndia,
//         this.cgstIndia,
//         this.sgstIndia,
//         this.deliveryDate,
//         this.stichingCharge,
//         this.discountType,
//         this.netDiscountValue,
//         this.stichingCost,
//         this.expCharge,
//         this.bookingStatus,
//         this.routeCost,
//         this.routeCostRedeemStatus,
//         this.discTypeId,
//         this.fromLocation,
//         this.serviceCharge,
//         this.extraTax,
//         this.taxType,
//         this.baseTime,
//         this.startTime,
//         this.endTime,
//         this.comboPid,
//         this.comboTitle});
//
//   InvoiceDetail.fromJson(Map<String, dynamic> json) {
//     invoiceTranNo = json['Invoice_tran_no'];
//     invoiceNo = json['Invoice_no'];
//     invoiceItemCode = json['Invoice_Item_code'];
//     invoiceItemDiscription = json['Invoice_Item_discription'];
//     invoiceItemQty = json['Invoice_item_qty'];
//     invoiceItemPrice = json['Invoice_Item_price'].toString().parseDouble;
//     invoiceItemGross = json['Invoice_Item_gross'].toString().parseDouble;
//     invoiceItemDisount = json['Invoice_Item_disount'];
//     invoiceItemNett = json['Invoice_Item_nett'];
//     returnQty = json['Return_qty'];
//     travelAgentCost = json['Travel_agent_cost'];
//     passengerName = json['Passenger_name'];
//     route = json['Route'];
//     pNRNo = json['PNR_no'];
//     travelDate = json['Travel_date'];
//     travelReference = json['Travel_reference'];
//     travelCarrier = json['Travel_carrier'];
//     travelFlightClass = json['Travel_flight_class'];
//     travelTime = json['Travel_time'];
//     travelStatus = json['Travel_status'];
//     travelCustId = json['Travel_Cust_id'];
//     travelTranDate = json['Travel_tran_date'];
//     historyValue1 = json['history_value1'];
//     historyValue2 = json['history_value2'];
//     travelPassengerType = json['Travel_passenger_type'];
//     suppId = json['supp_id'];
//     invoiceItemWac = json['Invoice_item_wac'];
//     travelReturnDate = json['Travel_return_date'];
//     returnStatus = json['Return_status'];
//     travelFare = json['Travel_fare'];
//     travelTax = json['Travel_tax'];
//     travelCommision = json['Travel_commision'];
//     travelReturnClass = json['Travel_Return_class'];
//     salePersonId = json['Sale_person_id'];
//     invoiceBusinessDate = json['Invoice_business_date'];
//     slotName = json['slot_name'];
//     restItemOption = json['Rest_item_option'];
//     redeemBalance = json['redeem_balance'];
//     saloonItemRedeemStatus = json['Saloon_item_Redeem_status'];
//     bookingDate = json['booking_date'];
//     serialNo = json['Serial_no'];
//     serverUpdateFlag = json['server_update_flag'];
//     batchNo = json['BatchNo'];
//     itemSize = json['item_size'];
//     itemMemo = json['item_memo'];
//     itemSizeB = json['item_sizeB'];
//     itemSizeL = json['item_sizeL'];
//     itemTempQty = json['item_temp_qty'];
//     voucherValue = json['voucher_value'];
//     salesPerson = json['sales_person'];
//     course = json['Course'];
//     addons = json['Addons'];
//     sno = json['sno'];
//     invoiceItemVat = json['invoice_item_vat'];
//     invoiceItemVatPER = json['invoice_item_vat_PER'];
//     unitpriceExvat = json['unitpriceExvat'];
//     itemBarcode = json['item_barcode'];
//     addonCode = json['addon_code'];
//     auditUploadStatus = json['audit_upload_status'];
//     igstIndia = json['igst_india'];
//     cgstIndia = json['cgst_india'];
//     sgstIndia = json['sgst_india'];
//     deliveryDate = json['delivery_date'];
//     stichingCharge = json['stiching_charge'];
//     discountType = json['discount_type'];
//     netDiscountValue = json['net_discount_value'];
//     stichingCost = json['stiching_cost'];
//     expCharge = json['exp_charge'];
//     bookingStatus = json['booking_status'];
//     routeCost = json['route_cost'];
//     routeCostRedeemStatus = json['route_cost_redeem_status'];
//     discTypeId = json['disc_type_id'];
//     fromLocation = json['from_location'];
//     serviceCharge = json['service_charge'];
//     extraTax = json['extra_tax'];
//     taxType = json['tax_type'];
//     baseTime = json['base_time'];
//     startTime = json['start_time'];
//     endTime = json['end_time'];
//     comboPid = json['combo_pid'];
//     comboTitle = json['combo_title'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['Invoice_tran_no'] = invoiceTranNo;
//     data['Invoice_no'] = invoiceNo;
//     data['Invoice_Item_code'] = invoiceItemCode;
//     data['Invoice_Item_discription'] = invoiceItemDiscription;
//     data['Invoice_item_qty'] = invoiceItemQty;
//     data['Invoice_Item_price'] = invoiceItemPrice;
//     data['Invoice_Item_gross'] = invoiceItemGross;
//     data['Invoice_Item_disount'] = invoiceItemDisount;
//     data['Invoice_Item_nett'] = invoiceItemNett;
//     data['Return_qty'] = returnQty;
//     data['Travel_agent_cost'] = travelAgentCost;
//     data['Passenger_name'] = passengerName;
//     data['Route'] = route;
//     data['PNR_no'] = pNRNo;
//     data['Travel_date'] = travelDate;
//     data['Travel_reference'] = travelReference;
//     data['Travel_carrier'] = travelCarrier;
//     data['Travel_flight_class'] = travelFlightClass;
//     data['Travel_time'] = travelTime;
//     data['Travel_status'] = travelStatus;
//     data['Travel_Cust_id'] = travelCustId;
//     data['Travel_tran_date'] = travelTranDate;
//     data['history_value1'] = historyValue1;
//     data['history_value2'] = historyValue2;
//     data['Travel_passenger_type'] = travelPassengerType;
//     data['supp_id'] = suppId;
//     data['Invoice_item_wac'] = invoiceItemWac;
//     data['Travel_return_date'] = travelReturnDate;
//     data['Return_status'] = returnStatus;
//     data['Travel_fare'] = travelFare;
//     data['Travel_tax'] = travelTax;
//     data['Travel_commision'] = travelCommision;
//     data['Travel_Return_class'] = travelReturnClass;
//     data['Sale_person_id'] = salePersonId;
//     data['Invoice_business_date'] = invoiceBusinessDate;
//     data['slot_name'] = slotName;
//     data['Rest_item_option'] = restItemOption;
//     data['redeem_balance'] = redeemBalance;
//     data['Saloon_item_Redeem_status'] = saloonItemRedeemStatus;
//     data['booking_date'] = bookingDate;
//     data['Serial_no'] = serialNo;
//     data['server_update_flag'] = serverUpdateFlag;
//     data['BatchNo'] = batchNo;
//     data['item_size'] = itemSize;
//     data['item_memo'] = itemMemo;
//     data['item_sizeB'] = itemSizeB;
//     data['item_sizeL'] = itemSizeL;
//     data['item_temp_qty'] = itemTempQty;
//     data['voucher_value'] = voucherValue;
//     data['sales_person'] = salesPerson;
//     data['Course'] = course;
//     data['Addons'] = addons;
//     data['sno'] = sno;
//     data['invoice_item_vat'] = invoiceItemVat;
//     data['invoice_item_vat_PER'] = invoiceItemVatPER;
//     data['unitpriceExvat'] = unitpriceExvat;
//     data['item_barcode'] = itemBarcode;
//     data['addon_code'] = addonCode;
//     data['audit_upload_status'] = auditUploadStatus;
//     data['igst_india'] = igstIndia;
//     data['cgst_india'] = cgstIndia;
//     data['sgst_india'] = sgstIndia;
//     data['delivery_date'] = deliveryDate;
//     data['stiching_charge'] = stichingCharge;
//     data['discount_type'] = discountType;
//     data['net_discount_value'] = netDiscountValue;
//     data['stiching_cost'] = stichingCost;
//     data['exp_charge'] = expCharge;
//     data['booking_status'] = bookingStatus;
//     data['route_cost'] = routeCost;
//     data['route_cost_redeem_status'] = routeCostRedeemStatus;
//     data['disc_type_id'] = discTypeId;
//     data['from_location'] = fromLocation;
//     data['service_charge'] = serviceCharge;
//     data['extra_tax'] = extraTax;
//     data['tax_type'] = taxType;
//     data['base_time'] = baseTime;
//     data['start_time'] = startTime;
//     data['end_time'] = endTime;
//     data['combo_pid'] = comboPid;
//     data['combo_title'] = comboTitle;
//     return data;
//   }
// }
