
import 'currency.dart';
import 'settings.dart';

class BusinessDetails {
  BusinessDetails({
    required this.id,
    required this.name,
    required this.status,
    required this.timezone,
    required this.currencyId,
    required this.decimalPoint,
    required this.updatedAt,
    required this.createdAt,
    required this.enabledModules,
    required this.maximumLocation,
    required this.settings,
    required this.maximumUsers,
    required this.currency,
  });
  late final String id;
  late final String name;
  late final String status;
  late final String timezone;
  late final String currencyId;
  late final int decimalPoint;
  late final String updatedAt;
  late final String createdAt;
  late final List<String> enabledModules;
  late final String maximumLocation;
  late final String maximumUsers;
  late final Setting settings;
  late final Currency currency;

  BusinessDetails.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    name = json['name'];
    status = json['status'] ??'';
    timezone = json['timezone'];
    currencyId = json['currency_id'];
    decimalPoint = json['decimal_point'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    enabledModules = List.castFrom<dynamic, String>(json['enabled_modules']);
    maximumLocation = json['maximum_location'];
    if(json['settings']!=null) {
      settings = Setting.fromJson(json['settings']);
    }
    maximumUsers = json['maximum_users'];
    if(json['currency']!=null) {
      currency = Currency.fromJson(json['currency']);
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['status'] = status;
    _data['timezone'] = timezone;
    _data['currency_id'] = currencyId;
    _data['decimal_point'] = decimalPoint;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    _data['enabled_modules'] = enabledModules;
    _data['maximum_location'] = maximumLocation;
    _data['maximum_users'] = maximumUsers;
    _data['settings'] = settings.toJson();
    _data['currency'] = currency.toJson();
    return _data;
  }
}