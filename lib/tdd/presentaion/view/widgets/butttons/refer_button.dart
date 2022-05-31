import 'package:flutter/material.dart';

import '../../../../../injection_container.dart';
import '../../../events/dashboard/ReferFriend.dart';

class ReferButton extends StatelessWidget {
  final String refid;

  const ReferButton({
    Key? key,
    required this.refid
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        sl<ReferfriendBloc>()(data: refid);
      },
      child: Card(
        color: Colors.amber,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.all(6.0),
          child: Row  (
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text("Join Others",style: TextStyle(color: Colors.white,fontSize: 12)),
              Icon(Icons.share,color: Colors.white,size: 20),
            ],
          ),
        ),
      ),
    );
  }
}