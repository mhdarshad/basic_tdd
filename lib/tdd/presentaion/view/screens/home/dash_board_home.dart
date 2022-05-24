import 'package:asspa/core/helper/validatore/user_validator.dart';
import 'package:asspa/tdd/domain/entities/user/login_user.dart';
import 'package:asspa/tdd/domain/entities/vx_store.dart';
import 'package:asspa/tdd/presentaion/events/phoneauth/get_user_mutation.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import '../../widgets/banner/banner.dart';
import '../../widgets/gridview/custome_gridview.dart';

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
              CustomeGridView(context,itemcount: size.width>880? 3:1, height: 35, grid_items:   [
                CountCard(balence: user.wallet?.genw??"0.0", discription: 'Other  Wallet', walletname: 'Other ',color: !validator.genralvalletstatus?Colors.grey.shade300:Color(0xFF27AD19), unit: 'AP',),
                CountCard(balence: user.wallet?.iw??"0.0",  discription: 'Income  Wallet', walletname: 'Income ',color: !validator.incomevalletstatus?Colors.grey.shade300:Color(0xFFAD5219), unit: 'AP',),
                CountCard(balence: user.wallet?.afw??"0.0",  discription: 'Auto fill Wallet', walletname: 'Auto fill ',color: !validator.autofillvalletstatus?Colors.grey.shade300:Color(0xCF042BEC), unit: 'AP',),
              ], scolldirection: Axis.vertical,
              ),
              Wrap(
                children: [
                  SizedBox(
                    width: size.width>880?(MediaQuery.of(context).size.width/2)-60:null,
                    child: Card(color: !validator.isUserActive?Colors.grey.shade300:Color(0xFF27AD19),child:  Row(mainAxisSize: MainAxisSize.min,children: [
                      Expanded(child: CountCard(balence: user.wallet?.genw??"0", discription: 'ActiveUser ', walletname: 'Active ',color: !validator.isUserActive?Colors.grey.shade300:Color(0xFF27AD19), unit: '',)),
                      Expanded(child: CountCard(balence: user.wallet?.genw??"0", discription: 'Inactive User', walletname: 'Inactive ',color: !validator.isUserActive?Colors.grey.shade300:Color(0xFF27AD19), unit: '',)),
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

class CountCard extends StatelessWidget {
  final Color? color;
  final String walletname;
  final String discription;
  final String balence;
  final String unit;

  const CountCard({
    Key? key,
    this.color,
    required this.walletname,
    required this.balence,
    required this.discription,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color:color,
        child: Container(
          height: 200,
          decoration: const BoxDecoration(),
          child: Container(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  walletname,
                  style: FlutterFlowTheme.title3
                      .override(
                    fontFamily: 'Poppins',
                    color: const Color(0xFFEBEBEB),
                  ),
                ),
                Text(
                  discription,
                  style: FlutterFlowTheme.subtitle2
                      .override(
                    fontFamily: 'Poppins',
                    color: const Color(0xFFEBEBEB),
                  ),
                ),
                Text(
                  '$unit ${balence}',
                  style: FlutterFlowTheme.title1
                      .override(
                    fontFamily: 'Poppins',
                    color: const Color(0xFFEBEBEB),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(),
                  child: Text(
                    'View More',
                    style: FlutterFlowTheme.bodyText1
                        .override(
                      fontFamily: 'Poppins',
                      color: const Color(0xFFEBEBEB),
                    ),
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