import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../../../core/util/presentation/styles/screen_size_rario.dart';
import '../../../../../injection_container.dart';
import '../../../../../rought_genrator.dart';
import '../../../../domain/entities/vx_store.dart';
import '../../../events/auth/logout_mutation.dart';
import '../banner/banner.dart';

class EndDrawer extends StatelessWidget with GoNavigations{
   EndDrawer({Key? key}) : super(key: key);
  final user  =  (VxState.store as ProjectStore).UserData.user;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: !LayoutView(context).isWeb?250:MediaQuery.of(context).size.width/4,
      child: Column(children: [
        SizedBox(height: 120,child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset("assets/icon/profile.png",height: 40,width: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
                  child: Center(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                      "${user?.fname} ${user?.lname}".text.bold.make(),
                      "${user?.acountno}".text.size(12).make(),
                    ],),
                  ),
                )
              ],
            ).p12(),
            "${user?.email}".text.size(12).textStyle(const TextStyle(overflow: TextOverflow.fade)).normal.make(),
            "${user?.phone}".text.normal.size(12).make(),
          ],
        )),
        const Divider(thickness: 2,height: 2,),
        VxNotifier(
          mutations: {
            LogoutEvents:(ctx,mut,{status}){
              if(mut.status == VxStatus.success){

                GNavigation(context, type: NavigatoreTyp.logedout,);
              }
            }
          },
          child:  ListTile(leading: const Icon(Icons.logout),selected: true,title: "Logout".text.make(),onTap: (){
            MeterialBanners (context,text: 'Please Active Your Id to get the Benefit', actions: [
              TextButton(
                onPressed: () {},
                child:  Text(
                  'Activate',
                  style: TextStyle(color:  Theme.of(context).primaryColor),
                ),
              ),
            ], leading: const Icon(Icons.error),).dispos();
            // sl<SharedPreferences>().clear();
            sl<LogoutBloc>()(data: NoPrams());
          }),
        ),
        const Divider(thickness: 2,height: 2,),
        ListTile(leading: const Icon(Icons.file_copy),selected: false,title: "KYC".text.make(),onTap: (){
          GNavigation(context, type: NavigatoreTyp.push,name: Routename.kyc,parms: {'user':'user'});
        }),
        ListTile(leading: const Icon(Icons.edit_note),selected: false,title: "Edit Profile".text.make(),),
      ]).p20(),
    );
  }
}
