
import '../../db/users.dart';
import 'business_detail.dart';
import 'business_locations.dart';
import 'devices.dart';
import 'payment_methode.dart';
import 'printers.dart';
import 'selling_price_group.dart';
import 'service_type.dart';
import 'taxes.dart';

class UserAcsessData {
  UserAcsessData({
    required this.token,
    required this.userId,
    required this.businessDetails,
    required this.businessLocations,
    required this.customFields,
    required this.serviceTypes,
    required this.paymentMethods,
    required this.name,
    required this.users,
    required this.printers,
    required this.serviceRoutes,
    required this.sellingPriceGroup,
    required this.taxes,
    required this.device,
  });
  late final String token;
  late final String userId;
  late final BusinessDetails businessDetails;
  late final List<BusinessLocations> businessLocations;
  late final List<dynamic> customFields;
  late final List<ServiceTypes> serviceTypes;
  late final List<PaymentMethods> paymentMethods;
  late final String name;
  late final List<Users> users;
  late final List<Printers> printers;
  late final List<dynamic> serviceRoutes;
  late final List<SellingPriceGroup> sellingPriceGroup;
  late final List<Taxes> taxes;
  late final Device? device;

  UserAcsessData.fromJson(Map<String, dynamic> json){
    token = json['token'];
    userId = json['user_id'];
    businessDetails = BusinessDetails.fromJson(json['business_details']);
    businessLocations = List.from(json['business_locations']).map((e)=>BusinessLocations.fromJson(e)).toList();
    customFields = List.castFrom<dynamic, dynamic>(json['custom_fields']);
    serviceTypes = List.from(json['service_types']).map((e)=>ServiceTypes.fromJson(e)).toList();
    paymentMethods = List.from(json['payment_methods']).map((e)=>PaymentMethods.fromJson(e)).toList();
    name = json['name'];
    users = List.from(json['users']).map((e)=>Users.fromJson(e)).toList();
    printers = List.from(json['printers']).map((e)=>Printers.fromJson(e)).toList();
    serviceRoutes = List.castFrom<dynamic, dynamic>(json['service_routes']);
    sellingPriceGroup = List.from(json['selling_price_group']).map((e)=>SellingPriceGroup.fromJson(e)).toList();
    taxes = List.from(json['taxes']).map((e)=>Taxes.fromJson(e)).toList();
    device = json['device'] != null ? Device.fromJson(json['device']) : null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    _data['user_id'] = userId;
    _data['business_details'] = businessDetails.toJson();
    _data['business_locations'] = businessLocations.map((e)=>e.toJson()).toList();
    _data['custom_fields'] = customFields;
    _data['service_types'] = serviceTypes.map((e)=>e.toJson()).toList();
    _data['payment_methods'] = paymentMethods.map((e)=>e.toJson()).toList();
    _data['name'] = name;
    _data['users'] = users.map((e)=>e.toJson()).toList();
    _data['printers'] = printers.map((e)=>e.toJson()).toList();
    _data['service_routes'] = serviceRoutes;
    _data['selling_price_group'] = sellingPriceGroup.map((e)=>e.toJson()).toList();
    _data['taxes'] = taxes.map((e)=>e.toJson()).toList();
    if (device != null) {
      _data['device'] = device!.toJson();
    }
    return _data;
  }
}