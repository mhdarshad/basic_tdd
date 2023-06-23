import 'dart:convert';

import 'package:cloud_me_v2/core/usecases/usecase.dart';
import 'package:cloud_me_v2/tdd/data/models/api/invoice/purchase_invoce_data.dart';
import 'package:cloud_me_v2/tdd/data/models/db/users.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_paytabs_bridge/BaseBillingShippingInfo.dart';
import 'package:flutter_paytabs_bridge/IOSThemeConfiguration.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkApms.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkConfigurationDetails.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTokeniseType.dart';
import 'package:flutter_paytabs_bridge/flutter_paytabs_bridge.dart';
import 'package:tabby_flutter_inapp_sdk/tabby_flutter_inapp_sdk.dart';

import '../../../../core/event/event_hanling.dart';
import '../../../../core/util/presentation/Events/logic_event_handler.dart';
import '../../../data/models/api/user/user_data.dart';
import '../../../domain/usecase/dashboard/dashboard_usecase.dart';
class CheckoutEvent extends LogicHandler<DashBoardUseCase, CheckoutData>{
  CheckoutEvent(super.usecase);
  Future<TabbySession> payTabby({required CheckoutData data}) async{
    final mockPayload = Payment(
      amount: '340',
      currency: Currency.aed,
      buyer: Buyer(
        email: data.user.email,
        phone: data.user.countryCodePh1+data.user.phone1,
        name: data.user.custName,
        dob: '2019-08-24',
      ),
      buyerHistory: BuyerHistory(
        loyaltyLevel: 0,
        registeredSince: '2019-08-24T14:15:22Z',
        wishlistCount: 0,
      ),
      shippingAddress: const ShippingAddress(
        city: 'string',
        address: 'string',
        zip: 'string',
      ),
      order: Order(referenceId: 'id123', items: [
        OrderItem(
          title: 'Jersey',
          description: 'Jersey',
          quantity: 1,
          unitPrice: '10.00',
          referenceId: 'uuid',
          productUrl: 'http://example.com',
          category: 'clothes',
        )
      ]),
      orderHistory: [
        OrderHistoryItem(
          purchasedAt: '2019-08-24T14:15:22Z',
          amount: '10.00',
          paymentMethod: OrderHistoryItemPaymentMethod.card,
          status: OrderHistoryItemStatus.newOne,
        )
      ],
    );

    return TabbySDK().createSession(TabbyCheckoutPayload(
      merchantCode: 'ae',
      lang: Lang.en,
      payment: mockPayload,
    ));

  }
  @override
  call({required CheckoutData data}) {
    // TODO: implement call
    return  CheckOutMutation(usecase, data);
  }
}

class CheckOutMutation extends EventMutations<CheckoutData>  {
  DashBoardUseCase usecase;
  CheckoutData data;
  PaymentSdkConfigurationDetails get generateConfig {
    var billingDetails = BillingDetails(data.user.custName, data.user.email,
        data.user.countryCodePh1+ data.user.phone1, "", "", "", "", "");
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

  CheckOutMutation(this.usecase, this. data) : super(data);
  payCard({required Function(Map<String, dynamic> data) onSucsess,
    required Function(Map<String, dynamic> data) onFailure,
    required Function(Map<String, dynamic> data) onPrecess}) async=> FlutterPaytabsBridge.startCardPayment(generateConfig, (event) {
    if (event["status"] == "success") {
      // Handle transaction details here.
      Map<String,dynamic> transactionDetails = (event["data"] as Map<Object?,Object?>).map((key, value) => MapEntry(key.toString(), value));

      if (kDebugMode) {
        print(jsonEncode(transactionDetails));
      }
      if (transactionDetails["isSuccess"]) {
        if (kDebugMode) {
          print("successful Transaction");
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

  @override
  perform() async {
    switch(data.methode){

      case PaymentMethode.tabby:

        break;
      case PaymentMethode.card:
       return await payCard(
            onSucsess: (Map<String, dynamic> data) {
              if (kDebugMode) {
                print("show Toast paid");
              }
              // successToast("Paid");
              store?.purchaseInvoiceData = PurchaseInvoiceData.fromJson(data);
            },
            onFailure: (Map<String, dynamic> data) {
              store?.purchaseInvoiceData = PurchaseInvoiceData.fromJson(data);
              errorToast("Error: $data");
            },
            onPrecess: (Map<String, dynamic> data) {

            });
    }
  }
}

class CheckoutData{
  Customer user;
  PaymentMethode methode;
  CheckoutData({required this.user,required this.methode});
}

enum PaymentMethode{
  tabby,card
}