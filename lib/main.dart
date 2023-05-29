import 'package:country_code_picker/country_code_picker.dart';
import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'core/util/presentation/constants/ic_constants.dart';
import 'core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import 'core/util/presentation/styles/theme.dart';
import 'injection_container.dart' as di;
import 'generated/l10n.dart';
import 'rought_genrator.dart';
import 'tdd/domain/entities/vx_store.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: const FirebaseOptions(apiKey: "AIzaSyD2VSxQ77bxHFLMHIdzNY3lbY23uPoTrgA", appId: "1:772276630637:web:ab958a8e34fb22c369fb64", messagingSenderId: "772276630637", projectId: "asfa-mantanance-works"),
  // );
  await di.init();
  runApp(VxState(store: ProjectStore(),
  child:  MyApp()));
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlutterSizer(builder: (context , oriantation , type ) {
      // print("theme changed ${(states.props.first as ThemesData?)?.name.name}");
      return MaterialApp.router(

        title: 'Cloud Me',
        theme: ThemeData(brightness: Brightness.light),
        darkTheme: ThemeData(brightness: Brightness.dark),
        themeMode: _themeMode,
          supportedLocales:[... languages.map((language) => Locale(language.languageCode!, language.countryCode)),...[
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
          ]],
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            CountryLocalizations.delegate,
          ],
          routerDelegate:  router.routerDelegate,
          routeInformationParser: router.routeInformationParser,
        );
      }
    );
  }
}

