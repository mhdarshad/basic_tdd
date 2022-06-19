
import 'package:asspa/core/util/presentation/constants/ic_constants.dart';
import 'package:asspa/rought_genrator.dart';
import 'package:asspa/tdd/domain/entities/user/kyc_update_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../injection_container.dart';
import '../../../../../domain/entities/vx_store.dart';
import '../../../../../domain/usecase/kyc/kyc_update_usecase.dart';
import '../../../../events/user_update/kyc_update.dart';
import '../../../widgets/butttons/form_confirm_button.dart';
import '../../../widgets/textForm/ProductTextForm.dart';

class KYC extends StatefulWidget {
  const KYC({Key? key}) : super(key: key);

  @override
  _KYCState createState() => _KYCState();
}

class _KYCState extends State<KYC> with GoNavigations{

  late TextEditingController _text_bank_name_controller;
  late TextEditingController _text_customer_name_controller;
  late TextEditingController _text_account_number_controller;
  late TextEditingController _text_ifsc_code_controller;
  late TextEditingController _text_branch_controller ;
  late TextEditingController _text_pan_card_controller;
  late TextEditingController _text_address_controller;
  late ValueNotifier validated = ValueNotifier<bool>(false);
  @override
  void initState() {
    // TODO: implement initState
   final KycUpdateModel variableName =  (VxState.store as ProjectStore).kyc_data;
   _text_bank_name_controller = TextEditingController(text: variableName.bankName??'');
   _text_customer_name_controller = TextEditingController(text: variableName.holderName??'');
   _text_account_number_controller = TextEditingController(text: variableName.accountNumber??'');
   _text_ifsc_code_controller = TextEditingController(text: variableName.ifsc??'');
   _text_branch_controller = TextEditingController(text: variableName.branchName??'');
   _text_pan_card_controller = TextEditingController(text: variableName.panCard??'');
   _text_address_controller = TextEditingController(text: variableName.address??'');
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
   // _listentovalue();
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor.withAlpha(45),
      body: Container(color: Colors.white,
        margin: EdgeInsets.only(left: 20,top: 20,right: 20),
        child: ListView(
          scrollDirection:Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Wrap(textDirection: TextDirection.rtl,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                      'assets/images/verification.svg',
                      width: 400,
                      semanticsLabel: 'verification'
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      'Verify your identity'.text.bold.size(25).make().p12(),
                      'Confirm your personal information to get your account ready to receive payments.'.text.make().p12(),
                    ],
                  ),
                ],
              ),
            ),
            Card(margin: const EdgeInsets.all(10),color: Colors.white,child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              //      Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Row(
              //                   children: [
              //                     SizedBox(
              //                       width:200,
              //                       height: 120,
              //                       child: Card(
              //                         margin: EdgeInsets.all(8),
              //                         elevation: 2,
              //                         child: Padding(
              //                           padding: const EdgeInsets.all(8.0),
              //                           child: Column(
              //                             crossAxisAlignment: CrossAxisAlignment.start,
              //                             children: [
              //                               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              //                                 Icon(Icons.monetization_on_rounded,color: Theme.of(context).primaryColor,size: 40),
              //                                 "Syndicate Bank".text.bold.make()
              //                               ],),
              //                               "0000000000000000".text.make().py12(),
              //                             ],
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //                 if(LayoutView(context).isWeb)
              //                 SizedBox(
              //                   width:200,
              //                   height: 120,
              //                   child: Card(
              //                     margin: EdgeInsets.all(8),
              //                     elevation: 2,
              //                     child: Padding(
              //                       padding: const EdgeInsets.all(8.0),
              //                       child: Center(
              //                         child: Column(
              //                           crossAxisAlignment: CrossAxisAlignment.start,
              //                           children: [
              //                             Icon(Icons.add,color: Theme.of(context).primaryColor,size: 40).centered(),
              //                             "Syndicate Bank".text.bold.make()
              //                           ],
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             if(!LayoutView(context).isWeb)
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.end,
              //               children: [
              //                 SizedBox(
              //                   height: 40,
              //                   child: CustomeButton(ontap: (){},
              //                       icon: const Icon(Icons.add,color: Colors.white),
              //                       text: "Add Account",
              //                       fontsize: 6),
              //                 ),
              //               ],
              //             ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                  "Bank Details".text.make().p12(),
                  SizedBox(height: 60,child: ProductTextForm(labelText: "Full Name",keytype: TextInputType.text,controller: _text_customer_name_controller,textsize: 10,)),
                  SizedBox(height: 60,child: ProductTextForm(labelText: "Bank Name",keytype: TextInputType.text,controller: _text_bank_name_controller,textsize: 10,)),
                  SizedBox(height: 60,child: ProductTextForm(labelText: "Account Number",keytype: TextInputType.text,controller: _text_account_number_controller,textsize: 10,)),
                  SizedBox(height: 60,child: ProductTextForm(labelText: "IFSC Code",keytype: TextInputType.text,controller: _text_ifsc_code_controller,textsize: 10,)),
                  SizedBox(height: 60,child: ProductTextForm(labelText: "Branch",keytype: TextInputType.text,controller: _text_branch_controller,textsize: 10,))
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                  "Identity verification".text.make().p12(),
                  SizedBox(height: 60,child: ProductTextForm(labelText: "Pan Card",keytype: TextInputType.text,controller: _text_pan_card_controller,textsize: 10,)),
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                  "Address verification".text.make().p12(),
                  SizedBox(child: ProductTextForm(labelText: "Address",keytype: TextInputType.streetAddress,maxlines: 4,controller: _text_address_controller,textsize: 10,)),
                ],),
              ),VxConsumer(
                notifications: {
                  KycUpdateEvents:(ctx,mut, {status}){
                    if(status==VxStatus.error){
                      VxToast.show(context, msg: VxStatus.error.name);
                    }else if(status == VxStatus.success){
                      GNavigation(context, type: NavigatoreTyp.pushReplacment,name: Routename.Home,parms: {'index':'dashboard','user':'user'});
                    }
                  }
                },
                builder: (context,store,status) {

                  return  FormCnfirmButtons(enable: true,loading: status==VxStatus.loading,
                      oncancle: (){

                  },onsubmit: (){
                    sl<KycUpdateBloc>()(data: KycUpdateModle(address: _text_address_controller.text,accountNumber: _text_account_number_controller.text,bankName: _text_bank_name_controller.text,branchName: _text_branch_controller.text,holderName: _text_customer_name_controller.text,ifsc: _text_ifsc_code_controller.text,uid: sl<SharedPreferences>().getString(SFkeys.UID),panCard: _text_pan_card_controller.text));
                  });
                }, mutations: const {KycUpdateEvents},
              ),
            ],)),
          ],
        ),),
    );
  }
// bool? name,bank_name,ac_no,ifsc,branch,pan,address;
//   void _listentovalue() {
//     _text_customer_name_controller.addListener(() {validated.value = _validate(name: _text_customer_name_controller.text.isNotEmpty)? true:false;validated.notifyListeners();});
//     _text_bank_name_controller.addListener(() {validated.value = _validate(name: _text_bank_name_controller.text.isNotEmpty)? true:false;validated.notifyListeners();});
//     _text_account_number_controller.addListener(() {validated.value = _validate(name: _text_account_number_controller.text.isNotEmpty)? true:false;validated.notifyListeners();});
//     _text_ifsc_code_controller.addListener(() { validated.value = _validate(name: _text_ifsc_code_controller.text.isNotEmpty)? true:false;validated.notifyListeners();});
//     _text_branch_controller.addListener(() { validated.value = _validate(name: _text_branch_controller.text.isNotEmpty)? true:false;validated.notifyListeners();});
//     _text_pan_card_controller.addListener(() {validated.value = _validate(name: _text_pan_card_controller.text.isNotEmpty)? true:false; validated.notifyListeners();});
//     _text_address_controller.addListener(() { validated.value = _validate(name: _text_address_controller.text.isNotEmpty)? true:false;
//     validated.notifyListeners();});
//   }
//   bool _validate({bool? name,bool?bank_name,bool?ac_no,bool?ifsc,bool?branch,bool?pan,bool?address}){
//     if(name!=null){
//       this.name = name;
//     } if(bank_name!=null){
//       this.bank_name = bank_name;
//     } if(ac_no!=null){
//       this.ac_no = ac_no;
//     } if(ifsc!=null){
//       this.ifsc = ifsc;
//     } if(branch!=null){
//       this.branch = branch;
//     } if(pan!=null){
//       this.pan = pan;
//     }if(address!=null){
//       this.address = address;
//     }
//     if((this.name??false)&&(this.bank_name??false)&&(this.ac_no??false)&&(this.ifsc??false)&&(this.branch??false)&&(this.pan??false)&&(this.address??false)){
//       return true;
//     }else{
//       return false;
//     }
//   }
}



