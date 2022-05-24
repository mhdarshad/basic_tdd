import 'package:asspa/core/usecases/usecase.dart';
import 'package:asspa/tdd/domain/entities/vx_store.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/util/presentation/styles/box_property.dart';
import '../../../../core/util/presentation/styles/screen_size_rario.dart';
import '../../../../injection_container.dart';
import '../../../../rought_genrator.dart';
import '../../../domain/entities/dash_page_info.dart';
import '../../events/dashboard/ReferFriend.dart';
import '../../events/phoneauth/get_user_mutation.dart';
import '../../events/phoneauth/logout_mutation.dart';
import '../components/dashboard/web_body.dart';
import '../widgets/banner/banner.dart';
import '../widgets/navigatore_tab.dart';

class DashBoard extends StatefulWidget {
  final int index;
  DashBoard(String param, {Key? key}) : index = DashBoardPageInfo((pos){}).page.indexWhere((element) => (element.title??'home').toLowerCase() == param),super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> with GoNavigations{
  late PageController pageViewController ;

  @override
  void initState() {
    sl<GetUserBloc>()(data: NoPrams());

    pageViewController = PageController(initialPage: widget.index);
  }
  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }
  @override
  void didUpdateWidget(DashBoard oldWidget) {
    super.didUpdateWidget(oldWidget);
    pageViewController.animateToPage(widget.index,curve: Curves.fastOutSlowIn,duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {

    // VxState.watch(context, on: []);
    return VxConsumer(
      builder: (context,store,state) {
        final user  =  (store as ProjectStore).UserData.user;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(backgroundColor: Colors.white,actions:  [
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(8.0),
              child: Text("Ac No: ${user?.acountno??""}",style: const TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            MaterialButton(
              onPressed: () {
                sl<ReferfriendBloc>()(data: 'MHD123');
              },
              child: Card(
                color: Colors.amber,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(8.0),
                  child: Row  (
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text("Join Others",style: TextStyle(color: Colors.white,fontSize: 20)),
                      Icon(Icons.share,color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
          ],leading: Container(
            margin: const EdgeInsets.only(left: 20 ),
            // padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/icon/logo.jpeg'),
          ),),
          body:   WebBody(
              body: Scaffold(
                backgroundColor: Colors.white,
                // appBar:PreferredSize(preferredSize: const Size.fromHeight(60.0),
                //     child: Header (title: "DashBoard",onTapCreateOrder:(int){
                //       pageViewController.jumpToPage(5,);
                //     },)) ,
                body: PageView(controller: pageViewController,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: LayoutView(context).isMobile?Axis.horizontal:Axis.vertical,
                  onPageChanged: (index){
                    if (kDebugMode) {
                      print("page changes to : $index");
                    }

                  },
                  children:  (DashBoardPageInfo((pos){}).page).map((e) => e.widget!).toList(),
                ),
              ),
              sidedrawer:  LayoutView(context).isWeb||LayoutView(context).isTab?Container(
                color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                child: Column(
                  children: [
                    Expanded(child: Container(color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,child: tabwidget)),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children:
                          [
                            Image.asset("assets/icon/profile.png",height: 30,width: 30),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                              children:  [
                                // Text("${state.data.userType}",style: const TextStyle(color : Colors.white,fontSize: 8,fontWeight: FontWeight.bold)),
                                Text(user?.fname??"",style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 8)),
                              ],

                            )]),
                        ),
                        GestureDetector(
                            onTap:(){
                              //TODO:Logout API Call
                              MeterialBanners (context,text: 'Please Active Your Id to get the Benefit', actions: [
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Activate',
                                    style: TextStyle(color: Colors.purple),
                                  ),
                                ),
                              ], leading: const Icon(Icons.error),).dispos();
                              sl<LogoutBloc>()(data: NoPrams());
                            }, child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: VxNotifier(
                            mutations: {
                              LogoutEvents:(ctx,mut){
                                if(mut.status == VxStatus.success){
                                  GNavigation(context, type: NavigatoreTyp.logedout,);
                                }
                              }
                            },
                            child: Column(
                              children: const [
                                Icon(Icons.logout,color: Colors.white,size: 20),
                                Text("LOGOUT",style: TextStyle(color:Colors.white,fontSize: 10),)
                              ],
                            ),
                          ),
                        )),
                      ],
                    )
                  ],
                ),
              ):null),
          bottomNavigationBar: !LayoutView(context).isMobile?null:Container(color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,child: tabwidget),
        );
      }, mutations: const {
      GetUserEvents
    }, notifications: {
      GetUserEvents:(ctx,mut){

      }
    },
    );
  }
  Widget get tabwidget=>NavigatorTab(pageViewController,style: BoxStyle(
    width: LayoutView(context).isMobile||!(LayoutView(context).isWeb||LayoutView(context).isTab)?null:70,
    padding: EdgeInsets.symmetric(vertical:LayoutView(context).isMobile?0: 20),
    height:(LayoutView(context).isMobile && !(LayoutView(context).isWeb||LayoutView(context).isTab)) ? 80 :((LayoutView(context).isMobile|| LayoutView(context).isMobile) && !(LayoutView(context).isWeb||LayoutView(context).isTab)) ? 120 : double.infinity,
  ),align: LayoutView(context).isWeb||LayoutView(context).isTab?Axis.vertical:Axis.horizontal,
      tabs: (DashBoardPageInfo((p0) => pageViewController.animateToPage(p0,curve: Curves.fastOutSlowIn,duration: const Duration(seconds: 1)),).page).map((e) => TabData(active: e.vstatus,ic_name: e.title,icon: e.icon)).toList(),
    onTabTap: (index ) {
      GNavigation(context, type: NavigatoreTyp.push,name: Routename.Home,parms: {'index':(DashBoardPageInfo((pos){}).page[index].title??'home').toLowerCase()});
      pageViewController.notifyListeners();
      // pageViewController.jumpToPage(index);
    },);
}

