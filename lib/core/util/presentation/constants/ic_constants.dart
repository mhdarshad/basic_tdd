
import 'package:flutter/foundation.dart';

import '../../../../tdd/domain/modle/language.dart';

class APIConstants {
  static String BaseUrl = kDebugMode?'https://dev.cloudmesoft.com/api/flutter/':"https://dev.cloudmesoft.com/api/flutter/";
  static String API_IMAGE = "$BaseUrl/uploads/";
  static String API_URI = "$BaseUrl";
}
class SFkeys{
  static String LOGEDIN = "logedin";
  static String BRANCH = "branch";
  static String DEVICE_ID = "device_id";
  static String UID = "user_id";
  static String UType = "user_type";
  static String token = "auth_token";
}
class KeyConstants{
  static String google_api_key = "AIzaSyCGox2ktjpxx-Bzh6RrrDTtATIdvDanNh4";
}
 List<LanguageModel> get languages => [
   //   const Locale("af"),
   //   const Locale("am"),
   //   const Locale("ar"),
   //   const Locale("az"),
   //   const Locale("be"),
   //   const Locale("bg"),
   //   const Locale("bn"),
   //   const Locale("bs"),
   //   const Locale("ca"),
   //   const Locale("cs"),
   //   const Locale("da"),
   //   const Locale("de"),
   //   const Locale("el"),
   //   const Locale("en"),
   //   const Locale("es"),
   //   const Locale("et"),
   //   const Locale("fa"),
   //   const Locale("fi"),
   //   const Locale("fr"),
   //   const Locale("gl"),
   //   const Locale("ha"),
   //   const Locale("he"),
   //   const Locale("hi"),
   //   const Locale("hr"),
   //   const Locale("hu"),
   //   const Locale("hy"),
   //   const Locale("id"),
   //   const Locale("is"),
   //   const Locale("it"),
   //   const Locale("ja"),
   //   const Locale("ka"),
   //   const Locale("kk"),
   //   const Locale("km"),
   //   const Locale("ko"),
   //   const Locale("ku"),
   //   const Locale("ky"),
   //   const Locale("lt"),
   //   const Locale("lv"),
   //   const Locale("mk"),
   //   const Locale("ml"),
   //   const Locale("mn"),
   //   const Locale("ms"),
   //   const Locale("nb"),
   //   const Locale("nl"),
   //   const Locale("nn"),
   //   const Locale("no"),
   //   const Locale("pl"),
   //   const Locale("ps"),
   //   const Locale("pt"),
   //   const Locale("ro"),
   //   const Locale("ru"),
   //   const Locale("sd"),
   //   const Locale("sk"),
   //   const Locale("sl"),
   //   const Locale("so"),
   //   const Locale("sq"),
   //   const Locale("sr"),
   //   const Locale("sv"),
   //   const Locale("ta"),
   //   const Locale("tg"),
   //   const Locale("th"),
   //   const Locale("tk"),
   //   const Locale("tr"),
   //   const Locale("tt"),
   //   const Locale("uk"),
   //   const Locale("ug"),
   //   const Locale("ur"),
   //   const Locale("uz"),
   //   const Locale("vi"),
   //   const Locale("zh")

  LanguageModel(imageUrl: "", languageName: 'English', countryCode: 'US', languageCode: 'en'),
  LanguageModel(imageUrl: "", languageName: 'Arabic', countryCode: 'SA', languageCode: 'ar'),
  LanguageModel(imageUrl: "", languageName: 'Hindi', countryCode: 'IN', languageCode: 'hi'),
  LanguageModel(imageUrl: "", languageName: 'Kannada', countryCode: 'IN', languageCode: 'kn'),
  LanguageModel(imageUrl: "", languageName: 'Malayalam', countryCode: 'IN', languageCode: 'ml'),
  LanguageModel(imageUrl: "", languageName: 'Telugu', countryCode: 'IN', languageCode: 'te'),
];
enum USTatus{
  all,active,inactive
}