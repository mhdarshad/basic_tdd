
import 'core/util/config/config.dart';

class EnvConfig {
  static const API_URL = String.fromEnvironment('API_URL');

  static final Map<String, dynamic> _config = API_URL.contains('production') ? Config.prodConstants : Config.stgConstants;


  static get DB_TYPE => _config[Config.DB_TYPE];

  static get APPLICATION_ID => _config[Config.APPLICATION_ID];

  static get BUNDLE_ID => _config[Config.BUNDLE_ID];

  static get DYNAMIC_LINKS_API_URL => _config[Config.DYNAMIC_LINKS_API_URL];

  static get FIREBASE_WEB_CLIENT_KEY => _config[Config.FIREBASE_WEB_CLIENT_KEY];

  static get FB_ID_URL => _config[Config.FB_ID_URL];

  static get ENCRYPT_KEY => _config[Config.ENCRYPT_KEY];

  static get ENV_NAME => _config[Config.ENV_NAME];
}
