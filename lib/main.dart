import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'core/util/presentation/constants/ic_constants.dart';
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
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlutterSizer(builder: (context , oriantation , type ) {
      // print("theme changed ${(states.props.first as ThemesData?)?.name.name}");
      return DynamicTheme(
          themeCollection: dynamicTheme.theme,
          defaultThemeId: 1, // optional, default id is 0
          builder: (context, theme) {
          return MaterialApp.router(
            title: 'Cloud Me',
              theme: theme,
              supportedLocales: languages.map((language) => Locale(language.languageCode!, language.countryCode)),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              routerDelegate:  router.routerDelegate,
              routeInformationParser: router.routeInformationParser,
            );
        }
      );
      }
    );
  }
}

