import 'package:asspa/rought_genrator.dart';
import 'package:dartz/dartz.dart' as dz;
import 'package:number_pagination/number_pagination.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../../core/error/failuers.dart';
import '../../../../../../core/usecases/usecase.dart';
import '../../../../../../core/util/presentation/constants/ic_constants.dart';
import '../../../../../../injection_container.dart';
import '../../../../../domain/entities/user/login_user.dart';
import '../../../../../domain/entities/vx_store.dart';
import '../../../../../domain/usecase/get_dash_data.dart';
import '../../../../../domain/usecase/update_membership_status.dart';
import '../../../../events/dashboard/get_user_data.dart';
import '../../../../events/dashboard/update_wallet.dart';
import '../../../../events/user_update/fetch_kycs.dart';
import '../../../../events/user_update/kyc_status_update.dart';
import '../../../widgets/dailog/custome_dailog1.dart';
import '../../../widgets/flutter_flow/flutter_flow_drop_down.dart';
import '../../../widgets/flutter_flow/flutter_flow_theme.dart';
import '../../../widgets/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

import '../../../widgets/list/pagination_index_controller_widget.dart';
import '../../../widgets/textForm/ProductTextForm.dart';

class KycLsitWidget extends StatefulWidget {
  final USTatus status;

  const KycLsitWidget({Key? key,this.status = USTatus.all}) : super(key: key);

  @override
  _KycLsitWidgetState createState() => _KycLsitWidgetState();
}
class _KycLsitWidgetState extends State<KycLsitWidget> with GoNavigations{
  String? dropDownValue;
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ValueNotifier<int> selectedPageNumber = ValueNotifier(1);

  @override
  void initState() {
    super.initState();
    // sl<GetUserDataBloc>()(data: Param({'pageno':(VxState.store as ProjectStore).pagination?.currentPage??'1','u_status':widget.status.name}));

    sl<FetchKycsBloc>()(data: Param({'pageno':(VxState.store as ProjectStore).pagination?.currentPage??'1','status':widget.status.name}));
    textController = TextEditingController();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor.withAlpha(45),
      body: buildSingleChildScrollView(context),
    );
  }

  SingleChildScrollView buildSingleChildScrollView(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              buildHeader(context),
              buildBody(),
            ],
          ),
        ),
      ),
    );
  }

  VxBuilder<dynamic> buildBody() {
    return VxBuilder(
        mutations: const {FetchKycsEvents},
        builder: (BuildContext context, store, VxStatus? status) {
          if(status == VxStatus.loading) {
            return SizedBox(height:MediaQuery.of(context).size.height,child: const Center(child: CircularProgressIndicator()));
          }
          final userData = (store as ProjectStore).usersData;
          final kycData = (store).users_kyc;
          return (kycData.isNotEmpty)?
          Column(
            children:[...kycData.map((e) {
              final  variableName = _getUserData(e.uid!);
              return FutureBuilder<dz.Either<Failure, UserData>>(
                future: variableName,
                builder: (BuildContext context, snapshot) {
                   String username =  '';
                   String accountnumber =  '';
                  snapshot.data?.fold((l) {
                     username = e.holderName!;
                     accountnumber = e.accountNumber!;
                  } , (r) {
                    username = '${r.data?.first.user?.fname} ${r.data?.first.user?.lname} ';
                    accountnumber = r.data?.first.user?.acountno??'';
                  });
                 return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                'Fundraiser',
                                style: FlutterFlowTheme.of(context).bodyText2.override(
                                  fontFamily: 'Lexend Deca',
                                  color: const Color(0xFF4B39EF),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: 1,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF1F4F8),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                '$username ($accountnumber)',
                                style: FlutterFlowTheme.of(context).subtitle1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF090F13),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                '${e.holderName}\n${e.bankName}\n${e.accountNumber}\n${e.ifsc}\n${e.branchName}\n',
                                style: FlutterFlowTheme.of(context).bodyText2.override(
                                  fontFamily: 'Lexend Deca',
                                  color: const Color(0xFF95A1AC),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(12, 4, 12, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if(e.status??false)
                              FFButtonWidget(
                                onPressed: () {
                                  sl<KycUpdateStatusBloc>()(data: ActivateParam(e.uid??'',true));
                                },
                                text: 'Aprove',
                                options: FFButtonOptions(
                                  width: 150,
                                  height: 50,
                                  color: const Color(0xFF4B39EF),
                                  textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  elevation: 2,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 40,
                                ),
                              ),
                            const Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 4),
                              child: Icon(
                                Icons.location_on_sharp,
                                color: const Color(0xFF4B39EF),
                                size: 20,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                              child: Text(
                                '76, badagubettu, indiranagar, kukkikatte, udupi,576101',
                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: const Color(0xFF4B39EF),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            }
            ),
              PaginationIndexControllerWidget(selectedPageNumber: selectedPageNumber,onPageChange: (pageNumber){
                selectedPageNumber.value = pageNumber;
                sl<GetUserDataBloc>()(data: Param({'pageno':pageNumber.toString(),'u_status':dropDownValue}));
              },)
            ],
          ):const SizedBox.shrink();
        });
  }

  void buildCustomDialogEditWallet(BuildContext context, TextEditingController _othertextcontroller, TextEditingController _businesstextcontroller, TextEditingController _autofilltextcontroller, TextEditingController _refrencetextcontroller, TextEditingController _reoyalitytextcontroller, UsersData selecteduser) {
    return showCustomDialog(context,
      height: 300,
      width: 400,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Update Wallet",style: TextStyle(fontSize: 25,color: Colors.green,fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children:  [
                Expanded(child: ProductTextForm(labelText: 'Other', prfix: 'AP',textsize: 16,controller: _othertextcontroller,keytype: TextInputType.number,)),
                Expanded(child: ProductTextForm(labelText: 'Business', prfix: 'AP', textsize: 16, controller: _businesstextcontroller,keytype: TextInputType.number,)),
                Expanded(child: ProductTextForm(labelText: 'Auto Fill', prfix: 'AP', textsize: 16, controller: _autofilltextcontroller,keytype: TextInputType.number,)),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children:  [
                Expanded(child: ProductTextForm(labelText: 'Referer', prfix: 'AP', textsize: 16, controller: _refrencetextcontroller,keytype: TextInputType.number,), ),
                Expanded(child: ProductTextForm(labelText: 'Royalty', prfix: 'AP', textsize: 16, controller: _reoyalitytextcontroller,keytype: TextInputType.number,), )
              ]),
            ),
            MaterialButton(
              onPressed: () {
                debugPrint("updated: ot ${_othertextcontroller.text} , bus ${_businesstextcontroller.text} , af ${_autofilltextcontroller.text}");
                sl<UpdateWalletBloc>()(data: WalletParams(selecteduser.user?.uid??'',autofill_wallet: _autofilltextcontroller.text,gendral_wallet: _othertextcontroller.text,income_wallet: _businesstextcontroller.text,refrence_wallet: _refrencetextcontroller.text));
              },
              child: Card(
                color: Colors.green,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.all(6.0),
                  child: VxConsumer(
                    builder: (BuildContext context, store, VxStatus? status) {
                      return (status == VxStatus.loading) ?const CircularProgressIndicator():
                      Row  (
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text("Update",style: TextStyle(color: Colors.white,fontSize: 12)),
                          Icon(Icons.update,color: Colors.white,size: 20),
                        ],
                      );
                    },
                    mutations: const {UpdateWalletEvents}, notifications: {
                    UpdateWalletEvents:(ctx,mut, {status}){
                      if(mut.status == VxStatus.success){
                        context.pop();
                      }
                    }
                  },
                  ),
                ),
              ),
            )
          ],
        ),
      ),);
  }

  ValueListenableBuilder<int> buildPagination(ProjectStore store) {
    return ValueListenableBuilder<int>(
      builder: (BuildContext context, value, Widget? child) {
        return NumberPagination(
          onPageChanged: (int pageNumber) {
            //do somthing for selected page

          },
          pageTotal: store.pagination?.lastPage??1,
          pageInit: store.pagination?.currentPage??1,
          // picked number when init page
          colorPrimary: Theme.of(context).primaryColor,
          colorSub: Colors.white,
        );
      },
      valueListenable: selectedPageNumber,
    );
  }

  Column buildHeader(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        buildSearchBar(context),
        buildFilterDropDown(context),
      ],
    );
  }

  FlutterFlowDropDown buildFilterDropDown(BuildContext context) {
    return FlutterFlowDropDown(
      initialOption: dropDownValue ??= USTatus.all.name,
      options: USTatus.values.map((e) => e.name).toList(),
      onChanged: (val) => setState(() {
        dropDownValue = val;
        sl<FetchKycsBloc>()(data: Param({'pageno':(VxState.store as ProjectStore).pagination?.currentPage.toString()??'1','status':val}));

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
    );
  }

  Padding buildSearchBar(BuildContext context) {
    return Padding(
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
    );
  }
}

_getUserData(String uid) {
  return GetUserDataUsecase(sll()).getuser(uid: uid);

}

