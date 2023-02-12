import '../../../tdd/domain/usecase/auth/db_config_usecase.dart';

class Config {
  static const ENV_NAME = "ENV_NAME";
  static const API_URL = "API_URL";
  static const BFF_API_URL = "BFF_API_URL";
  static const CLIENT_ID = "CLIENT_ID";
  static const HOSTED_UI_URL = 'HOSTED_UI_URL';
  static const SQUARE_APP_ID = 'SQUARE_APP_ID';
  static const DONATION_UI_URL = 'DONATION_UI_URL';
  static const STRIPE_PUBLISHABLE_KEY = 'STRIPE_PUBLISHABLE_KEY';
  static const VAP_ID_KEY = 'VAP_ID_KEY';
  static const APPLICATION_ID = 'APPLICATION_ID';
  static const BUNDLE_ID = 'BUNDLE_ID';
  static const DYNAMIC_LINKS_API_URL = 'DYNAMIC_LINKS_API_URL';
  static const FIREBASE_WEB_CLIENT_KEY = 'FIREBASE_WEB_CLIENT_KEY';
  static const IS_NEW_DESIGN = 'IS_NEW_DESIGN';
  static const CONTENTFUL_URL = 'CONTENTFUL_URL';
  static const FB_ID_URL = 'FB_ID_URL';
  static const ENCRYPT_KEY = 'ENCRYPT_KEY';
  static const RECAPTCHA_SITE_KEY = 'RECAPTCHA_SITE_KEY';
  static const DB_TYPE = 'DB_TYPE';

  static Map<String, dynamic> constants = {
    API_URL: const String.fromEnvironment(API_URL),
    BFF_API_URL: const String.fromEnvironment(BFF_API_URL),
    CLIENT_ID: const String.fromEnvironment(CLIENT_ID),
    HOSTED_UI_URL: const String.fromEnvironment(HOSTED_UI_URL),
    SQUARE_APP_ID: const String.fromEnvironment(SQUARE_APP_ID),
    DONATION_UI_URL: const String.fromEnvironment(DONATION_UI_URL),
    APPLICATION_ID: const String.fromEnvironment(APPLICATION_ID),
    STRIPE_PUBLISHABLE_KEY: const String.fromEnvironment(STRIPE_PUBLISHABLE_KEY),
    BUNDLE_ID: const String.fromEnvironment(BUNDLE_ID),
    VAP_ID_KEY: const String.fromEnvironment(VAP_ID_KEY),
    DYNAMIC_LINKS_API_URL: const String.fromEnvironment(DYNAMIC_LINKS_API_URL),
    FIREBASE_WEB_CLIENT_KEY: const String.fromEnvironment(FIREBASE_WEB_CLIENT_KEY),
    IS_NEW_DESIGN: const String.fromEnvironment(IS_NEW_DESIGN),
    CONTENTFUL_URL: const String.fromEnvironment(CONTENTFUL_URL),
    FB_ID_URL: const String.fromEnvironment(FB_ID_URL),
    ENCRYPT_KEY: const String.fromEnvironment(ENCRYPT_KEY),
    RECAPTCHA_SITE_KEY: const String.fromEnvironment(RECAPTCHA_SITE_KEY),
    DB_TYPE:  String.fromEnvironment(DB_TYPE,defaultValue:DBType.sqlfite.name),
  };

  static Map<String, dynamic> stgConstants = {
    ENV_NAME: "STAGING",
    ...constants,
  };

  static Map<String, dynamic> prodConstants = {
    ENV_NAME: "PRODUCTION",
    ...constants,
  };
}