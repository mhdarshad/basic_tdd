import 'dart:convert';

class Config {
  static const ENV_NAME = "ENV_NAME";
  static const API_URL = "API_URL";
  static const CLIENT_ID = "CLIENT_ID";
  static const DB_DATA = 'DB_DATA';
  static const sanitoryDNS = 'sanitoryDNS';
  static const isdevelopment = 'isDevelopment';

  static Map<String, dynamic> constants = {
    API_URL: const String.fromEnvironment(API_URL),
    CLIENT_ID: const String.fromEnvironment(CLIENT_ID),
    sanitoryDNS: const String.fromEnvironment(sanitoryDNS),
    isdevelopment: const bool.fromEnvironment(isdevelopment),
    DB_DATA:  const bool.hasEnvironment(DB_DATA)?jsonDecode(const String.fromEnvironment(DB_DATA)):null,
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