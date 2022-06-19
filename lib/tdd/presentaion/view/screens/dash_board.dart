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
import '../../events/auth/get_user_mutation.dart';
import '../../events/auth/logout_mutation.dart';
import '../components/dashboard/web_body.dart';
import '../widgets/banner/banner.dart';
import '../widgets/butttons/refer_button.dart';
import '../widgets/navigatore_tab.dart';

class DashBoard extends StatefulWidget {
  final int index;
  final String? usertype;
  List<DashBoardPageModle> page;
  DashBoard(String param, {Key? key,this.usertype})
      :page = (usertype != 'admin')?DashBoardPageInfo((pos){}).userpage:DashBoardPageInfo((pos){}).adminpage,
        index = ((usertype != 'admin')?DashBoardPageInfo((pos){}).userpage:DashBoardPageInfo((pos){}).adminpage).indexWhere((element) => (element.key).toLowerCase() == param),
        super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> with GoNavigations{
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        late PageController pageViewController ;

  final GlobalKey _key = GlobalKey();

  @override
  void initState() {
    pageViewController = PageController(initialPage: widget.index);
    sl<GetUserBloc>()(data: NoPrams());

  }
  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }
  @override
  void didUpdateWidget(DashBoard oldWidget) {
    super.didUpdateWidget(oldWidget);
    // sl<GetUserBloc>()(data: NoPrams());
    pageViewController.animateToPage(widget.index,curve: Curves.fastOutSlowIn,duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    // VxState.watch(context, on: []);
    return VxConsumer(
      builder: (context,store,state) {
        final user  =  (store as ProjectStore).UserData.user;
        final List<Widget> actions = (widget.usertype != 'admin')?[
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(8.0),
            child: Text("Ac No: ${user?.acountno??""}",style:  TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 12),),
          ),
          if(LayoutView(context).isWeb)
            ReferButton(refid: user?.refid),
          if(!LayoutView(context).isWeb)
            GestureDetector(
              onTap: (){
                final scaff = _key.currentState!.context.scaffold;

                if(scaff.isEndDrawerOpen){
                  // scaff;
                }else{
                  scaff.openEndDrawer();
                }

              },
              child:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children:
                [
                  Image.asset("assets/icon/profile.png",height: 30,width: 30),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                  //   children:  [
                  //     // Text("${state.data.userType}",style: const TextStyle(color : Colors.white,fontSize: 8,fontWeight: FontWeight.bold)),
                  //     Text(user?.fname??"",style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 8)),
                  //   ],
                  //
                  // )
                ]),
              ),
            ),
          // CustomDropdown(data: DropdownLabel(key: 'profile', child:  Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Column(children:
          //   [
          //     Image.asset("assets/icon/profile.png",height: 30,width: 30),
          //     // Column(
          //     //   mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
          //     //   children:  [
          //     //     // Text("${state.data.userType}",style: const TextStyle(color : Colors.white,fontSize: 8,fontWeight: FontWeight.bold)),
          //     //     Text(user?.fname??"",style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 8)),
          //     //   ],
          //     //
          //     // )
          //   ]),
          // ),), droplists:  <Widget>[
          //   DropDownItem.first(
          //     text: "Add new",
          //     iconData: Icons.add_circle_outline,
          //     isSelected: false,
          //   ),
          //   const DropDownItem(
          //     text: "View Profile",
          //     iconData: Icons.person_outline,
          //     isSelected: false,
          //   ),
          //   const DropDownItem(
          //     text: "Settings",
          //     iconData: Icons.settings,
          //     isSelected: false,
          //   ),
          //   DropDownItem.last(
          //     text: "Logout",
          //     iconData: Icons.exit_to_app,
          //     isSelected: true,
          //   ),
          // ])
        ]:[];
        return Scaffold(
          backgroundColor: Colors.white,
          endDrawer: Container(
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
                            "Mohammed Arshad".text.bold.make(),
                            "000000000011100".text.size(12).make(),
                          ],),
                        ),
                      )
                    ],
                  ).p12(),
                  "mohammedarshadsheikh76@gmail.com".text.size(12).textStyle(const TextStyle(overflow: TextOverflow.fade)).normal.make(),
                  "7760421364".text.normal.size(12).make(),
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
              ListTile(leading: const Icon(Icons.file_copy),selected: false,title: "KYC".text.make(),),
              ListTile(leading: const Icon(Icons.edit_note),selected: false,title: "Edit Profile".text.make(),),
            ]).p20(),
          ),
          floatingActionButton: !LayoutView(context).isWeb?  ReferButton(refid: user?.refid,):null,
          // appBar: ,
          body:   WebBody(
              body: Scaffold(
                key: _key,
                backgroundColor: Colors.white,
                appBar:AppBar(backgroundColor: Colors.white,actions:  actions,
                  leading: Container(
                    margin: const EdgeInsets.only(left: 20 ),
                    // padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/icon/logo.jpeg'),
                  ),) ,
                body: PageView(controller: pageViewController,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: LayoutView(context).isMobile?Axis.horizontal:Axis.vertical,

                  onPageChanged: (index){
                    if (kDebugMode) {
                      print("page changes to : $index");
                    }
                  },
                  children:  (widget.page).map((e) => e.widget!).toList(),
                ),
              ),
              sidedrawer:  LayoutView(context).isWeb||LayoutView(context).isTab?Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Expanded(child: Container(color: Colors.white,child: tabwidget)),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Card(
                          color: Theme.of(context).primaryColor,
                          child: GestureDetector(
                            onTap: (){
                             final scaff = _key.currentState!.context.scaffold;

                              if(scaff.isEndDrawerOpen){
                                // scaff.closeEndDrawer();
                              }else{
                                scaff.openEndDrawer();
                              }

                            },
                            child: Padding(
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
                          ),
                        ),
                        // Card(
                        //   color: Theme.of(context).primaryColor,
                        //   child: GestureDetector(
                        //       onTap:(){
                        //         //TODO:Logout API Call
                        //         MeterialBanners (context,text: 'Please Active Your Id to get the Benefit', actions: [
                        //           TextButton(
                        //             onPressed: () {},
                        //             child:  Text(
                        //               'Activate',
                        //               style: TextStyle(color:  Theme.of(context).primaryColor),
                        //             ),
                        //           ),
                        //         ], leading: const Icon(Icons.error),).dispos();
                        //         // sl<SharedPreferences>().clear();
                        //         sl<LogoutBloc>()(data: NoPrams());
                        //       }, child: Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: VxNotifier(
                        //       mutations: {
                        //         LogoutEvents:(ctx,mut){
                        //           if(mut.status == VxStatus.success){
                        //             GNavigation(context, type: NavigatoreTyp.logedout,);
                        //           }
                        //         }
                        //       },
                        //       child: Column(
                        //         children: const [
                        //           Icon(Icons.logout,color: Colors.white,size: 20),
                        //           Text("LOGOUT",style: TextStyle(color:Colors.white,fontSize: 10),)
                        //         ],
                        //       ),
                        //     ),
                        //   )),
                        // ),
                      ],
                    )
                  ],
                ),
              ):null),
          bottomNavigationBar: !LayoutView(context).isMobile?null:Container(color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,child:

           tabwidget),
        );
      }, mutations: const {
      GetUserEvents
    }, notifications: {
      GetUserEvents:(ctx,mut, {status}){
        if(mut.status == VxStatus.error){
          GNavigation(context, type: NavigatoreTyp.logedout,);
        }
      }
    },
    );
  }
  Widget get tabwidget=>NavigatorTab(pageViewController,style: BoxStyle(
    width: LayoutView(context).isMobile||!(LayoutView(context).isWeb||LayoutView(context).isTab)?null:70,
    padding: EdgeInsets.symmetric(vertical:LayoutView(context).isMobile?0: 20),
    height:(LayoutView(context).isMobile && !(LayoutView(context).isWeb||LayoutView(context).isTab)) ? 80 :((LayoutView(context).isMobile|| LayoutView(context).isMobile) && !(LayoutView(context).isWeb||LayoutView(context).isTab)) ? 120 : double.infinity,
  ),align: LayoutView(context).isWeb||LayoutView(context).isTab?Axis.vertical:Axis.horizontal,
    tabs: (widget.page).map((e) => TabData(active: e.vstatus,ic_name: e.title,icon: e.icon)).toList(),
    onTabTap: (index ) {
      GNavigation(context, type: NavigatoreTyp.push,name: Routename.Home,parms: {'index':(widget.page[index].key).toLowerCase(),'user':widget.usertype!});
      pageViewController.notifyListeners();
      // pageViewController.jumpToPage(index);
    },);
}



