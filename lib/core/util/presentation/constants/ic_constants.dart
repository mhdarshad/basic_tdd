
import '../../../../tdd/domain/entities/language.dart';

class APIConstants {
  static String BaseUrl = "http://manage.rinzyee.com/";
  static String API_IMAGE = "$BaseUrl/uploads/";
  static String API_URI = "$BaseUrl";
}
class Prefrence{
  static String LOGEDIN = "logedin";
  static String BRANCH = "branch";
  static String ID = "phone";
  static String UID = "user_id";
}
class KeyConstants{
  static String google_api_key = "AIzaSyCGox2ktjpxx-Bzh6RrrDTtATIdvDanNh4";
}
 List<LanguageModel> get languages => [
  LanguageModel(imageUrl: "", languageName: 'English', countryCode: 'US', languageCode: 'en'),
  LanguageModel(imageUrl: "", languageName: 'Arabic', countryCode: 'SA', languageCode: 'ar'),
];