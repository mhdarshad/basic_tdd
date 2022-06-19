import 'package:flutter/material.dart';

class FormCnfirmButtons extends StatelessWidget {
  final String confirmtext;
  final Function? oncancle;
  final Function onsubmit;
  final bool enable;
  final bool loading;
  const FormCnfirmButtons({
    Key? key, this.confirmtext="Submit", this.oncancle, required this.onsubmit, this.enable = true, this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start,children: [
       if(oncancle!=null)
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(onPressed: ()=>oncancle!(), child: const Text("Cancel")),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(color: Theme.of(context).primaryColor,onPressed:enable? ()=>onsubmit():null, child:  loading?const CircularProgressIndicator(color: Colors.white,):Text(confirmtext,style: const TextStyle(color: Colors.white),)),
        ),
      ],),
    );
  }
}
