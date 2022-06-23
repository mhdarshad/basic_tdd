/*
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/fetch_category_product.dart';
import '../../../../domain/entities/search_user_modle.dart';
import '../../../bloc/customers/userprofile_bloc.dart';
import '../../../bloc/search/search_bloc.dart';
import 'transform_follower.dart';

class SearchBar<T> extends StatelessWidget {
  final String? hintText;
  final SearchBarStyle style;
  final SearchType type;
  Function(String,BuildContext) onQuerySearch;
  Function(bool)? searchstatus;
  Function(List)? listnsearch;
  Widget Function(T,int,bool) listdata;
  Function(T?) onSubmit;
  Function? onSubmitEmpty;
  final FocusNode focus;
  final Widget? empty;
  SearchBar(this.onQuerySearch, {Key? key,this.hintText,required this.style,required this.type,this.searchstatus,this.listnsearch,  required this.listdata,required this.onSubmit,required this.focus, this.empty,this.onSubmitEmpty}) : super(key: key);

  OverlayEntry? overlayEntry;
  int index = 0;
  final LayerLink layerLink = LayerLink();
  // final SearchCommand searchCommand = SearchCommand();
  TextEditingController controller  = TextEditingController(text: "");

  Future<OverlayEntry> _showOverlay(BuildContext context, */
/*SearchState state,*//*
 int index,) async {
    // FocusScope.of(context).requestFocus(focus);
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Size size = renderBox.size;
    // debugPrint("searchtype in searchbar widget:"+widget.searchtype.toString());
    return OverlayEntry(builder: (context1) {
      return Positioned(
          width: renderBox.size.width,
         // width: renderBox.size.width-30,
          child: TransformFollower(
            link: layerLink,
            offset: Offset(8.0, size.height - 10),
            child: Material(
              color: Colors.transparent,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: */
/* (state is SearchSucsess<List<T>>)? state.data.isNotEmpty? Container(
                      height: MediaQuery.of(context).size.height /1.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.shade100),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if(state is SearchLoading)
                              const Text("Loading...",style: TextStyle(color: Colors.white)),
                            if(state is SearchSucsess<List<T>>)
                              // if(state.data.toList() == [])
                              ...state.data.map((e) =>  GestureDetector (
                                onTap: () {
                                  clearOverlay();
                                  onSubmit(e);
                                },
                                child: listdata(e as T,index,index == state.data.indexOf(e)),
                              )
                              ).toList()

                          ],
                        ),
                      )):*//*
const SizedBox.shrink()*/
/*:empty??const SizedBox.shrink()*//*
,
                ),
              ),
            ),
          ));
    });
  }
  // @override
  // void initState() {
  //   controller.addListener(() async{
  //     debugPrint("listning to text");
  //     if (!_focus.hasFocus) {
  //       controller.text = '';
  //       clearOverlay();
  //     }
  //   });
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    focus.addListener(() {
      if (!focus.hasFocus ) {
        controller.text = '';
        clearOverlay();
      }
    });

    return BlocConsumer<SearchBloc, SearchState>(
      listener: (context, state) async{
        if (focus.hasFocus) {
          clearOverlay();
          index = 0;
          addOverlay(context*/
/*,state,*//*
index);
        }
        if(state is SearchSucsess<List<T>>) {
          if( listnsearch!=null) {
            // listnsearch!(state.data);
          }
        }

        // TODO: implement listener
      },
      builder: (context, state){
        return  CompositedTransformTarget(
          link: layerLink,
          child: KeyboardListener(
            onKeyEvent: (event){
              if(state is SearchSucsess<List<T>>) {
                debugPrint(event.logicalKey.toString());
                if (event is KeyDownEvent) {
                  if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
                    debugPrint("event");
                    if (focus.hasFocus) {
                      if (index < state.data.length-1) {
                        clearOverlay();
                        addOverlay(context, state, ++index);
                      }
                    }
                    // setState(()=>index++);
                  } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
                    if (kDebugMode) {
                      debugPrint("event");
                    }
                    if (focus.hasFocus) {
                      if (index > 0) {
                        clearOverlay();
                        addOverlay(context, state, --index);
                      }
                    }
                  }
                  else if (!kIsWeb&& event.logicalKey == LogicalKeyboardKey.enter) {

                    if (kDebugMode) {
                      debugPrint("ontap inside the search $index");
                    }
                    onSubmit(state.data.elementAt(index));
                    clearOverlay();
                  }
                  else{
                    if (kDebugMode) {
                      debugPrint('enterd:'+event.logicalKey.toString());
                    }
                  }
                } else {
                  return;
                }
              }
              else if(state is SearchError){
                if (!kIsWeb&& event.logicalKey == LogicalKeyboardKey.enter) {

                  if (kDebugMode) {
                    debugPrint("ontap inside the search $index");
                  }
                  if(onSubmitEmpty!=null) {
                    onSubmitEmpty!(controller.text);
                  }
                  clearOverlay();

                }
              }
            },
            autofocus: false,
            focusNode: FocusNode(),
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0,right: 25.0,bottom: 8,top: 8),
              child: Container(
                height: style.height,
                child:  TextFormField(
                  controller: controller,
                  focusNode: focus,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (val) {
                 if(kIsWeb)
                   {
                     if(state is SearchSucsess<List<T>>) {
                       onSubmit(state.data.elementAt(index));
                     }else{
                       onSubmit(null);
                     }
                   }
                    },
                  onChanged: (query) {
                    if(query.length>2) {
                      onQuerySearch(query,context);
                      searchstatus!(true);
                      // switch(widget.type){
                      //
                      //   case SearchType.user:
                      //     BlocProvider.of<SearchBloc>(context).add(OnSearch(query, SearchType.user));
                      //     // TODO: Handle this case.
                      //     break;
                      //   case SearchType.product:
                      //     BlocProvider.of<SearchBloc>(context).add(OnSearch(query, SearchType.product));
                      //     // TODO: Handle this case.
                      //     break;
                      //   case SearchType.order:
                      //     // TODO: Handle this case.
                      //     break;
                      // }
                    }else{
                      overlayEntry?.remove();
                      overlayEntry = null;
                      if(query.isEmpty) {
                        searchstatus!(false);
                      }
                    }
                  },
                  decoration:  InputDecoration(
                      hintStyle: const TextStyle(fontSize: 15,color: Colors.green),
                      suffixIcon: style.iconalign == IconAlign.ending ?const Icon(Icons.search,size: 20,):null,
                      prefixIcon:  style.iconalign == IconAlign.leading ?const Icon(Icons.search,size: 20,):null,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: style.contentPadding,
                      hintText: hintText),
                ), decoration: style.decoration,
              ),
            ),
          ),
        );
      },
    );
  }
  void clearOverlay() {

    overlayEntry?.remove();
    overlayEntry = null;
  }
  void addOverlay(BuildContext context,*/
/*SearchState state, *//*
int index) async{
    overlayEntry = await _showOverlay(context,*/
/*state,*//*
index);
    Overlay.of(context)!.insert(overlayEntry!);
  }
}

class SearchBarStyle{
  IconAlign? iconalign;
  EdgeInsetsGeometry? contentPadding;
  double? height;
  Decoration? decoration;
  SearchBarStyle({this.iconalign,this.contentPadding,this.height,this.decoration});

}
enum IconAlign{
  leading,ending
}

*/
