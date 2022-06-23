import 'package:asspa/rought_genrator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:number_pagination/number_pagination.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../../core/usecases/usecase.dart';
import '../../../../../../core/util/presentation/constants/ic_constants.dart';
import '../../../../../../injection_container.dart';
import '../../../../../domain/entities/vx_store.dart';
import '../../../../../domain/usecase/update_membership_status.dart';
import '../../../../events/dashboard/get_user_data.dart';
import '../../../../events/dashboard/update_status.dart';
import '../../../../events/dashboard/update_wallet.dart';
import '../../../widgets/dailog/custome_dailog1.dart';
import '../../../widgets/flutter_flow/flutter_flow_drop_down.dart';
import '../../../widgets/flutter_flow/flutter_flow_icon_button.dart';
import '../../../widgets/flutter_flow/flutter_flow_theme.dart';
import '../../../widgets/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

import '../../../widgets/textForm/ProductTextForm.dart';
import '../../../widgets/list/CListView.dart';

class WithdrawerLsitWidget extends StatefulWidget {
  final USTatus status;

  const WithdrawerLsitWidget({Key? key,this.status = USTatus.all}) : super(key: key);

  @override
  _WithdrawerLsitWidgetState createState() => _WithdrawerLsitWidgetState();
}
class _WithdrawerLsitWidgetState extends State<WithdrawerLsitWidget> with GoNavigations{
  String? dropDownValue;
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ValueNotifier<int> selectedPageNumber = ValueNotifier(1);

  @override
  void initState() {
    super.initState();
    sl<GetUserDataBloc>()(data: Param({'pageno':(VxState.store as ProjectStore).pagination?.currentPage??'1','u_status':widget.status.name}));
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor.withAlpha(45),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 50),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 3,
                              color: Color(0x39000000),
                              offset: Offset(0, 1),
                            )
                          ],
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 0, 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      4, 0, 4, 0),
                                  child: TextFormField(
                                    controller: textController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Name, city, state...',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: const Color(0xFF7C8791),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0x00000000),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0x00000000),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      prefixIcon: const Icon(
                                        Icons.search_sharp,
                                        color: Color(0xFF57636C),
                                        size: 16,
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: const Color(0xFF090F13),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                child: FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text: 'Search',
                                  options: FFButtonOptions(
                                    width: 100,
                                    height: 40,
                                    color: Theme.of(context).primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    elevation: 2,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: 50,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    FlutterFlowDropDown(
                      initialOption: dropDownValue ??= USTatus.all.name,
                      options: USTatus.values.map((e) => e.name).toList(),
                      onChanged: (val) => setState(() {
                        dropDownValue = val;
                        sl<GetUserDataBloc>()(data: Param({'pageno':(VxState.store as ProjectStore).pagination?.currentPage.toString()??'1','u_status':val}));

                        // GNavigation(context, type: NavigatoreTyp.push,name: Routename.Home,parms: {'index':'downline','user':'admin'},qparms: {'user_status':val.toLowerCase()});
                      }),
                      width: 180,
                      height: 50,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                      hintText: 'All',
                      icon: const Icon(
                        Icons.filter_list,
                        size: 15,
                      ),
                      fillColor: Colors.white,
                      elevation: 2,
                      borderColor: Colors.transparent,
                      borderWidth: 0,
                      borderRadius: 0,
                      margin: const EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                      hidesUnderline: true,
                    ),
                  ],
                ),
                VxBuilder(
                    mutations: const {GetUserDataEvents,UpdateStatusEvents},
                    builder: (BuildContext context, store, VxStatus? status) {
                      if(status == VxStatus.loading) {
                        return Container(height:MediaQuery.of(context).size.height,child: const Center(child: CircularProgressIndicator()));
                      }
                      final userData = (store as ProjectStore).usersData;
                      return (userData.isNotEmpty)?
                      Column(
                        children:[...userData.map((e) => CListView(title: '${e.user?.fname} ${e.user?.lname}',discription: 'AC No: ${e.user?.acountno} Ref: ${e.user?.refid}',options: [
                         if((VxState.store as ProjectStore).user_type == 'admin')
                          (e.user?.accountstatus??'0')=='1'?
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                            child: FlutterFlowIconButton(
                              borderColor: const Color(0xFF673AB7),
                              borderRadius: 8,
                              borderWidth: 1,
                              buttonSize: 40,
                              icon: const FaIcon(
                                FontAwesomeIcons.userCheck,
                                color: Color(0xFF673AB7),
                                size: 20,
                              ),
                              onPressed: () {
                                print('Already Activated');
                              },
                            ),
                          ):Padding(
                           padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                           child: FlutterFlowIconButton(
                             borderColor: const Color(0xFF673AB7),
                             borderRadius: 8,
                             borderWidth: 1,
                             buttonSize: 40,
                             icon:  FaIcon(
                               FontAwesomeIcons.userNinja,
                               color: Colors.grey.shade600,
                               size: 20,
                             ),
                             onPressed: () {
                               sl<UpdateStatusBloc>()(data: ActivateParam(userData.firstWhere((element) => element.user?.uid == e.user?.uid).user?.uid??"",true));
                               print('IconButton pressed ...');
                             },
                           ),
                         ),
                          Padding(
                            padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                            child: FlutterFlowIconButton(
                              borderColor: const Color(0xFFDBE2E7),
                              borderRadius: 8,
                              borderWidth: 1,
                              buttonSize: 40,
                              icon: const Icon(
                                Icons.ios_share,
                                color: const Color(0xFF57636C),
                                size: 20,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ),
                          if((VxState.store as ProjectStore).user_type == 'admin')
                          FlutterFlowIconButton(
                            borderColor: const Color(0xFFDBE2E7),
                            borderRadius: 8,
                            borderWidth: 1,
                            buttonSize: 40,
                            icon: const Icon(
                              Icons.more_vert,
                              color: const Color(0xFF57636C),
                              size: 20,
                            ),
                            onPressed: () {

                            },
                          ),
                        ])),
                          ValueListenableBuilder<int>(
                            builder:
                                (BuildContext context, value, Widget? child) {
                              return NumberPagination(
                                onPageChanged: (int pageNumber) {
                                  //do somthing for selected page
                                  selectedPageNumber.value = pageNumber;
                                  sl<GetUserDataBloc>()(data: Param({'pageno':pageNumber.toString()}));
                                },
                                pageTotal: store.pagination?.lastPage??1,
                                pageInit: store.pagination?.currentPage??1,
                                // picked number when init page
                                colorPrimary: Theme.of(context).primaryColor,
                                colorSub: Colors.white,
                              );
                            },
                            valueListenable: selectedPageNumber,
                          ),
                        ],
                      ):const SizedBox.shrink();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
