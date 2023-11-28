import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:rising_gym/core/helper/toast_builder/toast_controller.dart';
import 'package:rising_gym/core/usecases/usecase.dart';
import 'package:rising_gym/rought_genrator.dart';
import 'package:rising_gym/tdd/domain/modle/vx_store.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../../core/util/file_upload/file_uploadf.dart';
import '../../../../../../core/util/presentation/flutter_flow/flutter_flow_icon_button.dart';
import '../../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import '../../../../../../core/util/presentation/flutter_flow/flutter_flow_widgets.dart';
import '../../../../../../injection_container.dart';
import '../../../../../domain/modle/contry_data.dart';
import '../../../../modules/edit_profile/edit_profile_module_consumer.dart';
import '../../../../modules/edit_profile/edit_profile_module_controller.dart';


class EditProfile extends StatefulWidget {
  final EditMethode methode;

  const EditProfile({Key? key,required this.methode}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      EditProfileModuleEvent.initialState(widget.methode);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    stored.userdata?.custName;
    return Scaffold(
      // key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            title: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
              child: Column(
                mainAxisSize:
                MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 50,
                            icon: Icon(
                              Icons.arrow_back_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 30,
                            ),
                            onPressed: () async {
                              navigate.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            centerTitle: true,
            expandedTitleScale: 1.0,
          ),
          elevation: 0,
        ),
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if(widget.methode == EditMethode.personal)
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child:ImagePickerWidget(image: EditProfileModuleEvent.profileImageString??stored.userdata?.custImage??'',
                        errorAssetspath: 'assets/icons/user_profile.png',
                        onImageChange: (String base64, File file, Uint8List byte) async{
                          // Clipboard.setData(ClipboardData(text: base64));
                          // Filemanager.uploadFile(context,file,'randome');
                          final p = await Filemanager.uploadFile(file, '${stored.userdata?.memCode??000}_profile','customer_profile_edit','cust_image');
                          p.fold((l) => CoolAlert.show(
                            context: context,
                            type: CoolAlertType.error,
                            text: "Upload Failed!",
                          ), (r) => CoolAlert.show(
                            context: context,
                            type: CoolAlertType.success,
                            text: "Uploaded successful!",
                          ));

                        },
                      ),
                    ),
                    Text(stored.userdata?.custMob??''),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                      child: TextFormField(
                        controller: EditProfileModuleEvent.yourNameController,
                        textCapitalization: TextCapitalization.words,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Your Name',
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        // validator: sl<EditProfileModuleEvent>().yourNameControllerValidator.asValidator(context),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Select Country",style: FlutterFlowTheme.of(context).labelMedium,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
                          child: ValueListenableBuilder<String?>(
                              valueListenable: EditProfileModuleEvent.selectedContry,
                              builder: (context,store,_) {
                                print("store:$store");
                                return DropdownButton<String?>(
                                    value: store??contry.map((e) => e['key'].toString()).first,
                                    items: contry.map((e) => DropdownMenuItem<String?>(
                                      value:e['key'].toString(),
                                      child: Text("${e['name']}",style: FlutterFlowTheme.of(context).labelMedium,),)).toList(),
                                    onChanged: (value)=>EditProfileModuleEvent.selectContry(value));
                              }
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                      child: TextFormField(
                        controller: EditProfileModuleEvent.cityController,
                        textCapitalization: TextCapitalization.words,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Your State',
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        // validator: _model.cityControllerValidator.asValidator(context),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                    //   child: TextFormField(
                    //     controller: sl<EditProfileModuleEvent>().cityController,
                    //     textCapitalization: TextCapitalization.words,
                    //     obscureText: false,
                    //     decoration: InputDecoration(
                    //       labelText: 'Your City',
                    //       labelStyle: FlutterFlowTheme.of(context).labelMedium,
                    //       hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    //       enabledBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //           color: FlutterFlowTheme.of(context).alternate,
                    //           width: 2,
                    //         ),
                    //         borderRadius: BorderRadius.circular(8),
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //           color: FlutterFlowTheme.of(context).primary,
                    //           width: 2,
                    //         ),
                    //         borderRadius: BorderRadius.circular(8),
                    //       ),
                    //       errorBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //           color: FlutterFlowTheme.of(context).error,
                    //           width: 2,
                    //         ),
                    //         borderRadius: BorderRadius.circular(8),
                    //       ),
                    //       focusedErrorBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //           color: FlutterFlowTheme.of(context).error,
                    //           width: 2,
                    //         ),
                    //         borderRadius: BorderRadius.circular(8),
                    //       ),
                    //       filled: true,
                    //       fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    //       contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                    //     ),
                    //     style: FlutterFlowTheme.of(context).bodyMedium,
                    //     // validator: _model.cityControllerValidator.asValidator(context),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
                      child: TextFormField(
                        controller: EditProfileModuleEvent.myBioController,
                        textCapitalization: TextCapitalization.sentences,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintText: 'Your Address',
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        textAlign: TextAlign.start,
                        maxLines: 3,
                        // validator: _model.myBioControllerValidator.asValidator(context),
                      ),
                    ),
                  ],
                ),
              ),
            if(widget.methode == EditMethode.professional)
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                      child: TextFormField(
                        controller: EditProfileModuleEvent.companynameController,
                        textCapitalization: TextCapitalization.words,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Company Name',
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        // validator: sl<EditProfileModuleEvent>().yourNameControllerValidator.asValidator(context),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                      child: TextFormField(
                        controller: EditProfileModuleEvent.emergencynumberController,
                        textCapitalization: TextCapitalization.words,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Emergency Number',
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        // validator: sl<EditProfileModuleEvent>().yourNameControllerValidator.asValidator(context),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                      child: TextFormField(
                        controller: EditProfileModuleEvent.emergencyAddressController,
                        textCapitalization: TextCapitalization.words,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Emergency Address',
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        // validator: sl<EditProfileModuleEvent>().yourNameControllerValidator.asValidator(context),
                      ),
                    ),
                  ],
                ),
              ),
            if(widget.methode == EditMethode.emiratesid)
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child:ImagePickerWidget(height:200,width:350,shape:BoxShape.rectangle,image: "${stored.userdata?.emiratesId}",
                        onImageChange: (String base64, File file, Uint8List byte) async{
                          // sl<EditProfileModuleEvent>().setEmeratesId(base64);
                          final p = await Filemanager.uploadFile(file, '${stored.userdata?.memCode??000}_profile','customer_profile_edit','emirates_id');
                          p.fold((l) => CoolAlert.show(
                            context: context,
                            type: CoolAlertType.error,
                            text: "Upload Failed!",
                          ), (r) => CoolAlert.show(
                            context: context,
                            type: CoolAlertType.success,
                            text: "Uploaded successful!",
                          ));

                          // print("response Data: $p");
                        }, errorAssetspath: 'assets/icons/emirates_id_card.png',
                      ),
                    ),
                  ],
                ),
              ),
            if(widget.methode != EditMethode.emiratesid)
              Align(
                alignment: const AlignmentDirectional(0, 0.05),
                child: Column(
                  children: [
                    const Text("Upload User Data",),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                      child: EditProfileModuleContainer(
                          builder: (context,store,status) {
                            return FFButtonWidget(
                              showLoadingIndicator:status == VxStatus.loading ,
                              onPressed: () {
                                sl<EditProfileModuleEvent>()(data: NoPrams());
                                // print('Button pressed ...');
                              },
                              text: 'Save Changes',
                              options: FFButtonOptions(
                                width: 270,
                                height: 50,
                                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                                elevation: 2,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            );
                          }
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class ImagePickerWidget extends StatelessWidget {
  final String image;
  final Function(String base64,File file,Uint8List byte) onImageChange;
  final String errorAssetspath;
  final BoxShape shape;
  final double width;
  final double height;
  ValueNotifier<Widget?> imageWidget = ValueNotifier(null);
  ImagePickerWidget({
    required this.image,
    required this.errorAssetspath,
    this.width = 100,
    this.height = 100,
    this.shape = BoxShape.circle,
    super.key, required this.onImageChange,
  });

  @override
  Widget build(BuildContext context) {
    Future<void> getLostData() async {
      try {
        final ImagePicker picker = ImagePicker();
        final XFile? response = await  picker.pickImage(source: ImageSource.gallery);
        if (response != null) {
          final imagefile =  File(response.path);
          Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
          String base64string = base64.encode(imagebytes); //co
          Uint8List decodedbytes = base64.decode(base64string);
          imageWidget.value = Image.memory(decodedbytes); //
          imageWidget.notifyListeners();
          // nvert bytes to base64 string
          onImageChange(base64string,imagefile,imagebytes);

        } else {
          CToast.toast(context, msg: "Something Went Wrong").error;
        }
      } catch (e) {
        print("error:$e");
        CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          text: "Upload Failed!",
        );
      }
    }
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: ()=> getLostData(),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).alternate,
          shape: shape,
        ),
        child: ValueListenableBuilder(
            valueListenable: imageWidget,
            builder: (context,imageUrl,_) {
              return Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child:imageUrl ?? CachedNetworkImage(
                    imageUrl:image,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorWidget: (context,url,_)=>Image.asset(errorAssetspath),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}
