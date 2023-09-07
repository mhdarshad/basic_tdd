import 'package:rising_gym/core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../../rought_genrator.dart';

class Webview extends StatefulWidget {
   Webview({Key? key}) : super(key: key);

  @override
  State<Webview> createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
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
  WebViewController get controller => WebViewController()
    // ..clearCache()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(FlutterFlowTheme.of(context).primaryBackground)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
          print(progress);
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
    )..loadRequest(Uri.parse('https://risinggym.com/'));

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
