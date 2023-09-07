import 'package:cached_network_image/cached_network_image.dart';
import 'package:rising_gym/core/helper/toast_builder/toast_controller.dart';
import 'package:rising_gym/core/util/calculations/calculation.dart';
import 'package:rising_gym/core/util/presentation/template/custom_scafold.dart';
import 'package:rising_gym/tdd/data/models/api/user/plans_data.dart';
import 'package:rising_gym/tdd/domain/entities/vx_store.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:in_date_utils/in_date_utils.dart';
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
                              child: CachedNetworkImage(
                                  width: double.infinity,
                                  height: double.infinity,
                                  imageUrl: planData?.image??'',
                                  errorWidget: (context,__,___){
                                    return Image.asset('assets/image/gym_image_error_2.webp' ,
                                      width: double.infinity,
                                      height: double.infinity,);
                                  },
                                  fit: BoxFit.cover
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
                                      // color: const Color(0x3A000000),
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
                                    // Card(
                                    //   clipBehavior: Clip.antiAliasWithSaveLayer,
                                    //   color: const Color(0x3A000000),
                                    //   shape: RoundedRectangleBorder(
                                    //     borderRadius: BorderRadius.circular(8),
                                    //   ),
                                    //   child: FlutterFlowIconButton(
                                    //     borderColor: Colors.transparent,
                                    //     borderRadius: 30,
                                    //     buttonSize: 46,
                                    //     icon: const Icon(
                                    //       Icons.favorite_border,
                                    //       color: Colors.white,
                                    //       size: 24,
                                    //     ),
                                    //     onPressed: () {
                                    //       print('IconButton pressed ...');
                                    //     },
                                    //   ),
                                    // ),
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
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     mainAxisSize: MainAxisSize.max,
                  //     children: [
                  //       ClipRRect(
                  //         borderRadius: BorderRadius.circular(40),
                  //         child: CachedNetworkImage(
                  //           imageUrl:trainerData?.image??'',
                  //           fit: BoxFit.cover,
                  //           width: 60,
                  //           height: 60,
                  //           errorWidget: (contxt,url,data){
                  //             return Image.asset('assets/icons/profile.jpeg');
                  //           },
                  //         ),
                  //       ),
                  //       Text(
                  //         trainerData?.itemDescription??'',
                  //         style: FlutterFlowTheme.of(context).labelMedium,
                  //       ),
                  //       Text(
                  //         'Price : ${trainerData?.itprRetlPrice??0}',
                  //         style: FlutterFlowTheme.of(context).bodyMedium,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DateRangePicker(from: TimeStatus.from, initialTime:DateTime.now(),
                            endDate:daysData(planData), viewOnly: true,),
                        ),
                      ],
                    ),
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
                              'Plan name: ${planData?.itemDescription}',
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                            Text(
                              'Plan Description: ${planData?.sec_item_description}',
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                            Text(
                              'Duration: ${planData?.durationByDay??'N/A'}',
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                            Text(
                              'Days: ${planData?.noOfDays??'N/A'} Days',
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                            Text(
                              'Months: ${planData?.noOfMonths??'N/A'} Month',
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
                          sl<CheckoutEvent>()(data: CheckoutData(user:stored.userdata!, methode: PaymentMethode.card),context: context);
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
                          showBottomSheet(context: context, builder: (context){
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: TabbyPresentationSnippet(
                                    price: '${(planData?.itemPrice??0)+(trainerData?.itprRetlPrice??0)}',
                                    currency: Currency.aed,
                                    lang: Lang.en,
                                  ),
                                ),
                                 const SizedBox(height: 24),
                                 Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: TabbyCheckoutSnippet(
                                    price: '${(planData?.itemPrice??0)+(trainerData?.itprRetlPrice??0)}',
                                    currency: Currency.aed,
                                    lang: Lang.en,
                                  ),
                                ),
                                (false)?
                                FFButtonWidget(
                                  onPressed: () async{
                                    // if(stored.userdata!=null){
                                    //   TabbyWebView.showWebView(
                                    //     context: context,
                                    //     webUrl:(await sl<CheckoutEvent>().payTabby(data: CheckoutData(user:stored.userdata!, methode: PaymentMethode.tabby))).availableProducts.installments!.webUrl,
                                    //     onResult: (WebViewResult resultCode) {
                                    //       if (kDebugMode) {
                                    //         print("Tabby response: ${resultCode.name}");
                                    //       }
                                    //     },
                                    //   );
                                    // }else{
                                    //   CToast.toast(context, msg: "Some Thing Went Wrong We Suggest you To Re-Login").error;
                                    // }

                                  },
                                  text: 'Proceed',
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
                                    color: FlutterFlowTheme.of(context).primary,
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
                                ):const Text("Not Available"),
                              ],
                            );
                          });
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
}
