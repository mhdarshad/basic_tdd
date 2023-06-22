
import 'package:flutter/foundation.dart';

import '../../../../tdd/domain/entities/language.dart';

class APIConstants {
  static String BaseUrl = kDebugMode?'https://dev.cloudmesoft.com/api/flutter/':"https://dev.cloudmesoft.com/api/flutter/";
  static String API_IMAGE = "$BaseUrl/uploads/";
  static String API_URI = "$BaseUrl";
}
class SFkeys{
  static String LOGEDIN = "logedin";
  static String BRANCH = "branch";
  static String ID = "phone";
  static String UID = "user_id";
  static String UType = "user_type";
  static String token = "auth_token";
}
class KeyConstants{
  static String google_api_key = "AIzaSyCGox2ktjpxx-Bzh6RrrDTtATIdvDanNh4";
}
 List<LanguageModel> get languages => [
  LanguageModel(imageUrl: "", languageName: 'English', countryCode: 'US', languageCode: 'en'),
  LanguageModel(imageUrl: "", languageName: 'Arabic', countryCode: 'SA', languageCode: 'ar'),
];
enum USTatus{
  all,active,inactive
}