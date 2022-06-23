
import 'package:asspa/core/usecases/usecase.dart';
import 'package:asspa/core/util/presentation/constants/ic_constants.dart';
import 'package:asspa/injection_container.dart';
import 'package:asspa/tdd/domain/entities/vx_store.dart';
import 'package:asspa/tdd/presentaion/events/user_update/check_kyc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../domain/usecase/transaction/payment_transation.dart';
import '../../../../events/transaction/payment_transaction.dart';
import '../../../widgets/banner/banner.dart';
import '../../../widgets/butttons/custome_button.dart';
import '../../../widgets/cards/compleate_k_y_c_dailog.dart';
import '../../../widgets/cards/edit_k_y_c_dailog.dart';
import '../../../widgets/textForm/ProductTextForm.dart';

class Withdraw extends StatefulWidget {
  const Withdraw({Key? key}) : super(key: key);

  @override
  _WithdrawState createState() => _WithdrawState();
}


class _WithdrawState extends State<Withdraw> {

  late MeterialBanners materialbanner;
  ValueNotifier<String> withdrow_amount= ValueNotifier('0');
  Map<String,dynamic> wallts = {
    'genw':'Other',
    'afw':'Auto Fill',
    'iw':'Business',
    'ref':'Referer',
    // 'rw':'',
  };

  final TextEditingController _withdrow_amount_text=TextEditingController(text: '');

  String? wallets;

  @override
  Widget build(BuildContext context) {
    _withdrow_amount_text.addListener(() {
      if(int.parse(_withdrow_amount_text.text)>int.parse(withdrow_amount.value)){
        _withdrow_amount_text.text = withdrow_amount.value;
        VxToast.show(context, msg: "You Don't Have Enough Balance");
      }
    });
    // materialbanner =  MeterialBanners (context,text: 'Please Submit your KYC to Get FUnd In Your Bank Account', actions: [
    //   TextButton(
    //     onPressed: () {},
    //     child:  Text(
    //       'Submit KYC',
    //       style: TextStyle(color: Theme.of(context).primaryColor),
    //     ),
    //   ),
    // ], leading: const Icon(Icons.error),);
    // materialbanner.show();
    return VxBuilder(
      builder: (context,store,status) {
        print(status);
        if(status == VxStatus.loading) {
          return const Center(child: CircularProgressIndicator(),);
        }
        if(status == VxStatus.success) {
          if((store as ProjectStore).kyc_data.uid == sl<SharedPreferences>().getString(SFkeys.UID)){
            if(store.kyc_data.status??false){
              return Center(widthFactor: 200,child: Container(
                margin: const EdgeInsets.all(8.0),
                width: 600,
                child: Card(elevation: 6,child: Column(mainAxisSize: MainAxisSize.min,children: [
                  'Select Payment Methode.'.text.size(16).bodyText1(context).make().p20(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField<String>(items:wallts.keys.map((e) => DropdownMenuItem(child: Text(wallts[e]),enabled: true,value: e)).toList(), onChanged: (keys){
                      wallets = keys;
                      (store).UserData.wallet?.toJson().forEach((key, value) {
                        if(key == keys){
                          withdrow_amount.value = value.toString();
                          withdrow_amount.notifyListeners();
                          // print("selected:$value");
                        }
                      });
                    }),
                  ).box.width(400).make(),
                  ValueListenableBuilder(valueListenable: withdrow_amount, builder: (builder,value,widget){
                    return HStack([
                      Expanded(child: '$value'.text.size(25).bodyText1(context).make().p20()),
                      Expanded(child:  ProductTextForm(labelText: 'Enter Amount To Be Withdrawn', textsize: 10,controller: _withdrow_amount_text,)),
                    ],alignment: MainAxisAlignment.center,).box.width(400).make();
                  }),
                  VxNotifier(
                    mutations: {
                      PaymentTransactionEvents:(ctx,mut, {status}){
                        if(status==VxStatus.success){
                          VxToast.show(context, msg: "Request has been Sent");
                        }else{
                          VxToast.show(context, msg: "Something Went Wrong");
                        }
                      }
                    },
                    child: CustomeButton(icon:  Icon(Icons.wallet,color: Colors.white,size: 20),text: "Request Withdrawal", ontap:() {
                      sl<PaymentTransactionBloc>()(data: PaymentTransactionModle(tAmt: _withdrow_amount_text.text,wallet: wallets,tType: '100',reciver: sl<SharedPreferences>().getString(SFkeys.UID),sender: '1'));
                      // GNavigation(context, type: NavigatoreTyp.push,name: Routename.kyc,parms: {'user':'user'});
                    },),
                  )
                ],)),
              ));
            }else{
              return  const EditKYCDailog();
            }
          }else{
            return const CompleateKYCDailog();
          }
        }
        if(status == VxStatus.error) {
          return const CompleateKYCDailog();
        }
        return const SizedBox.shrink();
      }, mutations: const {CheckKycEvents},
    );

  }

  @override
  void initState() {
    sl<CheckKycBloc>()(data: NoPrams());
  }
}

