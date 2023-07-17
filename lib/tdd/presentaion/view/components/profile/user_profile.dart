import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_me_v2/rought_genrator.dart';
import 'package:cloud_me_v2/tdd/domain/entities/vx_store.dart';
import 'package:cloud_me_v2/tdd/presentaion/view/screens/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:tekartik_common_utils/common_utils_import.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/util/config/user_config.dart';
import '../../../../../core/util/presentation/flutter_flow/flutter_flow_icon_button.dart';
import '../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import '../../../../../injection_container.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () {
           navigate.pushReplace(context, name: Routename.home,parms: {
             'page':BottemNavigationsData.dashboard.name
           });
          },
        ),
        title: Text(
          'Profile',
          style: FlutterFlowTheme.of(context).bodyLarge,
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 3,
                      color: Color(0x33000000),
                      offset: Offset(0, 1),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).accent2,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).secondary,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: CachedNetworkImage(
                              imageUrl:
                              stored.userdata?.custImage??'',
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                              errorWidget: (context,url,_)=>Image.asset('assets/icons/user_profile.png'),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              stored.userdata?.custName??'',
                              style: FlutterFlowTheme.of(context).headlineSmall,
                            ),
                            Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                stored.userdata?.email??'',
                                style: FlutterFlowTheme.of(context).labelSmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
              child: Text(
                'Account',
                style: FlutterFlowTheme.of(context).labelLarge,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
            //   child: Container(
            //     width: double.infinity,
            //     height: 60,
            //     decoration: BoxDecoration(
            //       color: FlutterFlowTheme.of(context).secondaryBackground,
            //       boxShadow: const [
            //         BoxShadow(
            //           blurRadius: 5,
            //           color: Color(0x3416202A),
            //           offset: Offset(0, 2),
            //         )
            //       ],
            //       borderRadius: BorderRadius.circular(12),
            //       shape: BoxShape.rectangle,
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            //       child: Row(
            //         mainAxisSize: MainAxisSize.max,
            //         children: [
            //           Icon(
            //             Icons.attach_money_rounded,
            //             color: FlutterFlowTheme.of(context).secondaryText,
            //             size: 24,
            //           ),
            //           Expanded(
            //             child: Padding(
            //               padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
            //               child: Text(
            //                 'Payment Options',
            //                 style: FlutterFlowTheme.of(context).bodyLarge,
            //               ),
            //             ),
            //           ),
            //           Align(
            //             alignment: const AlignmentDirectional(0.9, 0),
            //             child: Icon(
            //               Icons.arrow_forward_ios,
            //               color: FlutterFlowTheme.of(context).secondaryText,
            //               size: 18,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
            //   child: Container(
            //     width: double.infinity,
            //     height: 60,
            //     decoration: BoxDecoration(
            //       color: FlutterFlowTheme.of(context).secondaryBackground,
            //       boxShadow: const [
            //         BoxShadow(
            //           blurRadius: 5,
            //           color: Color(0x3416202A),
            //           offset: Offset(0, 2),
            //         )
            //       ],
            //       borderRadius: BorderRadius.circular(12),
            //       shape: BoxShape.rectangle,
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            //       child: Row(
            //         mainAxisSize: MainAxisSize.max,
            //         children: [
            //           Icon(
            //             Icons.language_outlined,
            //             color: FlutterFlowTheme.of(context).secondaryText,
            //             size: 24,
            //           ),
            //           Expanded(
            //             child: Padding(
            //               padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
            //               child: Text(
            //                 'Country',
            //                 style: FlutterFlowTheme.of(context).bodyLarge,
            //               ),
            //             ),
            //           ),
            //           Align(
            //             alignment: const AlignmentDirectional(0.9, 0),
            //             child: Icon(
            //               Icons.arrow_forward_ios,
            //               color: FlutterFlowTheme.of(context).secondaryText,
            //               size: 18,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
            //   child: Container(
            //     width: double.infinity,
            //     height: 60,
            //     decoration: BoxDecoration(
            //       color: FlutterFlowTheme.of(context).secondaryBackground,
            //       boxShadow: const [
            //         BoxShadow(
            //           blurRadius: 5,
            //           color: Color(0x3416202A),
            //           offset: Offset(0, 2),
            //         )
            //       ],
            //       borderRadius: BorderRadius.circular(12),
            //       shape: BoxShape.rectangle,
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            //       child: Row(
            //         mainAxisSize: MainAxisSize.max,
            //         children: [
            //           Icon(
            //             Icons.notifications_none,
            //             color: FlutterFlowTheme.of(context).secondaryText,
            //             size: 24,
            //           ),
            //           Expanded(
            //             child: Padding(
            //               padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
            //               child: Text(
            //                 'Notification Settings',
            //                 style: FlutterFlowTheme.of(context).bodyLarge,
            //               ),
            //             ),
            //           ),
            //           Align(
            //             alignment: const AlignmentDirectional(0.9, 0),
            //             child: Icon(
            //               Icons.arrow_forward_ios,
            //               color: FlutterFlowTheme.of(context).secondaryText,
            //               size: 18,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            ListIconButton(icon:Icons.account_circle_outlined,text:'Edit Profile',onClick:() async {
              navigate.push(context, name: Routename.editprofile);
            },),
            ListIconButton(icon:Icons.person,text:'Professional Details',onClick:() async {
              navigate.push(context, name: Routename.officialDetails);
            },),
            ListIconButton(icon:Icons.credit_card,text:'Emirate id Details',onClick:() async {
              navigate.push(context, name: Routename.editEmiratesid);
            },),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
              child: Text(
                'General',
                style: FlutterFlowTheme.of(context).labelLarge,
              ),
            ),
            ListIconButton(icon:Icons.help_outline_rounded,text:'WhatsApp',onClick:() async {
              var whatsapp ="+919144040888";
              var whatsappURl_android = "whatsapp://send?phone=$whatsapp&text=hello";
              var whatappURL_ios ="https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
              if(Platform.isIOS){
                // for iOS phone only
                if( await canLaunch(whatappURL_ios)){
                  await launch(whatappURL_ios, forceSafariVC: false);
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("whatsapp no installed")));

                }
              }else{
                // android , web
                if( await canLaunch(whatsappURl_android)){
                  await launch(whatsappURl_android);
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("whatsapp no installed")));
                }
              }
            },),
            ListIconButton(icon:Icons.logout,text:'LogOut',onClick:() async {
               sl<Configration>().custTocken = null;
           navigate.pushReplace(context, name: Routename.login);
            },),
            // Padding(
            //   padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
            //   child: Container(
            //     width: double.infinity,
            //     height: 60,
            //     decoration: BoxDecoration(
            //       color: FlutterFlowTheme.of(context).secondaryBackground,
            //       boxShadow: const [
            //         BoxShadow(
            //           blurRadius: 5,
            //           color: Color(0x3416202A),
            //           offset: Offset(0, 2),
            //         )
            //       ],
            //       borderRadius: BorderRadius.circular(12),
            //       shape: BoxShape.rectangle,
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            //       child: Row(
            //         mainAxisSize: MainAxisSize.max,
            //         children: [
            //           Icon(
            //             Icons.privacy_tip_rounded,
            //             color: FlutterFlowTheme.of(context).secondaryText,
            //             size: 24,
            //           ),
            //           Expanded(
            //             child: Padding(
            //               padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
            //               child: Text(
            //                 'Terms of Service',
            //                 style: FlutterFlowTheme.of(context).bodyLarge,
            //               ),
            //             ),
            //           ),
            //           Align(
            //             alignment: const AlignmentDirectional(0.9, 0),
            //             child: Icon(
            //               Icons.arrow_forward_ios,
            //               color: FlutterFlowTheme.of(context).secondaryText,
            //               size: 18,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
            //   child: Container(
            //     width: double.infinity,
            //     height: 60,
            //     decoration: BoxDecoration(
            //       color: FlutterFlowTheme.of(context).secondaryBackground,
            //       boxShadow: const [
            //         BoxShadow(
            //           blurRadius: 5,
            //           color: Color(0x3416202A),
            //           offset: Offset(0, 2),
            //         )
            //       ],
            //       borderRadius: BorderRadius.circular(12),
            //       shape: BoxShape.rectangle,
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            //       child: Row(
            //         mainAxisSize: MainAxisSize.max,
            //         children: [
            //           Icon(
            //             Icons.ios_share,
            //             color: FlutterFlowTheme.of(context).secondaryText,
            //             size: 24,
            //           ),
            //           Expanded(
            //             child: Padding(
            //               padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
            //               child: Text(
            //                 'Invite Friends',
            //                 style: FlutterFlowTheme.of(context).bodyLarge,
            //               ),
            //             ),
            //           ),
            //           Icon(
            //             Icons.arrow_forward_ios,
            //             color: FlutterFlowTheme.of(context).secondaryText,
            //             size: 18,
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    )
    ;
  }
}

class ListIconButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function()? onClick;

  const ListIconButton({
    super.key, required this.icon, required this.text, required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                color: Color(0x3416202A),
                offset: Offset(0, 2),
              )
            ],
            borderRadius: BorderRadius.circular(12),
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  icon,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: Text(
                      text,
                      style: FlutterFlowTheme.of(context).bodyLarge,
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.9, 0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
