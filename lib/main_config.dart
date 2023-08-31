
import 'core/util/config/config.dart';

class EnvConfig {
  static const API_URL = String.fromEnvironment('API_URL',defaultValue: 'https://dev.cloudmesoft.com/api/flutter/');
  static final Map<String, dynamic> _config = API_URL.contains('production') ? Config.prodConstants : Config.stgConstants;
  static get DB_TYPE => _config[Config.DB_DATA];
}
