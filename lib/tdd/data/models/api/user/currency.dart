
class Currency {
  Currency({
    required this.id,
    required this.country,
    required this.currency,
    required this.code,
    required this.symbol,
    required this.thousandSeparator,
    required this.decimalSeparator,
    this.createdAt,
    this.updatedAt,
  });
  late final String id;
  late final String country;
  late final String currency;
  late final String code;
  late final String symbol;
  late final String thousandSeparator;
  late final String decimalSeparator;
  late final Null createdAt;
  late final Null updatedAt;

  Currency.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    country = json['country'];
    currency = json['currency'];
    code = json['code'];
    symbol = json['symbol'];
    thousandSeparator = json['thousand_separator'];
    decimalSeparator = json['decimal_separator'];
    createdAt = null;
    updatedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['country'] = country;
    _data['currency'] = currency;
    _data['code'] = code;
    _data['symbol'] = symbol;
    _data['thousand_separator'] = thousandSeparator;
    _data['decimal_separator'] = decimalSeparator;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}