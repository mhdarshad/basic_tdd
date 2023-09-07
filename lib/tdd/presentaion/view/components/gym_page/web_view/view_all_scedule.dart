// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// import '../../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';
// import '../../../../../../rought_genrator.dart';
//
// class ViewAllScedule extends StatefulWidget {
//   const ViewAllScedule({Key? key}) : super(key: key);
//
//   @override
//   State<ViewAllScedule> createState() => _WebviewState();
// }
//
// class _WebviewState extends State<ViewAllScedule> {
//   int _counter = 0;
//   ValueNotifier<bool> loading = ValueNotifier(true);
//   SpinKitRotatingCircle  get spinkit =>  SpinKitRotatingCircle(
//     color: FlutterFlowTheme.of(context).primary,
//     size: 50.0,
//   );
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//   }
//   @override
//   void initState() {
//     // TODO: implement initState
//     // controller.);
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       showDialog(context: context, builder: (context) => spinkit);
//     });
//     super.initState();
//   }
//   WebViewController get controller => WebViewController()
//   // ..clearCache()
//     ..setJavaScriptMode(JavaScriptMode.unrestricted)
//     ..setBackgroundColor(FlutterFlowTheme.of(context).primaryBackground)
//     ..setNavigationDelegate(
//       NavigationDelegate(
//         onProgress: (int progress) {
//           // Update loading bar.
//           print(progress);
//         },
//         onPageStarted: (String url) {
//           // loading.value = false;
//           // loading.notifyListeners();
//
//         },
//         onPageFinished: (String url) {
//           navigate.pop(context);
//         },
//         onWebResourceError: (WebResourceError error) {
//           // context.pop();
//         },
//         onNavigationRequest: (NavigationRequest request) {
//           if (request.url.startsWith('https://dev.cloudmesoft.com/get_schedule_data')) {
//             return NavigationDecision.prevent;
//           }
//           return NavigationDecision.navigate;
//         },
//       ),
//     )..loadRequest(Uri.parse('https://dev.cloudmesoft.com/get_schedule_data'));
//
//   // void _incrementCounter() {
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async =>true,
//       child: ValueListenableBuilder<bool>(
//           valueListenable: loading,
//           builder: (context,isloading,_) {
//             return WebViewWidget(
//               controller: controller,
//             );
//           }
//       ),
//     );
//   }
// }
import 'package:flutter/foundation.dart';
import 'package:rising_gym/core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../../rought_genrator.dart';

class ViewAllScedule extends StatefulWidget {
  ViewAllScedule({Key? key}) : super(key: key);

  @override
  State<ViewAllScedule> createState() => _WebviewState();
}

class _WebviewState extends State<ViewAllScedule> {
  int _counter = 0;
  ValueNotifier<bool> loading = ValueNotifier(true);
  SpinKitRotatingCircle  get spinkit =>  SpinKitRotatingCircle(
    color: FlutterFlowTheme.of(context).primary,
    size: 50.0,
  );
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    // controller.);
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   loading.value = true;
    //   showDialog(context: context, builder: (context) => spinkit);
    // });
    super.initState();
  }
  WebViewController get controller => WebViewController(onPermissionRequest: (permission)=>permission.platform.grant())
  // ..clearCache()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(FlutterFlowTheme.of(context).primaryBackground)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
          if (kDebugMode) {
            print(progress);
          }
        },
        onPageStarted: (String url) {
          // loading.value = false;
          // loading.notifyListeners();

        },
        onPageFinished: (String url) {
          // if(loading.value) {
          //   loading.value == false;
          //   navigate.pop(context);
          // }

        },
        onWebResourceError: (WebResourceError error) {
          // context.pop();
        },
        onNavigationRequest: (NavigationRequest request) {
          // if (request.url.startsWith('https://risinggym.com/')) {
          //   return NavigationDecision.prevent;
          // }
          // loading.value = true;
          // showDialog(context: context, builder: (context) => spinkit);
          return NavigationDecision.navigate;
        },
      ),
    )..loadRequest(Uri.parse('https://dev.cloudmesoft.com/get_schedule_data'));

  // void _incrementCounter() {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>false,
      child:  WebViewWidget(
        controller: controller,
      ),
    );
  }
}
