import 'package:asspa/core/helper/validatore/user_validator.dart';
import 'package:asspa/tdd/domain/entities/user/login_user.dart';
import 'package:asspa/tdd/domain/entities/vx_store.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../../core/helper/calculations/validations.dart';
import '../../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import '../../../../events/auth/get_user_mutation.dart';
import '../../../widgets/banner/banner.dart';
import '../../../widgets/cards/counter_card.dart';
import '../../../widgets/gridview/custome_gridview.dart';

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
  void initState() {
    materialbanner =  MeterialBanners (context,text: 'Please Active Your Id to get the Benefit', actions: [
      TextButton(
        onPressed: () {},
        child: const Text(
          'Activate',
          style: TextStyle(color: Colors.purple),
        ),
      ),
    ], leading: const Icon(Icons.error),);

  }

  @override
  void didUpdateWidget(HomeDash oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return VxBuilder(
      builder: (context,store,state) {
        // final User? usersData = (store as ProjectStore).UserData.user;
       final  validator = UserValidator((store as ProjectStore).UserData);
        if(!validator.isUserActive) {
         materialbanner.show();
        }else{
          materialbanner.remove();
        }
        final  user =(store as ProjectStore).UserData;
        return Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
          child: ListView(
            children: [
              CustomeGridView(context,itemcount: size.width>880? 4:1, height: 23, grid_items:   [
                CountCard(balence: user.wallet!=null?(CountCalculation().total(user.wallet!)??'0.0'):'0.0', discription: 'Total Point', walletname: 'Total',color: !validator.anyWalletStatus?Colors.grey.shade300:Color(0x8c3c4b64), unit: 'AP',),
                CountCard(balence: user.wallet?.genw??"0.0",  discription: 'Other Point', walletname: 'Other',color: !validator.genralvalletstatus?Colors.grey.shade300:Color(0xFF2eb85c), unit: 'AP',),
                CountCard(balence: user.wallet?.iw??"0.0",  discription: 'Business Point', walletname: 'Business',color: !validator.incomevalletstatus?Colors.grey.shade300:Color(0xFFAD5219), unit: 'AP',),
                CountCard(balence: user.wallet?.ref??"0.0",  discription: 'Referer Point', walletname: 'Referer',color: !validator.refrervalletstatus?Colors.grey.shade300:Color(0xCFf9b115), unit: 'AP',),
                CountCard(balence: user.wallet?.afw??"0.0",  discription: 'Auto fill Point', walletname: 'Auto fill',color: !validator.autofillvalletstatus?Colors.grey.shade300:Color(0xCFe55353), unit: 'AP',),
              ], scolldirection: Axis.vertical,
              ),
              Wrap(
                children: [
                  SizedBox(
                    height:120,
                    width: size.width>880?(MediaQuery.of(context).size.width/2)-60:null,
                    child: Card(color: !validator.isUserActive?Colors.grey.shade300:Color(
                        0xB585E876),child:  Row(mainAxisSize: MainAxisSize.min,children: [
                      Expanded(child: CountCard(balence: /*user.wallet?.genw??*/"0", discription: 'ActiveUser ', walletname: 'Active ',color: !validator.isUserActive?Colors.grey.shade300:Color(0xFF27AD19), unit: '',)),
                      Expanded(child: CountCard(balence: /*user.wallet?.genw??*/"0", discription: 'Inactive User', walletname: 'Inactive ',color: !validator.isUserActive?Colors.grey.shade300:Color(0xFF27AD19), unit: '',)),
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
      }, mutations: {GetUserEvents},
    );
  }

}