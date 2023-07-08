import 'package:cloud_me_v2/tdd/domain/entities/vx_store.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_paytabs_bridge/BaseBillingShippingInfo.dart';
import 'package:flutter_paytabs_bridge/IOSThemeConfiguration.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkApms.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkConfigurationDetails.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTokeniseType.dart';
import 'package:flutter_paytabs_bridge/flutter_paytabs_bridge.dart';

import '../../../../core/error/failuers.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/util/presentation/flutter_flow/flutter_flow_util.dart';
import '../../../data/models/api/invoice/purchase_invoce_data.dart';
import '../../../presentaion/modules/update_trainer/updateTrainer_controller.dart';
import '../../repositories/repository_provider.dart';

class UpdatetrainerUseCase  extends UseCase<bool,UpdatetrainerDatas>{
  DependencyRepostProvider<dynamic> repo;

  PurchaseInvoiceData? purchaseInvoiceData;
  UpdatetrainerUseCase({required this.repo});
  /// call meted for inserting product to db
  PaymentSdkConfigurationDetails get generateConfig {
    var billingDetails = BillingDetails(stored.userdata.custName, stored.userdata.email,stored.userdata.countryCodePh1+ stored.userdata.phone1, "dubai", "United Arab Emirate", "Dubai", "DU", "");
    List<PaymentSdkAPms> apms = [];
    apms.add(PaymentSdkAPms.AMAN);
    var configuration = PaymentSdkConfigurationDetails(
        profileId: "122214",
        serverKey: "SLJNKWHW6K-J6L2JTTLNT-9JNWWJ2GKJ",
        clientKey: "CPKM7K-V7QM6G-BM677B-62GQ7T",
        cartId: "12433",
        cartDescription: "Flowers",
        merchantName: "Raising Gym",
        screentTitle: "Pay with Card",
        amount: (stored.selectedtrainer?.itprRetlPrice.toDouble()??0),
        showBillingInfo: true,
        forceShippingInfo: false,
        currencyCode: "AED",
        merchantCountryCode: "ae",
        billingDetails: billingDetails,
        alternativePaymentMethods: apms,
        linkBillingNameWithCardHolderName: true
    );
    var theme = IOSThemeConfigurations();
    theme.logoImage = "assets/logo.png";
    configuration.iOSThemeConfigurations = theme;
    configuration.tokeniseType = PaymentSdkTokeniseType.MERCHANT_MANDATORY;
    return configuration;
  }
  payCard({required Function(Map<String, dynamic> data) onSucsess, required Function(Map<String, dynamic> data) onFailure, required Function(Map<String, dynamic> data) onPrecess}) async=> FlutterPaytabsBridge.startCardPayment(generateConfig, (event) {
    if (event["status"] == "success") {
      // Handle transaction details here.
      Map<String,dynamic> transactionDetails = (event["data"] as Map<Object?,Object?>).map((key, value) => MapEntry(key.toString(), value));

      if (kDebugMode) {
        print(jsonEncode(transactionDetails));
      }
      //t
      if (transactionDetails["isSuccess"]??transactionDetails["p"]) {
        if (kDebugMode) {
          print("successful Transaction");
        }
        if (transactionDetails["isPending"]??transactionDetails["s"]) {
          if (kDebugMode) {
            print("transaction pending");
          }
          onPrecess(transactionDetails);
        }
        onSucsess(transactionDetails);
      } else {
        if (kDebugMode) {
          print("failed transaction");
        }
        onFailure(transactionDetails);
      }

      // print(transactionDetails["isSuccess"]);
    } else if (event["status"] == "error") {
      if (kDebugMode) {
        print("error $event");
      }
      // Handle error here.
    } else if (event["status"] == "event") {
      if (kDebugMode) {
        print("event : $event");
      }
      // Handle events here.
    }
  });

  /// Use Case For Setup DB
  @override
  Future<Either<Failure,bool>> call({required UpdatetrainerDatas data}) async{
    return await payCard(
        onSucsess: (Map<String, dynamic> data) {
          if (kDebugMode) {
            print("show Toast paid");
          }
          purchaseInvoiceData = PurchaseInvoiceData.fromJson(data);
        },
        onFailure: (Map<String, dynamic> data) {
          purchaseInvoiceData = PurchaseInvoiceData.fromJson(data);
        },
        onPrecess: (Map<String, dynamic> invoice) async{
          final result =  await repo.getRequest(Params(uri: Uri.parse("update_trainer"), methed: Methed.Post,data: {
                "invoice_no":purchaseInvoiceData?.merchantId,
                "trainer_id":data.transctionId
              }));
          return result.fold((l) => Left(l), (r) {
            if (kDebugMode) {
              print(r);
            }
            return  const Right(true);
          });
        });
  }
}