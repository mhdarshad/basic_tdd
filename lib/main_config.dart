
import 'core/util/config/config.dart';

class EnvConfig {
  static const API_URL = String.fromEnvironment('API_URL');

  static Map<String, dynamic> _config = API_URL.contains('prod') ? Config.prodConstants : Config.stgConstants;

  static get STRIPE_PUBLISHABLE_KEY {
    return _config[Config.STRIPE_PUBLISHABLE_KEY];
  }

  static get HOSTED_UI_URL {
    return _config[Config.HOSTED_UI_URL];
  }

  static get BFF_API_URL {
    return _config[Config.BFF_API_URL];
  }

  static get CLIENT_ID {
    return _config[Config.CLIENT_ID];
  }

  static get VAP_ID_KEY {
    return _config[Config.VAP_ID_KEY];
  }

  static get APPLICATION_ID {
    return _config[Config.APPLICATION_ID];
  }

  static get BUNDLE_ID {
    return _config[Config.BUNDLE_ID];
  }

  static get DYNAMIC_LINKS_API_URL {
    return _config[Config.DYNAMIC_LINKS_API_URL];
  }

  static get FIREBASE_WEB_CLIENT_KEY {
    return _config[Config.FIREBASE_WEB_CLIENT_KEY];
  }

  static get DONATION_UI_URL {
    return _config[Config.DONATION_UI_URL];
  }

  static get IS_NEW_DESIGN {
    return _config[Config.IS_NEW_DESIGN] == 'true';
  }

  static get CONTENTFUL_URL {
    return _config[Config.CONTENTFUL_URL];
  }

  static get FB_ID_URL {
    return _config[Config.FB_ID_URL];
  }

  static get ENCRYPT_KEY {
    return _config[Config.ENCRYPT_KEY];
  }

  static get RECAPTCHA_SITE_KEY {
    return _config[Config.RECAPTCHA_SITE_KEY];
  }

  static get ENV_NAME {
    return _config[Config.ENV_NAME];
  }
}
