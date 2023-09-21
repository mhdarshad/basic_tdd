
import 'package:rising_gym/core/util/calculations/calculation.dart';

import 'user_data.dart';

class DashBoardData {
  Customer? customer;
  List<SubscribedPlans>? subscribedPlans;
  List<SubscribedPlans>? currentPlans;
  int? paymentDetails;
  String? currency;
  List<Null>? paymentTableDetails;
  List<Null>? upload;
  List<Schedules>? schedules;
  List<JoinSchedule>? joinSchedule;

  DashBoardData(
      {this.customer,
        this.subscribedPlans,
        this.currentPlans,
        this.paymentDetails,
        this.currency,
        this.paymentTableDetails,
        this.upload,
        this.schedules,
        this.joinSchedule});

  DashBoardData.fromJson(Map<String, dynamic> json) {
    customer = json['customer'] != null
        ? Customer.fromJson(json['customer'])
        : null;
    if (json['subscribed_plans'] != null) {
      subscribedPlans = <SubscribedPlans>[];
      json['subscribed_plans'].forEach((v) {
        subscribedPlans!.add(SubscribedPlans.fromJson(v));
      });
    }
    if (json['current_plans'] != null) {
      currentPlans = <SubscribedPlans>[];
      json['current_plans'].forEach((v) {
        currentPlans!.add(SubscribedPlans.fromJson(v));
      });
    }
    paymentDetails = json['payment_details'];
    currency = json['currency'];
    if (json['payment_table_details'] != null) {
      paymentTableDetails = <Null>[];
      json['payment_table_details'].forEach((v) {
        // paymentTableDetails!.add(new Null.fromJson(v));
      });
    }
    if (json['upload'] != null) {
      upload = <Null>[];
      json['upload'].forEach((v) {
        // upload!.add(new Null.fromJson(v));
      });
    }
    if (json['schedules'] != null) {
      schedules = <Schedules>[];
      json['schedules'].forEach((v) {
        schedules!.add(Schedules.fromJson(v));
      });
    }
    if (json['join_schedule'] != null) {
      joinSchedule = <JoinSchedule>[];
      json['join_schedule'].forEach((v) {
        joinSchedule!.add(JoinSchedule.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (subscribedPlans != null) {
      data['subscribed_plans'] =
          subscribedPlans!.map((v) => v.toJson()).toList();
    }
    if (currentPlans != null) {
      data['current_plans'] =
          currentPlans!.map((v) => v.toJson()).toList();
    }
    data['payment_details'] = paymentDetails;
    data['currency'] = currency;
    if (paymentTableDetails != null) {
      // data['payment_table_details'] =
          // this.paymentTableDetails!.map((v) => v.toJson()).toList();
    }
    if (upload != null) {
      // data['upload'] = this.upload!.map((v) => v.toJson()).toList();
    }
    if (schedules != null) {
      data['schedules'] = schedules!.map((v) => v.toJson()).toList();
    }
    if (joinSchedule != null) {
      data['join_schedule'] =
          joinSchedule!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// class Customer {
//   String? memCode;
//   String? custName;
//   String? custLastName;
//   String? custGender;
//   int? custId;
//   String? custMob;
//   String? custAdd1;
//   String? email;
//   String? custNationality;
//   String? custState;
//   Null? dateOfBrith;
//   String? company;
//   String? custCountry;
//   String? custImage;
//   String? emiratesId;
//   String? custEmergencyName;
//   String? custEmergencyRelation;
//   String? custEmergencyNumber;
//   String? custEmergencyAddress;
//   String? remarks;
//
//   Customer(
//       {this.memCode,
//         this.custName,
//         this.custLastName,
//         this.custGender,
//         this.custId,
//         this.custMob,
//         this.custAdd1,
//         this.email,
//         this.custNationality,
//         this.custState,
//         this.dateOfBrith,
//         this.company,
//         this.custCountry,
//         this.custImage,
//         this.emiratesId,
//         this.custEmergencyName,
//         this.custEmergencyRelation,
//         this.custEmergencyNumber,
//         this.custEmergencyAddress,
//         this.remarks});
//
//   Customer.fromJson(Map<String, dynamic> json) {
//     memCode = json['mem_code'];
//     custName = json['cust_name'];
//     custLastName = json['cust_last_name'];
//     custGender = json['cust_gender'];
//     custId = json['cust_id'];
//     custMob = json['cust_mob'];
//     custAdd1 = json['cust_add1'];
//     email = json['email'];
//     custNationality = json['cust_nationality'];
//     custState = json['cust_state'];
//     dateOfBrith = json['Date_of_brith'];
//     company = json['Company'];
//     custCountry = json['cust_country'];
//     custImage = json['cust_image'];
//     emiratesId = json['emirates_id'];
//     custEmergencyName = json['cust_emergency_name'];
//     custEmergencyRelation = json['cust_emergency_relation'];
//     custEmergencyNumber = json['cust_emergency_number'];
//     custEmergencyAddress = json['cust_emergency_address'];
//     remarks = json['remarks'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['mem_code'] = this.memCode;
//     data['cust_name'] = this.custName;
//     data['cust_last_name'] = this.custLastName;
//     data['cust_gender'] = this.custGender;
//     data['cust_id'] = this.custId;
//     data['cust_mob'] = this.custMob;
//     data['cust_add1'] = this.custAdd1;
//     data['email'] = this.email;
//     data['cust_nationality'] = this.custNationality;
//     data['cust_state'] = this.custState;
//     data['Date_of_brith'] = this.dateOfBrith;
//     data['Company'] = this.company;
//     data['cust_country'] = this.custCountry;
//     data['cust_image'] = this.custImage;
//     data['emirates_id'] = this.emiratesId;
//     data['cust_emergency_name'] = this.custEmergencyName;
//     data['cust_emergency_relation'] = this.custEmergencyRelation;
//     data['cust_emergency_number'] = this.custEmergencyNumber;
//     data['cust_emergency_address'] = this.custEmergencyAddress;
//     data['remarks'] = this.remarks;
//     return data;
//   }
// }

class SubscribedPlans {
  int? custId;
  int? id;
  int? invoiceNo;
  int? itemCode;
  Null? invoiceReturnNo;
  String? fromDate;
  String? toDate;
  String? actualStartDate;
  String? actualExpiryDate;
  int? returnStatus;
  int? activeStatus;
  String? createdAt;
  String? updatedAt;
  int? detailSno;
  int? sessions;
  String? startTime;
  String? durationTime;
  String? invoicePlanId;
  String? totalSessions;
  String? remainingSessions;
  String? groupScheduleId;
  String? custId1;
  List<InvoiceDetails>? invoiceDetails;
  String? frozenPlan;
  PTInfo? pTInfo;
  String? image;

  SubscribedPlans(
      {this.custId,
        this.id,
        this.invoiceNo,
        this.itemCode,
        this.invoiceReturnNo,
        this.fromDate,
        this.toDate,
        this.actualStartDate,
        this.actualExpiryDate,
        this.returnStatus,
        this.activeStatus,
        this.createdAt,
        this.updatedAt,
        this.detailSno,
        this.sessions,
        this.startTime,
        this.durationTime,
        this.invoicePlanId,
        this.totalSessions,
        this.remainingSessions,
        this.groupScheduleId,
        this.custId1,
        this.invoiceDetails,
        this.frozenPlan,
        this.pTInfo});

  SubscribedPlans.fromJson(Map<String, dynamic> json) {
    custId = json['cust_id'];
    id = json['id'];
    invoiceNo = json['invoice_no'];
    itemCode = json['item_code'];
    invoiceReturnNo = json['invoice_return_no'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    actualStartDate = json['actual_start_date'];
    actualExpiryDate = json['actual_expiry_date'];
    returnStatus = json['return_status'];
    activeStatus = json['active_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    detailSno = json['detail_sno'];
    sessions = json['sessions'];
    startTime = json['start_time'];
    durationTime = json['duration_time'];
    invoicePlanId = json['invoice_plan_id'];
    totalSessions = json['total_sessions'];
    remainingSessions = json['remaining_sessions'];
    groupScheduleId = json['group_schedule_id'];
    custId1 = json['cust_id_1'];
    if (json['invoice_details'] != null) {
      invoiceDetails = <InvoiceDetails>[];
      json['invoice_details'].forEach((v) {
        invoiceDetails!.add(InvoiceDetails.fromJson(v));
      });
    }
    frozenPlan = json['frozen_plan'];
    pTInfo =
    json['p_t_info'] != null ? PTInfo.fromJson(json['p_t_info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cust_id'] = custId;
    data['id'] = id;
    data['invoice_no'] = invoiceNo;
    data['item_code'] = itemCode;
    data['invoice_return_no'] = invoiceReturnNo;
    data['from_date'] = fromDate;
    data['to_date'] = toDate;
    data['actual_start_date'] = actualStartDate;
    data['actual_expiry_date'] = actualExpiryDate;
    data['return_status'] = returnStatus;
    data['active_status'] = activeStatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['detail_sno'] = detailSno;
    data['sessions'] = sessions;
    data['start_time'] = startTime;
    data['duration_time'] = durationTime;
    data['invoice_plan_id'] = invoicePlanId;
    data['total_sessions'] = totalSessions;
    data['remaining_sessions'] = remainingSessions;
    data['group_schedule_id'] = groupScheduleId;
    data['cust_id_1'] = custId1;
    if (invoiceDetails != null) {
      data['invoice_details'] =
          invoiceDetails!.map((v) => v.toJson()).toList();
    }
    data['frozen_plan'] = frozenPlan;
    if (pTInfo != null) {
      data['p_t_info'] = pTInfo!.toJson();
    }
    return data;
  }
}

class InvoiceDetails {
  int? invoiceTranNo;
  int? invoiceNo;
  int? invoiceItemCode;
  String? invoiceItemDiscription;
  int? invoiceItemQty;
  double? invoiceItemPrice;
  double? invoiceItemGross;
  double? invoiceItemDisount;
  double? invoiceItemNett;
  String? returnQty;
  String? travelAgentCost;
  String? passengerName;
  String? route;
  String? pNRNo;
  String? travelDate;
  String? travelReference;
  String? travelCarrier;
  String? travelFlightClass;
  String? travelTime;
  String? travelStatus;
  String? travelCustId;
  String? travelTranDate;
  String? historyValue1;
  String? historyValue2;
  String? travelPassengerType;
  String? suppId;
  int? invoiceItemWac;
  String? travelReturnDate;
  String? returnStatus;
  String? travelFare;
  String? travelTax;
  String? travelCommision;
  String? travelReturnClass;
  String? salePersonId;
  String? invoiceBusinessDate;
  String? slotName;
  String? restItemOption;
  String? redeemBalance;
  String? saloonItemRedeemStatus;
  String? bookingDate;
  String? serialNo;
  int? serverUpdateFlag;
  String? batchNo;
  String? itemSize;
  String? itemMemo;
  String? itemSizeB;
  String? itemSizeL;
  String? itemTempQty;
  String? voucherValue;
  String? salesPerson;
  String? course;
  String? addons;
  int? sno;
  String? invoiceItemVat;
  String? invoiceItemVatPER;
  String? unitpriceExvat;
  String? itemBarcode;
  String? addonCode;
  String? auditUploadStatus;
  String? igstIndia;
  String? cgstIndia;
  String? sgstIndia;
  String? deliveryDate;
  int? stichingCharge;
  String? discountType;
  String? netDiscountValue;
  String? stichingCost;
  String? expCharge;
  int? bookingStatus;
  String? routeCost;
  int? routeCostRedeemStatus;
  int? discTypeId;
  String? fromLocation;
  String? serviceCharge;
  String? extraTax;
  String? taxType;
  int? baseTime;
  String? startTime;
  String? endTime;
  int? comboPid;
  String? comboTitle;
  InvoiceSaleperson? invoiceSaleperson;

  InvoiceDetails(
      {this.invoiceTranNo,
        this.invoiceNo,
        this.invoiceItemCode,
        this.invoiceItemDiscription,
        this.invoiceItemQty,
        this.invoiceItemPrice,
        this.invoiceItemGross,
        this.invoiceItemDisount,
        this.invoiceItemNett,
        this.returnQty,
        this.travelAgentCost,
        this.passengerName,
        this.route,
        this.pNRNo,
        this.travelDate,
        this.travelReference,
        this.travelCarrier,
        this.travelFlightClass,
        this.travelTime,
        this.travelStatus,
        this.travelCustId,
        this.travelTranDate,
        this.historyValue1,
        this.historyValue2,
        this.travelPassengerType,
        this.suppId,
        this.invoiceItemWac,
        this.travelReturnDate,
        this.returnStatus,
        this.travelFare,
        this.travelTax,
        this.travelCommision,
        this.travelReturnClass,
        this.salePersonId,
        this.invoiceBusinessDate,
        this.slotName,
        this.restItemOption,
        this.redeemBalance,
        this.saloonItemRedeemStatus,
        this.bookingDate,
        this.serialNo,
        this.serverUpdateFlag,
        this.batchNo,
        this.itemSize,
        this.itemMemo,
        this.itemSizeB,
        this.itemSizeL,
        this.itemTempQty,
        this.voucherValue,
        this.salesPerson,
        this.course,
        this.addons,
        this.sno,
        this.invoiceItemVat,
        this.invoiceItemVatPER,
        this.unitpriceExvat,
        this.itemBarcode,
        this.addonCode,
        this.auditUploadStatus,
        this.igstIndia,
        this.cgstIndia,
        this.sgstIndia,
        this.deliveryDate,
        this.stichingCharge,
        this.discountType,
        this.netDiscountValue,
        this.stichingCost,
        this.expCharge,
        this.bookingStatus,
        this.routeCost,
        this.routeCostRedeemStatus,
        this.discTypeId,
        this.fromLocation,
        this.serviceCharge,
        this.extraTax,
        this.taxType,
        this.baseTime,
        this.startTime,
        this.endTime,
        this.comboPid,
        this.comboTitle,
        this.invoiceSaleperson});

  InvoiceDetails.fromJson(Map<String, dynamic> json) {
    invoiceTranNo = json['Invoice_tran_no'];
    invoiceNo = json['Invoice_no'];
    invoiceItemCode = json['Invoice_Item_code'];
    invoiceItemDiscription = json['Invoice_Item_discription'];
    invoiceItemQty = json['Invoice_item_qty'];
    invoiceItemPrice = json['Invoice_Item_price'].toString().parseDouble;
    invoiceItemGross = json['Invoice_Item_gross'].toString().parseDouble;
    invoiceItemDisount = json['Invoice_Item_disount'].toString().parseDouble;
    invoiceItemNett = json['Invoice_Item_nett'].toString().parseDouble;
    returnQty = json['Return_qty'];
    travelAgentCost = json['Travel_agent_cost'];
    passengerName = json['Passenger_name'];
    route = json['Route'];
    pNRNo = json['PNR_no'];
    travelDate = json['Travel_date'];
    travelReference = json['Travel_reference'];
    travelCarrier = json['Travel_carrier'];
    travelFlightClass = json['Travel_flight_class'];
    travelTime = json['Travel_time'];
    travelStatus = json['Travel_status'];
    travelCustId = json['Travel_Cust_id'];
    travelTranDate = json['Travel_tran_date'];
    historyValue1 = json['history_value1'];
    historyValue2 = json['history_value2'];
    travelPassengerType = json['Travel_passenger_type'];
    suppId = json['supp_id'];
    invoiceItemWac = json['Invoice_item_wac'];
    travelReturnDate = json['Travel_return_date'];
    returnStatus = json['Return_status'];
    travelFare = json['Travel_fare'];
    travelTax = json['Travel_tax'];
    travelCommision = json['Travel_commision'];
    travelReturnClass = json['Travel_Return_class'];
    salePersonId = json['Sale_person_id'];
    invoiceBusinessDate = json['Invoice_business_date'];
    slotName = json['slot_name'];
    restItemOption = json['Rest_item_option'];
    redeemBalance = json['redeem_balance'];
    saloonItemRedeemStatus = json['Saloon_item_Redeem_status'];
    bookingDate = json['booking_date'];
    serialNo = json['Serial_no'];
    serverUpdateFlag = json['server_update_flag'];
    batchNo = json['BatchNo'];
    itemSize = json['item_size'];
    itemMemo = json['item_memo'];
    itemSizeB = json['item_sizeB'];
    itemSizeL = json['item_sizeL'];
    itemTempQty = json['item_temp_qty'];
    voucherValue = json['voucher_value'];
    salesPerson = json['sales_person'];
    course = json['Course'];
    addons = json['Addons'];
    sno = json['sno'];
    invoiceItemVat = json['invoice_item_vat'];
    invoiceItemVatPER = json['invoice_item_vat_PER'];
    unitpriceExvat = json['unitpriceExvat'];
    itemBarcode = json['item_barcode'];
    addonCode = json['addon_code'];
    auditUploadStatus = json['audit_upload_status'];
    igstIndia = json['igst_india'];
    cgstIndia = json['cgst_india'];
    sgstIndia = json['sgst_india'];
    deliveryDate = json['delivery_date'];
    stichingCharge = json['stiching_charge'];
    discountType = json['discount_type'];
    netDiscountValue = json['net_discount_value'];
    stichingCost = json['stiching_cost'];
    expCharge = json['exp_charge'];
    bookingStatus = json['booking_status'];
    routeCost = json['route_cost'];
    routeCostRedeemStatus = json['route_cost_redeem_status'];
    discTypeId = json['disc_type_id'];
    fromLocation = json['from_location'];
    serviceCharge = json['service_charge'];
    extraTax = json['extra_tax'];
    taxType = json['tax_type'];
    baseTime = json['base_time'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    comboPid = json['combo_pid'];
    comboTitle = json['combo_title'];
    invoiceSaleperson = json['invoice_saleperson'] != null
        ? InvoiceSaleperson.fromJson(json['invoice_saleperson'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Invoice_tran_no'] = invoiceTranNo;
    data['Invoice_no'] = invoiceNo;
    data['Invoice_Item_code'] = invoiceItemCode;
    data['Invoice_Item_discription'] = invoiceItemDiscription;
    data['Invoice_item_qty'] = invoiceItemQty;
    data['Invoice_Item_price'] = invoiceItemPrice;
    data['Invoice_Item_gross'] = invoiceItemGross;
    data['Invoice_Item_disount'] = invoiceItemDisount;
    data['Invoice_Item_nett'] = invoiceItemNett;
    data['Return_qty'] = returnQty;
    data['Travel_agent_cost'] = travelAgentCost;
    data['Passenger_name'] = passengerName;
    data['Route'] = route;
    data['PNR_no'] = pNRNo;
    data['Travel_date'] = travelDate;
    data['Travel_reference'] = travelReference;
    data['Travel_carrier'] = travelCarrier;
    data['Travel_flight_class'] = travelFlightClass;
    data['Travel_time'] = travelTime;
    data['Travel_status'] = travelStatus;
    data['Travel_Cust_id'] = travelCustId;
    data['Travel_tran_date'] = travelTranDate;
    data['history_value1'] = historyValue1;
    data['history_value2'] = historyValue2;
    data['Travel_passenger_type'] = travelPassengerType;
    data['supp_id'] = suppId;
    data['Invoice_item_wac'] = invoiceItemWac;
    data['Travel_return_date'] = travelReturnDate;
    data['Return_status'] = returnStatus;
    data['Travel_fare'] = travelFare;
    data['Travel_tax'] = travelTax;
    data['Travel_commision'] = travelCommision;
    data['Travel_Return_class'] = travelReturnClass;
    data['Sale_person_id'] = salePersonId;
    data['Invoice_business_date'] = invoiceBusinessDate;
    data['slot_name'] = slotName;
    data['Rest_item_option'] = restItemOption;
    data['redeem_balance'] = redeemBalance;
    data['Saloon_item_Redeem_status'] = saloonItemRedeemStatus;
    data['booking_date'] = bookingDate;
    data['Serial_no'] = serialNo;
    data['server_update_flag'] = serverUpdateFlag;
    data['BatchNo'] = batchNo;
    data['item_size'] = itemSize;
    data['item_memo'] = itemMemo;
    data['item_sizeB'] = itemSizeB;
    data['item_sizeL'] = itemSizeL;
    data['item_temp_qty'] = itemTempQty;
    data['voucher_value'] = voucherValue;
    data['sales_person'] = salesPerson;
    data['Course'] = course;
    data['Addons'] = addons;
    data['sno'] = sno;
    data['invoice_item_vat'] = invoiceItemVat;
    data['invoice_item_vat_PER'] = invoiceItemVatPER;
    data['unitpriceExvat'] = unitpriceExvat;
    data['item_barcode'] = itemBarcode;
    data['addon_code'] = addonCode;
    data['audit_upload_status'] = auditUploadStatus;
    data['igst_india'] = igstIndia;
    data['cgst_india'] = cgstIndia;
    data['sgst_india'] = sgstIndia;
    data['delivery_date'] = deliveryDate;
    data['stiching_charge'] = stichingCharge;
    data['discount_type'] = discountType;
    data['net_discount_value'] = netDiscountValue;
    data['stiching_cost'] = stichingCost;
    data['exp_charge'] = expCharge;
    data['booking_status'] = bookingStatus;
    data['route_cost'] = routeCost;
    data['route_cost_redeem_status'] = routeCostRedeemStatus;
    data['disc_type_id'] = discTypeId;
    data['from_location'] = fromLocation;
    data['service_charge'] = serviceCharge;
    data['extra_tax'] = extraTax;
    data['tax_type'] = taxType;
    data['base_time'] = baseTime;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['combo_pid'] = comboPid;
    data['combo_title'] = comboTitle;
    if (invoiceSaleperson != null) {
      data['invoice_saleperson'] = invoiceSaleperson!.toJson();
    }
    return data;
  }
}

class InvoiceSaleperson {
  int? salepersonId;
  int? detailsRowId;
  Null? remarks;

  InvoiceSaleperson({this.salepersonId, this.detailsRowId, this.remarks});

  InvoiceSaleperson.fromJson(Map<String, dynamic> json) {
    salepersonId = json['saleperson_id'];
    detailsRowId = json['details_row_id'];
    remarks = json['remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['saleperson_id'] = salepersonId;
    data['details_row_id'] = detailsRowId;
    data['remarks'] = remarks;
    return data;
  }
}

class PTInfo {
  int? invoiceNo;
  String? itemDescription;
  int? parentItem;

  PTInfo({this.invoiceNo, this.itemDescription, this.parentItem});

  PTInfo.fromJson(Map<String, dynamic> json) {
    invoiceNo = json['invoice_no'];
    itemDescription = json['item_Description'];
    parentItem = json['parent_item'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['invoice_no'] = invoiceNo;
    data['item_Description'] = itemDescription;
    data['parent_item'] = parentItem;
    return data;
  }
}

class Schedules {
  int? id;
  String? title;
  List<Dates>? dates;
  List<Appointments>? appointments;
  int? planId;
  int? staffId;
  int? memberCount;
  Days? days;
  String? roomName;
  String? roomId;
  List<AttendanceDetails>? attendanceDetails;

  Schedules(
      {this.id,
        this.title,
        this.dates,
        this.appointments,
        this.planId,
        this.staffId,
        this.memberCount,
        this.days,
        this.roomName,
        this.roomId,
        this.attendanceDetails});

  Schedules.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['dates'] != null) {
      dates = <Dates>[];
      json['dates'].forEach((v) {
        dates!.add(Dates.fromJson(v));
      });
    }
    if (json['appointments'] != null) {
      appointments = <Appointments>[];
      json['appointments'].forEach((v) {
        appointments!.add(Appointments.fromJson(v));
      });
    }
    planId = json['plan_id'];
    staffId = json['staff_id'];
    memberCount = json['member_count'];
    days = json['days'] != null ? Days.fromJson(json['days']) : null;
    roomName = json['room_name'];
    roomId = json['room_id'];
    if (json['attendance_details'] != null) {
      attendanceDetails = <AttendanceDetails>[];
      json['attendance_details'].forEach((v) {
        attendanceDetails!.add(AttendanceDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    if (dates != null) {
      data['dates'] = dates!.map((v) => v.toJson()).toList();
    }
    if (appointments != null) {
      data['appointments'] = appointments!.map((v) => v.toJson()).toList();
    }
    data['plan_id'] = planId;
    data['staff_id'] = staffId;
    data['member_count'] = memberCount;
    if (days != null) {
      data['days'] = days!.toJson();
    }
    data['room_name'] = roomName;
    data['room_id'] = roomId;
    if (attendanceDetails != null) {
      data['attendance_details'] =
          attendanceDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dates {
  String? startDate;
  String? endDate;

  Dates({this.startDate, this.endDate});

  Dates.fromJson(Map<String, dynamic> json) {
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    return data;
  }
}

class Appointments {
  String? startTime;
  String? endTime;

  Appointments({this.startTime, this.endTime});

  Appointments.fromJson(Map<String, dynamic> json) {
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    return data;
  }
}

class Days {
  int? sun;
  int? mon;
  int? tue;
  int? wed;
  int? thu;
  int? fri;
  int? sat;

  Days({this.sun, this.mon, this.tue, this.wed, this.thu, this.fri, this.sat});

  Days.fromJson(Map<String, dynamic> json) {
    sun = json['sun'];
    mon = json['mon'];
    tue = json['tue'];
    wed = json['wed'];
    thu = json['thu'];
    fri = json['fri'];
    sat = json['sat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sun'] = sun;
    data['mon'] = mon;
    data['tue'] = tue;
    data['wed'] = wed;
    data['thu'] = thu;
    data['fri'] = fri;
    data['sat'] = sat;
    return data;
  }
}

class AttendanceDetails {
  int? custId;
  String? date;
  int? batchId;
  String? attendanceStatus;

  AttendanceDetails(
      {this.custId, this.date, this.batchId, this.attendanceStatus});

  AttendanceDetails.fromJson(Map<String, dynamic> json) {
    custId = json['cust_id'];
    date = json['date'];
    batchId = json['batch_id'];
    attendanceStatus = json['attendance_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cust_id'] = custId;
    data['date'] = date;
    data['batch_id'] = batchId;
    data['attendance_status'] = attendanceStatus;
    return data;
  }
}

class JoinSchedule {
  String? title;
  int? planId;
  int? memberCount;
  int? staffId;
  String? itemDescription;

  JoinSchedule(
      {this.title,
        this.planId,
        this.memberCount,
        this.staffId,
        this.itemDescription});

  JoinSchedule.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    planId = json['plan_id'];
    memberCount = json['member_count'];
    staffId = json['staff_id'];
    itemDescription = json['item_Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['plan_id'] = planId;
    data['member_count'] = memberCount;
    data['staff_id'] = staffId;
    data['item_Description'] = itemDescription;
    return data;
  }
}
