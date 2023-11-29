
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../rought_genrator.dart';
import '../../../../tdd/domain/modle/vx_store.dart';

extension ListToString on List<String> {
  String toRequiredParamsString() {
    var str = '';
    for(var param in this) {
      str += '/:$param';
    }
    print(str);
    return str;
  }
}
mixin class RouterData{

  ///A custom builder for this route.
  /// For example:
  ///goRoute(Routename.routname,(BuildContext context, GoRouterState state) => FamilyPage(
  ///     families: Families.family(
  ///       state.params['id'],
  ///     ),
  ///   ),
  /// )

  GoRoute goRoute(Routename route,Widget Function(BuildContext context,
      GoRouterState state) widget,
      {List<String>? params, List<RouteBase>? routes,bool isSubROught = false}) => GoRoute(name:route.nUri.name,path: "${isSubROught?route.nUri.path.replaceFirst('/', ''):route.nUri.path}${(params??[]).toRequiredParamsString()}",routes:routes??const <RouteBase>[],builder: (BuildContext context, GoRouterState state) {
    stored.pathParameters = state.pathParameters;
    print(state.pathParameters);
    return widget(context,state);
  });
}
enum NavigatoreTyp{
  push,pop,pushReplacment,popUntill,logedout
}
class CUri{
  String uri;
  CUri(this.uri);
  String get name => uri;
  String get path => '/$uri';
}
class Navigations {

  push(BuildContext context,{required Routename name,Map<String, dynamic> parms = const <String, dynamic>{}, Map<String, dynamic> qparms = const <String, dynamic>{}}){
    // if(parms!=null && qparms!=null){
    //   Map<String,String> qparms1={};
    //   qparms.forEach((key, value) {
    //     if(value !=null){
    //       qparms1.addAll({key:value.toString()});
    //     }
    //   });
    //   context.pushNamed(nUri(name!).name,params: parms,queryParams: qparms1);
    // }else if(parms!=null){
    //   context.pushNamed(nUri(name!).name,params: parms);
    // }else if(qparms!=null){
    //   Map<String,String> qparms1={};
    //   qparms.forEach((key, value) {
    //     if(value !=null){
    //       qparms1.addAll({key:value.toString()});
    //     }
    //   });
    //   context.pushNamed(nUri(name!).name,queryParams: qparms1);
    // }else{
    //   context.pushNamed(nUri(name!).name);
    // }
    context.pushNamed(name.nUri.name,pathParameters: parms.map((key, value) => MapEntry(key, value.toString())),queryParameters: qparms);
  }

  String getCurrentRoute(BuildContext context)=>
      GoRouterState.of(context).uri.toString();

  pushReplace(BuildContext context,{required Routename name,Map<String, dynamic> parms = const <String, dynamic>{}, Map<String, dynamic> qparms = const <String, dynamic>{}})=>
      context.pushReplacementNamed(name.nUri.name,pathParameters: parms.map((key, value) => MapEntry(key, value.toString())),queryParameters: qparms);

  pop(BuildContext context){
    if(GoRouter.of(context).canPop()) {
      router.pop();
    } else {
      context.go("/");
    }
  }

  popUntill(BuildContext context,{required Routename name,Map<String, dynamic> parms = const <String, dynamic>{}, Map<String, dynamic> qparms = const <String, dynamic>{}}){
    // if(parms!=null && qparms!=null){
    //   Map<String,String> qparms1={};
    //   qparms.forEach((key, value) {
    //     if(value !=null){
    //       qparms1.addAll({key:value.toString()});
    //     }
    //   });
    //   context.pushNamed(nUri(name!).name,params: parms,queryParams: qparms1);
    // }else if(parms!=null){
    //   context.pushNamed(nUri(name!).name,params: parms);
    // }else if(qparms!=null){
    //   Map<String,String> qparms1={};
    //   qparms.forEach((key, value) {
    //     if(value !=null){
    //       qparms1.addAll({key:value.toString()});
    //     }
    //   });
    //   context.pushNamed(nUri(name!).name,queryParams: qparms1);
    // }else{
    //   context.pushNamed(nUri(name!).name);
    // }
    context.goNamed(name.nUri.name,pathParameters: parms.map((key, value) =>
        MapEntry(key, value.toString())),queryParameters: qparms);
  }

  refresh(BuildContext context)=>
      WidgetsBinding.instance.addPostFrameCallback((_) { context.go("/"); });

  String toPath(Routename route)=>
      route.nUri.path;

}
final navigate = Navigations();