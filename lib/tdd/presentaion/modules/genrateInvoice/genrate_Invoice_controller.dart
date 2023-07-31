import 'dart:convert';

import 'package:cloud_me_v2/core/error/exceptions.dart';
import 'package:cloud_me_v2/core/usecases/usecase.dart';
import 'package:cloud_me_v2/tdd/domain/entities/vx_store.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_paytabs_bridge/BaseBillingShippingInfo.dart';
import 'package:flutter_paytabs_bridge/IOSThemeConfiguration.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkApms.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkConfigurationDetails.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTokeniseType.dart';
import 'package:flutter_paytabs_bridge/flutter_paytabs_bridge.dart';

import '../../../../core/event/event_hanling.dart';
import '../../../../core/util/config/user_config.dart';
import '../../../../core/util/presentation/Events/logic_event_handler.dart';
import '../../../../core/util/presentation/flutter_flow/flutter_flow_util.dart';
import '../../../../injection_container.dart';
import '../../../data/models/api/user/plans_data.dart';
import '../../../domain/usecase/genrateInvoice/trainer_usecase.dart';
import '../../view/widgets/dateTime/time_picker.dart';
typedef UseCaseData = GenrateInvoiceUseCase;
class   GenrateInvoiceEvent extends LogicHandler<UseCaseData, Map<String,dynamic>>{
  GenrateInvoiceEvent(super.usecase);

  @override
  call({required Map<String,dynamic> data}) {
    // TODO: implement call
 return  GentrateInvoiceMutation(usecase, data);
  }


}
class GentrateInvoiceMutation extends EventMutations<Map<String,dynamic>>  {
  UseCaseData usecase;
  // Map<String,dynamic> get generateConfig => {
  //     "mytable": [
  //       {
  //         "invoicehead": [
  //           {
  //             "Invoice_Cust_id": "${store?.userdata.id}",
  //             "Invoice_created_user": "40171",
  //             "Invoice_created_dt": DateTime.now().toString(),
  //             "Invoice_gross": "${store?.selectedPlans?.itemPrice}",
  //             "Invoice_discount": "0.00",
  //             "Invoice_nett": "${store?.selectedPlans?.itemPrice}",
  //             "Invoice_currency": "AED",
  //             "Invoice_sale_person": null,
  //             "Invoice_till_id": "40171",
  //             "Invoice_business_dt":  DateTime.now().toString(),
  //             "Remarks": "--",
  //             "Rest_del_type": "Take Away",
  //             "Rest_Table_no": "0",
  //             "Entry_Time": "2022-11-22 15:25:24",
  //             "Deliver_boy": null,
  //             "order_no": "0",
  //             "Discount_By": "Cashier",
  //             "Discount_Remarks": null,
  //             "No_Of_Packs": "0",
  //             "delivery_type": null,
  //             "Delivery_Area": "--",
  //             "invoice_vat": "0.00",
  //             "order_time": "2022-11-22 15:25:24",
  //             "cust_name": "MADURA",
  //             "cust_mob": "--",
  //             "cust_mob2": "--",
  //             "cust_add": "--",
  //             "saletype": "sale",
  //             "sale_invoiceno": "0",
  //             "vehicle_no": null,
  //             "Sale_person_paid_value": 0
  //           }
  //         ],
  //         "invoicedetails": [
  //           {
  //             "Invoice_Item_code": "${store?.selectedPlans?.itemCode}",
  //             "Invoice_Item_discription": "${store?.selectedPlans?.itemDescription}",
  //             "Invoice_item_qty": 1,
  //             "Invoice_Item_gross": store?.selectedPlans?.itemPrice.toDouble(),
  //             "Invoice_Item_disount": 0,
  //             "Invoice_Item_nett": store?.selectedPlans?.itemPrice.toDouble(),
  //             "Sale_person_id": null,
  //             "invoice_item_vat": 0,
  //             "invoice_item_vat_PER": 0,
  //             "unitpriceExvat": 300,
  //             "plan_start": "10/06/2023",
  //             "expiry_date": "10/07/2023",
  //             "trainer_code": null,
  //             "trainer_price": null,
  //             "multiple_salesman": "100002",
  //             "sessions": null,
  //             "start_time": null,
  //             "duration_time": null,
  //             "sel_court": null,
  //             "court_start_time": null,
  //             "court_end_time": null
  //           }
  //         ],
  //         "appointmentdetails": [
  //           {
  //             "Cust_id": "${store?.userdata.id}",
  //             "Cust_name": "${store?.userdata.custName}",
  //             "Start": null,
  //             "End": null,
  //             "Staff": null
  //           }
  //         ],
  //         "invoicepayment": [
  //           {
  //             "Pay_type": "Card",
  //             "Pay_value": "${store?.selectedPlans?.itemPrice.toDouble()??0+(store?.selectedtrainer?.itprRetlPrice.toDouble()??0)}",
  //             "Pay_card_cheq_vo_no": "0",
  //             "Pay_card_type": null,
  //             "Pay_business_dt": DateTime.now().toString(),
  //             "Pay_inv_value": "300.00",
  //             "Pay_cust_id": "130",
  //             "Finance_status": "1",
  //             "Paid_amount": "${store?.selectedPlans?.itemPrice.toDouble()??0+(store?.selectedtrainer?.itprRetlPrice.toDouble()??0)}",
  //             "Balance_amount": "0",
  //             "Split_ord": "--",
  //             "Delivery_type": null
  //           }
  //         ],
  //         "pay_type": "sale"
  //       }
  //     ],
  //     "requestfrom": "app"
  //   };
  Map<String,dynamic> get generateConfig => {
    "mytable": [
      {
        "invoicehead": [
          {
            "Invoice_Cust_id": sl<Configration>().custId,
            "Invoice_created_user": stored.purchaseInvoiceData?.merchantId,
            "Invoice_created_dt":  DateTime.now().toString(),
            "Invoice_gross": "${store?.selectedPlans?.itemPrice}",
            "Invoice_discount": "0.00",
            "Invoice_nett": "${store?.selectedPlans?.itemPrice}",
            "Invoice_currency": "AED",
            "Invoice_sale_person": null,
            "Invoice_till_id": stored.purchaseInvoiceData?.merchantId,
            "Invoice_business_dt": "2022-11-22 15:25:24",
            "Rest_del_type": "Take Away",
            "Remarks": "--",
            "Rest_Table_no": "0",
            "Entry_Time": "2022-11-22 15:25:24",
            "Deliver_boy": null,
            "order_no": "0",
            "Discount_By": "Cashier",
            "Discount_Remarks": null,
            "No_Of_Packs": "0",
            "delivery_type": null,
            "Delivery_Area": "--",
            "invoice_vat": "0.00",
            "order_time":  DateTime.now().toString(),
            "cust_name": "MADURA",
            "cust_mob": "--",
            "cust_mob2": "--",
            "cust_add": "--",
            "saletype": "sale",
            "sale_invoiceno": "0",
            "vehicle_no": null,
            "Sale_person_paid_value": 0
          }
        ],
        "invoicedetails": [
          {
            "Invoice_Item_code":store?.selectedPlans?.itemCode,
            "Invoice_Item_discription": store?.selectedPlans?.itemDescription,
            "Invoice_item_qty": 1,
            "Invoice_Item_price": store?.selectedPlans?.itemPrice.toDouble(),
            "Invoice_Item_gross": store?.selectedPlans?.itemPrice.toDouble(),
            "Invoice_Item_disount": 0,
            "Invoice_Item_nett": store?.selectedPlans?.itemPrice.toDouble(),
            "Invoice_item_wac": 0,
            "Sale_person_id": null,
            "addons": null,
            "invoice_item_vat": 0,
            "invoice_item_vat_PER": 0,
            "unitpriceExvat": store?.selectedPlans?.itemPrice.toDouble(),
            "addon_code": null,
            "delivery_date": null,
            "stiching_charge": "0",
            "plan_start": DateFormat('dd/MM/yyyy').format(SceduleUserDetailModel.dateController.value??DateTime.now()),
            "expiry_date": daysData(store?.selectedPlans),
            "trainer_code": store?.selectedtrainer?.addonItem,
            "trainer_price": store?.selectedtrainer?.itprRetlPrice,
            "multiple_salesman": "100002",
            "sessions": null,
            "start_time": null,
            "duration_time": null,
            "sel_court": null,
            "court_start_time": null,
            "court_end_time": null
          }
        ],
        "appointmentdetails": [
          {
            "Cust_id": "${store?.userdata?.memCode}",
            "Cust_name": "${store?.userdata?.custName}",
            "Start": null,
            "End": null,
            "Staff": null
          }
        ],
        "invoicepayment": [
          {
            "Pay_type": "Cash",
            "Pay_value":  "${store?.selectedPlans?.itemPrice.toDouble()??0+(store?.selectedtrainer?.itprRetlPrice.toDouble()??0)}",
            "Pay_card_cheq_vo_no": "0",
            "Pay_card_type": null,
            "Pay_till_id": "40171",
            "Pay_Register_id": "0",
            "Pay_business_dt": "${store?.selectedPlans?.itemPrice.toDouble()??0+(store?.selectedtrainer?.itprRetlPrice.toDouble()??0)}",
            "Pay_inv_value": "300.00",
            "Pay_cust_id": "130",
            "Finance_status": "1",
            "Paid_amount": "300.00",
            "Balance_amount": "0",
            "Split_ord": "--",
            "Delivery_type": null
          }
        ],
        "pay_type": "sale"
      }
    ],
    "requestfrom": "web"
  };
  GentrateInvoiceMutation(this.usecase, Map<String,dynamic> data) : super(data);
  DateTime daysData(Plans? planData) {
    DateTime month =DateTime.now();
    if(((planData?.noOfMonths!=null)&&(planData?.noOfMonths!=0))){
      month = DateUtils.addMonthsToMonthDate(DateTime.now(), planData?.noOfMonths??0);
    }
    if(planData?.noOfDays!=null && planData?.noOfDays!=0) {
      month.add(Duration(days:planData?.noOfDays??0));
    }
    return month;
  }
  @override
  perform() async {
    final request = await usecase(data:generateConfig);
    // Clipboard.setData(ClipboardData(text: jsonEncode(generateConfig)));
    if(!request.isLeft()){
      if (kDebugMode) {
        print("logged in");
      }
      request.forEach((r) {
        // store?.dashboard = r;
      });
    }
    request.fold((l) => throw l, (r) {
      return null;
    });
  }
}