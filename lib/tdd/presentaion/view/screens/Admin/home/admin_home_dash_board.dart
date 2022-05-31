import 'package:asspa/core/helper/calculations/validations.dart';
import 'package:asspa/injection_container.dart';
import 'package:asspa/tdd/domain/entities/vx_store.dart';
import 'package:asspa/tdd/domain/usecase/update_membership_status.dart';
import 'package:flutter/material.dart';
import 'package:number_pagination/number_pagination.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../../core/usecases/usecase.dart';
import '../../../../../../core/util/presentation/constants/ic_constants.dart';
import '../../../../../domain/entities/user/login_user.dart';
import '../../../../events/dashboard/ReferFriend.dart';
import '../../../../events/dashboard/get_user_data.dart';
import '../../../../events/dashboard/update_status.dart';
import '../../../../events/dashboard/update_wallet.dart';
import '../../../widgets/cards/counter_card.dart';
import '../../../widgets/dailog/custome_dailog1.dart';
import '../../../widgets/textForm/ProductTextForm.dart';

class AdminHomeDashBoard extends StatefulWidget {
  const AdminHomeDashBoard({Key? key}) : super(key: key);

  @override
  State<AdminHomeDashBoard> createState() => _AdminHomeDashBoardState();
}

class _AdminHomeDashBoardState extends State<AdminHomeDashBoard> {
  ValueNotifier<int> selectedPageNumber = ValueNotifier(1);


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<UsersData> usersdatas = [];
    // final data_col = usersdatas.map((e) => {'uid':e.user?.uid,'name':'${e.user?.fname} ${e.user?.lname}','wallet':'${CountCalculation().total(e.wallet!)}','state':'${e.user?.accountstatus}'}).toList();
    final data_col =[{'uid':'001','name':'Mohammed Arshad','wallet':'0','state':'active'}];
    return Container(child: VxBuilder(
      mutations: const {GetUserDataEvents,UpdateStatusEvents},
      builder: (BuildContext context, store, VxStatus? status) {
        final userData = (store as ProjectStore).usersData;
        return ListView(/*crossAxisAlignment: CrossAxisAlignment.stretch,*/children: [
          SizedBox(
            height:120,
            width: size.width>880?(MediaQuery.of(context).size.width)-60:null,
            child: Card(color: /*!validator.isUserActive?Colors.grey.shade300:*/const Color(
                0xB585E876),child:  Row(mainAxisSize: MainAxisSize.min,children: const [
              Expanded(child: CountCard(balence: "0", discription: 'ActiveUser ', walletname: 'Active ',color: /*!validator.isUserActive?Colors.grey.shade300:*/Color(0xFF27AD19), unit: '',)),
              Expanded(child: CountCard(balence: "0", discription: 'Inactive User', walletname: 'Inactive ',color: /*!validator.isUserActive?Colors.grey.shade300:*/Color(0xFF27AD19), unit: '',)),
            ]),),
          ),
          if(userData.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SingleChildScrollView(scrollDirection: Axis.horizontal,child: SizedBox(height: 500,child: _itemDetailsTable(userData))),
                ValueListenableBuilder<int>(
                  builder: (BuildContext context, value, Widget? child) {
                    return NumberPagination(
                      onPageChanged: (int pageNumber) {
                        //do somthing for selected page
                        selectedPageNumber.value = pageNumber;
                      },
                      pageTotal: 100,
                      pageInit: value, // picked number when init page
                      colorPrimary: Colors.green,
                      colorSub: Colors.white,
                    );
                  },
                  valueListenable: selectedPageNumber,
                ),
              ],
            )
        ]);
      },
    ),);
  }

  DataTable _itemDetailsTable(List<UsersData> userData) {
    // List<Map<String,dynamic>> datas;
    userData.first.user?.id;
    final datas = userData.map((e) => {'uid':(userData.indexOf(e)+1).toString(),'name':'${e.user?.fname} ${e.user?.lname}','wallet':'${CountCalculation().total(e.wallet!)}','state':'${e.user?.accountstatus}'}).toList();
    return DataTable(
      columns:  <DataColumn>[...datas.first.keys.map((e) => DataColumn(label: Text(
        e.toString(),
        style: const TextStyle(fontStyle: FontStyle.italic),
      )))],
      rows:  <DataRow>[
        ...datas.map((el) =>  DataRow(
          cells: <DataCell>[
            ...el.entries.map((e) =>(e.key == 'state')?DataCell(Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if(e.value=='0')
                ElevatedButton(onPressed: () {
                  sl<UpdateStatusBloc>()(data: ActivateParam(userData.elementAt((int.parse(el['uid']??'0')-1)).user?.uid??"",true));
                }, child: Text(e.value=='1'?'active':'inactive')) else
                  Text(e.value=='1'?'activated':'inactive'),
                MaterialButton(
                  onPressed: () {
                   final selecteduser =  userData.elementAt((int.parse(el['uid']??'0')-1));
                   final  _othertextcontroller = TextEditingController(text: selecteduser.wallet?.genw??'0');
                   final  _businesstextcontroller = TextEditingController(text: selecteduser.wallet?.iw??'0');
                   final  _autofilltextcontroller = TextEditingController(text: selecteduser.wallet?.afw??'0');
                   final  _refrencetextcontroller = TextEditingController(text: selecteduser.wallet?.ref??'0');
                    showCustomDialog(context,
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
                                  Expanded(child: ProductTextForm(labelText: 'Other', controller: _othertextcontroller,keytype: TextInputType.number,)),
                                  Expanded(child: ProductTextForm(labelText: 'Business', controller: _businesstextcontroller,keytype: TextInputType.number,)),
                                  Expanded(child: ProductTextForm(labelText: 'Auto Fill', controller: _autofilltextcontroller,keytype: TextInputType.number,)),
                                ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(children:  [
                                  Expanded(child: ProductTextForm(labelText: 'Referer', controller: _refrencetextcontroller,keytype: TextInputType.number,), )
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
                                      UpdateWalletEvents:(ctx,mut){
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
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.edit_road_rounded),
                  ),
                )
              ],
            )): DataCell(Text(e.value??''))),
            // ...e.entries.map((e) => (e.key == 'state')?DataCell(Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     ElevatedButton(onPressed: () {
            //     },
            //         child:  Text(e.value??'')),
            //     const Icon(Icons.edit_road_rounded)
            //   ],
            // )):DataCell(Text('')))
            // ,
            // const DataCell(Text('Sarah')),
            // const DataCell(Text('0AP')),
            // DataCell(Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     ElevatedButton(onPressed: () {
            //     },
            //         child: const Text('active')),
            //     const Icon(Icons.edit_road_rounded)
            //   ],
            // )),
          ],
        )),

      ],
    );
  }

  @override
  void initState() {
    sl<GetUserDataBloc>()(data: NoPrams());
  }
}


