import 'package:asspa/core/helper/validatore/user_validator.dart';
import 'package:asspa/tdd/domain/entities/vx_store.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../../core/helper/calculations/validations.dart';
import '../../../../../../core/usecases/usecase.dart';
import '../../../../../../injection_container.dart';
import '../../../../events/auth/get_user_mutation.dart';
import '../../../widgets/banner/banner.dart';
import '../../../widgets/cards/counter_card.dart';
import '../../../widgets/gridview/custome_gridview.dart';
import '../../../widgets/textForm/scrolling_text.dart';

class HomeDash extends StatefulWidget {
  const HomeDash({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeDash> createState() => _HomeDashState();
}

class _HomeDashState extends State<HomeDash> {
  late MeterialBanners materialbanner ;

//
//  @override
//   void dispose() {
//    materialbanner.dispos();
// //
//   }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    materialbanner =  MeterialBanners (context,text: 'Please Active Your Id to get the Benefit', actions: [
      TextButton(
        onPressed: () {},
        child:  Text(
          'Activate',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
    ], leading: const Icon(Icons.error),);
    return VxBuilder(
      mutations: const {GetUserEvents},
      builder: (context,store,state) {
        // final User? usersData = (store as ProjectStore).UserData.user;
        final  user =(store as ProjectStore).UserData;
        final  validator = UserValidator(store.UserData);
        if(state == VxStatus.success){
          debugPrint('loaded user data');
         if(!validator.isUserActive) {
           materialbanner.show();
         }else{
           materialbanner.remove();
         }
       }
        return Container(
          color: Theme.of(context).primaryColor.withAlpha(45),
          padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
          child: ListView(
            children: [
              SizedBox(
                height: 20,
                child: ScrollingText(scrollAxis: Axis.horizontal,
                  text: "Welcome ${user.user?.fname??''} ${user.user?.lname??''} (${user.user?.acountno}) wish you good luck and explore the opportunity with us",
                  textStyle: const TextStyle(fontSize: 12),
                ),
              ),
              CustomeGridView(context,itemcount: size.width>880? 4:1, height: 23, grid_items:   [
                CountCard(balence: user.wallet!=null?(CountCalculation().total(user.wallet!)??'0.0'):'0.0', discription: 'Total Point', walletname: 'Total',color: !validator.anyWalletStatus?Colors.grey.shade300:Theme.of(context).primaryColor, unit: 'AP',),
                CountCard(balence: user.wallet?.genw??"0.0",  discription: 'Other Point', walletname: 'Other',color: !validator.genralvalletstatus?Colors.grey.shade300:Theme.of(context).primaryColor, unit: 'AP',),
                CountCard(balence: user.wallet?.iw??"0.0",  discription: 'Business Point', walletname: 'Business',color: !validator.incomevalletstatus?Colors.grey.shade300:Theme.of(context).primaryColor, unit: 'AP',),
                CountCard(balence: user.wallet?.ref??"0.0",  discription: 'Referer Point', walletname: 'Referer',color: !validator.refrervalletstatus?Colors.grey.shade300:Theme.of(context).primaryColor, unit: 'AP',),
                CountCard(balence: user.wallet?.afw??"0.0",  discription: 'Auto fill Point', walletname: 'Auto fill',color: !validator.autofillvalletstatus?Colors.grey.shade300:Theme.of(context).primaryColor, unit: 'AP',),
              ], scolldirection: Axis.vertical,
              ),
              Wrap(
                children: [
                  SizedBox(
                    height:120,
                    width: size.width>880?(MediaQuery.of(context).size.width/2)-60:null,
                    child: Card(color: !validator.isUserActive?Colors.grey.shade300:Theme.of(context).primaryColor,child:  Row(mainAxisSize: MainAxisSize.min,children: [
                      Expanded(child: CountCard(balence: /*user.wallet?.genw??*/"${store.usersAnalytics.activecount}", discription: 'ActiveUser ', walletname: 'Active ',color: !validator.isUserActive?Colors.grey.shade300:Theme.of(context).primaryColor, unit: '',)),
                      Expanded(child: CountCard(balence: /*user.wallet?.genw??*/"${store.usersAnalytics.inactivecount}", discription: 'Inactive User', walletname: 'Inactive ',color: !validator.isUserActive?Colors.grey.shade300:Theme.of(context).primaryColor, unit: '',)),
                    ]),),
                  ),
                  SizedBox(
                      width: size.width>880?(MediaQuery.of(context).size.width/2)-60:null,
                      child: Container(color: Colors.white,))
                ],
              ),

            ],
          ),
        );
      },
    );
  }

}