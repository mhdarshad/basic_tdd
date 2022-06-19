import 'package:flutter/material.dart';
import '../../../../../core/util/presentation/styles/box_property.dart';
import '../../../../../core/util/presentation/styles/screen_size_rario.dart';

class TabData{
  bool active;
  Object? icon;
  String? ic_name;
  TabData({this.icon, this.ic_name, this.active = true,});
}
class NavigatorTab extends StatefulWidget {
  final List<TabData> tabs ;
  final Function()? onTap;
  final Axis align;
  final PageController controller;
  BoxStyle? style;
  final bool islist;
  final Function(int) onTabTap;
  NavigatorTab(this.controller,{Key? key,required this.tabs,this.align = Axis.vertical,this.onTap, this.style,this.islist = false, required this.onTabTap}) : super(key: key);

  @override
  State<NavigatorTab> createState() => _NavigatorTabState();

}

class _NavigatorTabState extends State<NavigatorTab> {
  late  int _currentindex;

  int get currentindex => _currentindex;

  set currentindex(index) => _currentindex = index;

  List<Widget> get listTab=>widget.tabs.map((tab) => Center(
    child: GestureDetector(
      onTap: (){
        if(tab.active){
          setState(() {
            currentindex =widget.tabs.indexWhere((element) => element.ic_name == tab.ic_name);
          });
        widget.onTabTap(currentindex);
        }
        // widget.controller.animateToPage(currentindex,curve: Curves.fastOutSlowIn,duration: const Duration(seconds: 1));
        // widget.controller.notifyListeners();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
        child: Container(
          width:  LayoutView(context).isMobile||widget.align==Axis.horizontal?80:200,
          height:  LayoutView(context).isMobile||widget.align==Axis.horizontal?200:null,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color:tab.ic_name==""?Colors.transparent:widget.tabs[currentindex].ic_name == tab.ic_name? Theme.of(context).primaryColor.withAlpha(60):Colors.transparent,
                blurRadius: 6.0,
                spreadRadius: 0.0,
                offset: Offset(
                  0.0,
                  3.0,
                ),
              ),
            ],
              color: tab.ic_name==""?Colors.transparent:widget.tabs[currentindex].ic_name == tab.ic_name?Theme.of(context).bottomNavigationBarTheme.selectedItemColor:/*Colors.grey[100]*/Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
              border:  widget.style!.borderenabel?Border.all(color: tab.ic_name==""?Colors.transparent:widget.tabs[currentindex].ic_name == tab.ic_name?Theme.of(context).primaryColor:Colors.white):null
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(children: [
              if(tab.icon is IconData)
                Icon(tab.icon as IconData,color: !tab.active?Colors.grey:widget.tabs[currentindex].ic_name == tab.ic_name?Theme.of(context).primaryColor:Colors.white),
              if(tab.icon is Image)
                (tab.icon as Image),
              if(tab.ic_name!=null)
                Text(tab.ic_name!,style: TextStyle(color:!tab.active?Colors.grey.shade300:widget.tabs[currentindex].ic_name == tab.ic_name?Theme.of(context).primaryColor:Colors.grey,fontSize: 8),)
            ],),
          ),
        ),
      ),
    ),
  )).toList();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentindex = widget.controller.initialPage;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.style!.width,
        // height:LayoutView(context).mobile()||widget.align==Axis.horizontal?120:double.infinity,
        height:widget.style!.height,
        padding:  widget.style!.padding, child: (widget.align==Axis.vertical||widget.tabs.length>5||widget.islist)?ListView(scrollDirection: widget.align,
      children:  listTab,):Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: listTab,));
  }
}