import 'package:cloud_me_v2/tdd/domain/entities/vx_store.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/error/failuers.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/util/config/user_config.dart';
import '../../../../injection_container.dart';
import '../../../data/models/api/trainers/trainers_data.dart';
import '../../../data/models/api/user/plans_data.dart';
import '../../../presentaion/modules/trainer/trainer_controller.dart';
import '../../repositories/repository_provider.dart';

class GenrateInvoiceUseCase extends UseCase<List<PersonalTrainerData>,NoPrams>{
  DependencyRepostProvider<dynamic> repo;
  GenrateInvoiceUseCase({required this.repo});
  /// call meted for inserting product to db

  /// Use Case For Setup DB
  @override
  Future<Either<Failure, List<PersonalTrainerData>>> call({required NoPrams data}) async{
    final paymentdata = stored.purchaseInvoiceData;
    final result =  await repo.getRequest(Params(uri: Uri.parse("make_payment"), methed: Methed.Post,data: {
      "mytable": [
        {
          "invoicehead": [
            {
              "Invoice_Cust_id": "${sl<Configration>().custId}",
              "Invoice_created_user": "40171",
              "Invoice_created_dt": "2022-11-22 15:25:24",
              "Invoice_gross": "300.00",
              "Invoice_discount": "0.00",
              "Invoice_nett": "300.00",
              "Invoice_currency": "AED",
              "Invoice_sale_person": null,
              "Invoice_till_id": "40171",
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
              "order_time": "2022-11-22 15:25:24",
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
              "Invoice_Item_code": "100001",
              "Invoice_Item_discription": "1 Month Membership",
              "Invoice_item_qty": 1,
              "Invoice_Item_price": 300,
              "Invoice_Item_gross": 300,
              "Invoice_Item_disount": 0,
              "Invoice_Item_nett": 300,
              "Invoice_item_wac": 0,
              "Sale_person_id": null,
              "addons": null,
              "invoice_item_vat": 0,
              "invoice_item_vat_PER": 0,
              "unitpriceExvat": 300,
              "addon_code": null,
              "delivery_date": null,
              "stiching_charge": "0",
              "plan_start": "10/06/2023",
              "expiry_date": "10/07/2023",
              "trainer_code": null,
              "trainer_price": null,
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
              "Cust_id": "130",
              "Cust_name": "MADURA",
              "Start": null,
              "End": null,
              "Staff": null
            }
          ],
          "invoicepayment": [
            {
              "Pay_type": "Cash",
              "Pay_value": "300.00",
              "Pay_card_cheq_vo_no": "0",
              "Pay_card_type": null,
              "Pay_till_id": "40171",
              "Pay_Register_id": "0",
              "Pay_business_dt": "2022-11-22 15:25:24",
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
    }
    ));
    return result.fold((l) => Left(l), (r) {
      if (kDebugMode) {
        print(r);
      }
      return  Right((r as List).map((e) => PersonalTrainerData.fromJson(e)).toList());
    });
  }
}