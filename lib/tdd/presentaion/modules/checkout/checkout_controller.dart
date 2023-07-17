import 'dart:convert';

import 'package:cloud_me_v2/core/usecases/usecase.dart';
import 'package:cloud_me_v2/tdd/data/models/api/invoice/purchase_invoce_data.dart';
import 'package:cloud_me_v2/tdd/data/models/api/user/plans_data.dart';
import 'package:cloud_me_v2/tdd/data/models/db/users.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paytabs_bridge/BaseBillingShippingInfo.dart';
import 'package:flutter_paytabs_bridge/IOSThemeConfiguration.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkApms.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkConfigurationDetails.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTokeniseType.dart';
import 'package:flutter_paytabs_bridge/flutter_paytabs_bridge.dart';
import 'package:tabby_flutter_inapp_sdk/tabby_flutter_inapp_sdk.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/event/event_hanling.dart';
import '../../../../core/util/presentation/Events/logic_event_handler.dart';
import '../../../../rought_genrator.dart';
import '../../../data/models/api/trainers/trainers_data.dart';
import '../../../data/models/api/user/user_data.dart';
import '../../../domain/entities/vx_store.dart';
import '../../../domain/usecase/dashboard/dashboard_usecase.dart';
import 'transaction_sucsess_controller.dart';
class CheckoutEvent extends LogicHandler<DashBoardUseCase, CheckoutData>{
  CheckoutEvent(super.usecase);
  Future<TabbySession> payTabby({required CheckoutData data}) async{
    final mockPayload = Payment(
      amount: '340',
      currency: Currency.aed,
      buyer: Buyer(
        email: data.user.email??'',
        phone: data.user.custMob??'',
        name: data.user.custName??'',
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
          purchasedAt: DateTime.now().toString(),
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
  call({required CheckoutData data, BuildContext? context}) {
    // TODO: implement call
    return  CheckOutMutation(usecase, data,context!);
  }
}

class CheckOutMutation extends VxMutation<ProjectStore> {
  DashBoardUseCase usecase;
  CheckoutData data;
  PersonalTrainerData? personalTrainerData;
  Plans? plansData;
  String? errerMessege;

  BuildContext context;
  PaymentSdkConfigurationDetails get generateConfig {
    var billingDetails = BillingDetails("Mohammed Arshad", data.user.email??'', "${data.user.custMob}", data.user.custAdd1??'', data.user.custCountry??'', data.user.custState??'',  data.user.custState??'', "");
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
        amount: (plansData?.itemPrice.toDouble()??0)+(personalTrainerData?.itprRetlPrice.toDouble()??0),
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

  CheckOutMutation(this.usecase, this. data,this.context) ;
  payCard({required Function(Map<String, dynamic> data) onSucsess,
    required Function(Map<String, dynamic> data) onFailure,
    required Function(Map<String, dynamic> data) onPrecess}) async=> FlutterPaytabsBridge.startCardPayment(generateConfig, (event) {

    if (event["status"] == "success") {
      // Handle transaction details here.
      Map<String,dynamic> transactionDetails = (event["data"] as Map<Object?,Object?>).map((key, value) => MapEntry(key.toString(), value));
      print(jsonEncode(transactionDetails));
      //t
      if (transactionDetails["isSuccess"]??transactionDetails["p"]) {
        print("successful Transaction");
        if (transactionDetails["isPending"]??transactionDetails["s"]) {
          print("transaction pending");
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
    personalTrainerData = store?.selectedtrainer;
    plansData = store?.selectedPlans;
    switch(data.methode){
      case PaymentMethode.tabby:
        break;
      case PaymentMethode.card:
       final data = await payCard(
            onSucsess: (Map<String, dynamic> data) {
              if (kDebugMode) {
                print("show Toast paid");
              }
              print("show Toast $data");
              store?.purchaseInvoiceData = PurchaseInvoiceData.fromJson(data);
              final storeddata =stored.purchaseInvoiceData;
              navigate.push(context, name: Routename.paymentStatus,qparms: {
                "status":storeddata?.isSuccess??false?"paid":"unpaid"
              });
            },
            onFailure: (Map<String, dynamic> data) {
              store?.purchaseInvoiceData = PurchaseInvoiceData.fromJson(data);
              errerMessege =/* PurchaseInvoiceData.fromJson(data).h?.responseMessage??*/'Unknown Error';
              navigate.push(context, name: Routename.paymentStatus,qparms: {
                "status":"unpaid"
              });
            },
            onPrecess: (Map<String, dynamic> data) {

            });
       print(data);
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