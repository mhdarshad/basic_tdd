import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_me_v2/core/util/calculations/calculation.dart';
import 'package:cloud_me_v2/core/util/presentation/template/custom_scafold.dart';
import 'package:cloud_me_v2/tdd/domain/entities/vx_store.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tabby_flutter_inapp_sdk/tabby_flutter_inapp_sdk.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../../../core/util/presentation/flutter_flow/flutter_flow_icon_button.dart';
import '../../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import '../../../../../../core/util/presentation/flutter_flow/flutter_flow_widgets.dart';
import '../../../../../../injection_container.dart';
import '../../../../../../rought_genrator.dart';
import '../../../../modules/checkout/checkout_consumer.dart';
import '../../../../modules/checkout/checkout_controller.dart';
import '../../../widgets/dateTime/time_picker.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final planData = stored.selectedPlans;
    final trainerData = stored.selectedtrainer;
    return  ProjectScafold(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: Hero(
                            tag: 'productShoe',
                            transitionOnUserGestures: true,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: Image.network(
                                'https://images.pexels.com/photos/1229356/pexels-photo-1229356.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: const Color(0x3A000000),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30,
                                        buttonSize: 46,
                                        icon: const Icon(
                                          Icons.arrow_back_rounded,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                        onPressed: () async {
                                          navigate.pop(context);
                                          // context.pop();
                                        },
                                      ),
                                    ),
                                    Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: const Color(0x3A000000),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30,
                                        buttonSize: 46,
                                        icon: const Icon(
                                          Icons.favorite_border,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                        onPressed: () {
                                          print('IconButton pressed ...');
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(24, 20, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${planData?.itemDescription}',
                          style: FlutterFlowTheme.of(context).headlineMedium,
                        ),
                        Text(
                          '${planData?.itemPrice}',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: CachedNetworkImage(
                            imageUrl:'',
                            fit: BoxFit.cover,
                            width: 60,
                            height: 60,
                            errorWidget: (contxt,url,data){
                              return Image.asset('assets/icons/profile.jpeg');
                            },
                          ),
                        ),
                        Text(
                          trainerData?.itemDescription??'',
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                        Text(
                          'Price : ${trainerData?.itprRetlPrice??0}',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DateRangePicker(from: TimeStatus.to, initialTime:DateTime.now(), duration:Duration(days:  planData?.noOfDays??0,)),
                    ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(24, 16, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'DESCRIPTION',
                          style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Readex Pro',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                    child: Row(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${planData?.itemDescription}',
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                            Text(
                              'Duration: ${planData?.durationByDay??'N/A'}',
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                            Text(
                              'Days: ${planData?.noOfDays??'N/A'}',
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                            Text(
                              'Months: ${planData?.noOfMonths??'N/A'}',
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  offset: const Offset(0, 2),
                )
              ],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: CheckOutConteainer(
              builder: (BuildContext context, ProjectStore store, VxStatus state) {
                return Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 52),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FFButtonWidget(
                        onPressed: () {
                          // List<PaymentSdkAPms> apms = [];
                          // apms.add(PaymentSdkAPms.AMAN);
                          // var billingDetails = BillingDetails(
                          //     "John Smith",
                          //     "email@domain.com",
                          //     "+97311111111",
                          //     "st. 12",
                          //     "eg",
                          //     "dubai",
                          //     "dubai",
                          //     "12345"
                          // );
                          // var shippingDetails = ShippingDetails(
                          //     "John Smith",
                          //     "email@domain.com",
                          //     "+97311111111",
                          //     "st. 12",
                          //     "eg",
                          //     "dubai",
                          //     "dubai",
                          //     "12345"
                          // );
                          // var configuration =  PaymentSdkConfigurationDetails(
                          //     profileId: "001900",
                          //     serverKey: "SHJNKWHWK2-J6L2JTTLKH-BKKZKNJH9W",
                          //     clientKey: "CQKM7K-V7TM6G-BM677B-VRK97P",
                          //     cartId: "12433",
                          //     cartDescription: "Flowers",
                          //     merchantName: "Flowers Store",
                          //     screentTitle: "Pay with Card",
                          //     amount: 20.0,
                          //     showBillingInfo: true,
                          //     forceShippingInfo: false,
                          //     currencyCode: "AED",
                          //     merchantCountryCode: "AE",
                          //     billingDetails: billingDetails,
                          //     shippingDetails: shippingDetails,
                          //     alternativePaymentMethods: apms,
                          //     linkBillingNameWithCardHolderName: true);
                          //
                          // var theme = IOSThemeConfigurations();
                          // theme.logoImage = "assets/logo.png";
                          // configuration.iOSThemeConfigurations = theme;
                          // var savedCardInfo = PaymentSDKSavedCardInfo("4000000000000002", "card type");
                          // FlutterPaytabsBridge.startCardPayment(configuration, (event) {
                          //   if (event["status"] == "success") {
                          //     var transactionDetails = event["data"];
                          //     if (kDebugMode) {
                          //       print(transactionDetails);
                          //     }
                          //     if (transactionDetails["isSuccess"]) {
                          //       if (kDebugMode) {
                          //         print("successful transaction");
                          //       }
                          //     } else {
                          //       if (kDebugMode) {
                          //         print("failed transaction");
                          //       }
                          //     }
                          //   } else if (event["status"] == "error") {
                          //     if (kDebugMode) {
                          //       print("Error: $event");
                          //     }
                          //   } else if (event["status"] == "event") {
                          //     if (kDebugMode) {
                          //       print(event);
                          //     }
                          //   }
                          // });
                          // if (kDebugMode) {
                          //   print('Button pressed ...');
                          // }
                          sl<CheckoutEvent>()(data: CheckoutData(user:stored.userdata, methode: PaymentMethode.card),context: context);
                        },
                        text: 'Pay Now',
                        icon: Icon(
                          Icons.payment_sharp,
                          color: FlutterFlowTheme.of(context).secondaryBackground,
                          size: 20,
                        ),
                        options: FFButtonOptions(
                          width: 160,
                          height: 50,
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: FlutterFlowTheme.of(context).primaryText,
                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Outfit',
                            color:FlutterFlowTheme.of(context).secondaryBackground,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          elevation: 0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2,
                          ),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async{
                          TabbyWebView.showWebView(
                            context: context,
                            webUrl:(await sl<CheckoutEvent>().payTabby(data: CheckoutData(user:stored.userdata, methode: PaymentMethode.card))).availableProducts.installments!.webUrl,
                            onResult: (WebViewResult resultCode) {
                              if (kDebugMode) {
                                print(resultCode.name);
                              }
                            },
                          );
                        },
                        text: 'Tabby',
                        icon: const Icon(
                          Icons.payments,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          width: 160,
                          height: 50,
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Outfit',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          elevation: 3,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
