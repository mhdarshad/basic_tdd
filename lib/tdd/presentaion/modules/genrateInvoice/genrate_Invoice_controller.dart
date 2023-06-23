import 'package:cloud_me_v2/core/usecases/usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_paytabs_bridge/BaseBillingShippingInfo.dart';
import 'package:flutter_paytabs_bridge/IOSThemeConfiguration.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkApms.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkConfigurationDetails.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTokeniseType.dart';
import 'package:flutter_paytabs_bridge/flutter_paytabs_bridge.dart';

import '../../../../core/event/event_hanling.dart';
import '../../../../core/util/presentation/Events/logic_event_handler.dart';
import '../../../domain/usecase/genrateInvoice/trainer_usecase.dart';
typedef UseCaseData = GenrateInvoiceUseCase;
class   GenrateInvoiceEvent extends LogicHandler<UseCaseData, NoPrams>{
  GenrateInvoiceEvent(super.usecase);

  @override
  call({required NoPrams data}) {
    // TODO: implement call
 return  GentrateInvoiceMutation(usecase, data);
  }


}
class GentrateInvoiceMutation extends EventMutations<NoPrams>  {
  UseCaseData usecase;

  PaymentSdkConfigurationDetails get generateConfig {
    var billingDetails = BillingDetails("John Smith", "email@domain.com",
        "+97311111111", "st. 12", "eg", "dubai", "dubai", "12345");
    var shippingDetails = ShippingDetails("John Smith", "email@domain.com",
        "+97311111111", "st. 12", "eg", "dubai", "dubai", "12345");
    List<PaymentSdkAPms> apms = [];
    apms.add(PaymentSdkAPms.AMAN);
    var configuration = PaymentSdkConfigurationDetails(
        profileId: "122214",
        serverKey: "SLJNKWHW6K-J6L2JTTLNT-9JNWWJ2GKJ",
        clientKey: "CPKM7K-V7QM6G-BM677B-62GQ7T",
        cartId: "12433",
        cartDescription: "Flowers",
        merchantName: "Flowers Store",
        screentTitle: "Pay with Card",
        amount: 20.0,
        showBillingInfo: true,
        forceShippingInfo: false,
        currencyCode: "AED",
        merchantCountryCode: "AE",
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
  GentrateInvoiceMutation(this.usecase, NoPrams data) : super(data);
  payCard({required Function(Map<String, dynamic> data) onSucsess,
          required Function(Map<String, dynamic> data) onFailure,
          required Function(Map<String, dynamic> data) onPrecess}) async=> FlutterPaytabsBridge.startCardPayment(generateConfig, (event) {
    if (event["status"] == "success") {
      // Handle transaction details here.
      Map<String,dynamic> transactionDetails = (event["data"] as Map<Object?,Object?>).map((key, value) => MapEntry(key.toString(), value));

      if (kDebugMode) {
        print(transactionDetails);
      }
      if (transactionDetails["isSuccess"]) {
        if (kDebugMode) {
          print("successful transaction");
        }
        if (transactionDetails["isPending"]) {
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
      print("error $event");
      // Handle error here.
    } else if (event["status"] == "event") {
      print("event : $event");
      // Handle events here.
    }
  });
  @override
  perform() async {
    final request = await usecase(data:data);

    if(!request.isLeft()){
      if (kDebugMode) {
        print("logged in");
      }
      request.forEach((r) {
        // store?.dashboard = r;
      });
    }
  }
}