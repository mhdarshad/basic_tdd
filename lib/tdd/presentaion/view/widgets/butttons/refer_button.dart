import 'package:asspa/tdd/domain/entities/vx_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../injection_container.dart';
import '../../../events/dashboard/ReferFriend.dart';
import '../dailog/custome_dailog1.dart';
import 'custome_button.dart';

class ReferButton extends StatelessWidget {
  final String? refid;

  const ReferButton({
    Key? key,
     this.refid
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxNotifier(
      mutations: {
        ReferfriendEvents:(ctx,mut,{status}){
          // showCustomDialog(context,
          //   height: 300,
          //   width: 400,
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       children: const [
          //         Text("Copy the Link",style: TextStyle(fontSize: 25,color: Colors.green,fontWeight: FontWeight.bold)),
          //       ],
          //     ),
          //   ),);
          if(status == VxStatus.success) {
            Clipboard.setData(ClipboardData(text: (mut  as ReferfriendEvents).link));
            VxToast.show(context, msg: (mut).link +'Copied to Clip Board');
            Share.share((mut).link);
          }
        }
      },
      child:  CustomeButton(icon: const Icon(Icons.share,color: Colors.white,size: 20),text: "Join Others", ontap: (){
        sl<ReferfriendBloc>()(data: refid);
      },),
    );
  }
}

