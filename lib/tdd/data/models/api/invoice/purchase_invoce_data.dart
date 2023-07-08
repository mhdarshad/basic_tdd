class PurchaseInvoiceData {
  String? cartCurrency;
  String? cartID;
  String? profileId;
  String? tranCurrency;//e
  String? cartAmount;//f
  PaymentInfo? paymentInfo;//
  String? token;
  String? serviceId;
  bool? isPending;
  String? transactionReference;
  PaymentResult? paymentResult;
  String? trace;
  String? transactionType;
  BillingDetailss? billingDetails;
  String? tranTotal;
  String? merchantId;//
  bool? isSuccess;//
  bool? isOnHold;
  String? cartDescription;
  bool? isAuthorized;
  bool? isProcessed;

  PurchaseInvoiceData(
      {this.cartCurrency,
        this.cartID,
        this.profileId,
        this.tranCurrency,
        this.cartAmount,
        this.paymentInfo,
        this.token,
        this.serviceId,
        this.isPending,
        this.transactionReference,
        this.paymentResult,
        this.trace,
        this.transactionType,
        this.billingDetails,
        this.tranTotal,
        this.merchantId,
        this.isSuccess,
        this.isOnHold,
        this.cartDescription,
        this.isAuthorized,
        this.isProcessed});

  PurchaseInvoiceData.fromJson(Map<String, dynamic> json) {
    cartCurrency = json['cartCurrency'];
    cartID = json['cartID'];
    profileId = json['profileId'].toString();
    tranCurrency = json['tranCurrency'];
    cartAmount = json['cartAmount'];
    paymentInfo = json['paymentInfo'] != null
        ? PaymentInfo.fromJson((json['paymentInfo']).map((key, value) => MapEntry(key.toString(), value  as dynamic)))
        : null;
    token = json['token'];
    serviceId = json['serviceId'].toString();
    isPending = json['isPending'];
    transactionReference = json['transactionReference'];
    paymentResult = json['paymentResult'] != null
        ? PaymentResult.fromJson(json['paymentResult'].map((key, value) => MapEntry(key.toString(), value  as dynamic)))
        : null;
    trace = json['trace'];
    transactionType = json['transactionType'];
    billingDetails = json['billingDetails'] != null
        ? BillingDetailss.fromJson(json['billingDetails'] .map((key, value) => MapEntry(key.toString(), value  as dynamic)))
        : null;
    tranTotal = json['tranTotal'];
    merchantId = (json['merchantId']??json['a']).toString();
    isSuccess = json['isSuccess'];
    isOnHold = json['isOnHold'];
    cartDescription = json['cartDescription'];
    isAuthorized = json['isAuthorized'];
    isProcessed = json['isProcessed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cartCurrency'] = cartCurrency;
    data['cartID'] = cartID;
    data['profileId'] = profileId;
    data['tranCurrency'] = tranCurrency;
    data['cartAmount'] = cartAmount;
    if (paymentInfo != null) {
      data['paymentInfo'] = paymentInfo!.toJson();
    }
    data['token'] = token;
    data['serviceId'] = serviceId;
    data['isPending'] = isPending;
    data['transactionReference'] = transactionReference;
    if (paymentResult != null) {
      data['paymentResult'] = paymentResult!.toJson();
    }
    data['trace'] = trace;
    data['transactionType'] = transactionType;
    if (billingDetails != null) {
      data['billingDetails'] = billingDetails!.toJson();
    }
    data['tranTotal'] = tranTotal;
    data['merchantId'] = merchantId;
    data['isSuccess'] = isSuccess;
    data['isOnHold'] = isOnHold;
    data['cartDescription'] = cartDescription;
    data['isAuthorized'] = isAuthorized;
    data['isProcessed'] = isProcessed;
    return data;
  }
}

class PaymentInfo {
  String? paymentDescription;//
  String? cardType;
  String? paymentMethod;//
  String? expiryMonth;
  String? cardScheme;
  String? expiryYear;

  PaymentInfo(
      {this.paymentDescription,
        this.cardType,
        this.paymentMethod,
        this.expiryMonth,
        this.cardScheme,
        this.expiryYear});

  PaymentInfo.fromJson(Map<dynamic, dynamic> json) {
    paymentDescription = json['paymentDescription'];
    cardType = json['cardType'];
    paymentMethod = json['payment_method'];
    expiryMonth = json['expiryMonth'].toString();
    cardScheme = json['cardScheme'];
    expiryYear = json['expiryYear'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['paymentDescription'] = paymentDescription;
    data['cardType'] = cardType;
    data['payment_method'] = paymentMethod;
    data['expiryMonth'] = expiryMonth;
    data['cardScheme'] = cardScheme;
    data['expiryYear'] = expiryYear;
    return data;
  }
}

class PaymentResult {
  String? responseCode;
  String? transactionTime;
  String? responseMessage;
  String? responseStatus;

  PaymentResult(
      {this.responseCode,
        this.transactionTime,
        this.responseMessage,
        this.responseStatus});

  PaymentResult.fromJson(Map<dynamic, dynamic> json) {
    responseCode = json['responseCode'];
    transactionTime = json['transactionTime'];
    responseMessage = json['responseMessage'];
    responseStatus = json['responseStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['responseCode'] = responseCode;
    data['transactionTime'] = transactionTime;
    data['responseMessage'] = responseMessage;
    data['responseStatus'] = responseStatus;
    return data;
  }
}

class BillingDetailss {
  String? phone;
  String? city;
  String? email;
  String? countryCode;
  String? zip;
  String? addressLine;
  String? name;

  BillingDetailss(
      {this.phone,
        this.city,
        this.email,
        this.countryCode,
        this.zip,
        this.addressLine,
        this.name});

  BillingDetailss.fromJson(Map<dynamic, dynamic> json) {
    phone = json['phone'];
    city = json['city'];
    email = json['email'];
    countryCode = json['countryCode'];
    zip = json['zip'];
    addressLine = json['addressLine'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['city'] = city;
    data['email'] = email;
    data['countryCode'] = countryCode;
    data['zip'] = zip;
    data['addressLine'] = addressLine;
    data['name'] = name;
    return data;
  }
}
