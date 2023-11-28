import 'dart:io';

import 'package:rising_gym/core/network/http_override.dart';
import 'package:rising_gym/tdd/presentaion/modules/notifier/error/error_notifier_container.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
import 'core/util/config/config.dart';
import 'core/util/presentation/constants/ic_constants.dart';
import 'core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import 'injection_container.dart' as di;
import 'generated/l10n.dart';
import 'rought_genrator.dart';
import 'tdd/domain/modle/vx_store.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  // await Firebase.initializeApp(
  //   options: const FirebaseOptions(apiKey: "AIzaSyD2VSxQ77bxHFLMHIdzNY3lbY23uPoTrgA", appId: "1:772276630637:web:ab958a8e34fb22c369fb64", messagingSenderId: "772276630637", projectId: "asfa-mantanance-works"),
  // );
  await di.init();
  final path = VxState(store: ProjectStore(),
      child:  MyApp());
  if(!kDebugMode){
    SentryFlutter.init((options) {
      options.dsn = /*Config.stgConstants[Config.sanitoryDNS]*/'https://79dd60cc87b630dc68309397ea3a040d@o4504473477054464.ingest.sentry.io/4505684994359296 ';
      options.tracesSampleRate = 1.0;
      options.enableAutoSessionTracking = true;
      options.environment = /*Config.stgConstants[Config.isdevelopment]?'Dev':*/'Live';
    },appRunner: () => runApp(path));
  } else {
    runApp(path);
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final ThemeMode _themeMode = FlutterFlowTheme.themeMode;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlutterSizer(builder: (context , oriantation , type ) {
      // print("theme changed ${(states.props.first as ThemesData?)?.name.name}");
      return MaterialApp.router(
        routerConfig: router,
        title: 'Rising GYM',
        theme: ThemeData(brightness: Brightness.light),
        darkTheme: ThemeData(brightness: Brightness.light),
        themeMode: _themeMode,
        supportedLocales:[
          ... languages.map((language) => Locale(language.languageCode!, language.countryCode)),
          ...[
            const Locale("af"),
            const Locale("am"),
            const Locale("ar"),
            const Locale("az"),
            const Locale("be"),
            const Locale("bg"),
            const Locale("bn"),
            const Locale("bs"),
            const Locale("ca"),
            const Locale("cs"),
            const Locale("da"),
            const Locale("de"),
            const Locale("el"),
            const Locale("en"),
            const Locale("es"),
            const Locale("et"),
            const Locale("fa"),
            const Locale("fi"),
            const Locale("fr"),
            const Locale("gl"),
            const Locale("ha"),
            const Locale("he"),
            const Locale("hi"),
            const Locale("hr"),
            const Locale("hu"),
            const Locale("hy"),
            const Locale("id"),
            const Locale("is"),
            const Locale("it"),
            const Locale("ja"),
            const Locale("ka"),
            const Locale("kk"),
            const Locale("km"),
            const Locale("ko"),
            const Locale("ku"),
            const Locale("ky"),
            const Locale("lt"),
            const Locale("lv"),
            const Locale("mk"),
            const Locale("ml"),
            const Locale("mn"),
            const Locale("ms"),
            const Locale("nb"),
            const Locale("nl"),
            const Locale("nn"),
            const Locale("no"),
            const Locale("pl"),
            const Locale("ps"),
            const Locale("pt"),
            const Locale("ro"),
            const Locale("ru"),
            const Locale("sd"),
            const Locale("sk"),
            const Locale("sl"),
            const Locale("so"),
            const Locale("sq"),
            const Locale("sr"),
            const Locale("sv"),
            const Locale("ta"),
            const Locale("tg"),
            const Locale("th"),
            const Locale("tk"),
            const Locale("tr"),
            const Locale("tt"),
            const Locale("uk"),
            const Locale("ug"),
            const Locale("ur"),
            const Locale("uz"),
            const Locale("vi"),
            const Locale("zh")
          ]
        ],
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          CountryLocalizations.delegate,
        ],
      );
    }
    );
  }
}

