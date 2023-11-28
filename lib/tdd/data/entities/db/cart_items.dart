class CartItems {
  int? id;
  String? headId;
  String? cartId;
  String? productId;
  String? name;
  String? variantName;
  String? variantId;
  String? price;
  String? qty;
  String? total;
  String? isSelectFlag;
  String? taxRate;
  String? taxlessPrice;
  String? userId;
  String? userName;
  String? orderTime;
  String? status;
  String? printerId;
  int? isVoid;
  String? isVoidUserId;
  Null? isVoidDateTime;
  String? taxId;
  String? taxMethod;
  String? nameLang;
  String? isCombo;
  String? taxAmount;
  String? barcode;

  CartItems(
      {this.id,
        this.headId,
        this.cartId,
        this.productId,
        this.name,
        this.variantName,
        this.variantId,
        this.price,
        this.qty,
        this.total,
        this.isSelectFlag,
        this.taxRate,
        this.taxlessPrice,
        this.userId,
        this.userName,
        this.orderTime,
        this.status,
        this.printerId,
        this.isVoid,
        this.isVoidUserId,
        this.isVoidDateTime,
        this.taxId,
        this.taxMethod,
        this.nameLang,
        this.isCombo,
        this.taxAmount,
        this.barcode});

  CartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    headId = json['headId'];
    cartId = json['cart_id'];
    productId = json['productId'];
    name = json['name'];
    variantName = json['variant_name'];
    variantId = json['variant_id'];
    price = json['price'];
    qty = json['qty'];
    total = json['total'];
    isSelectFlag = json['isSelectFlag'];
    taxRate = json['tax_rate'];
    taxlessPrice = json['taxlessPrice'];
    userId = json['userId'];
    userName = json['userName'];
    orderTime = json['orderTime'];
    status = json['status'];
    printerId = json['printer_id'];
    isVoid = json['isVoid'];
    isVoidUserId = json['isVoidUserId'];
    isVoidDateTime = json['isVoidDateTime'];
    taxId = json['tax_id'];
    taxMethod = json['tax_method'];
    nameLang = json['name_lang'];
    isCombo = json['is_combo'];
    taxAmount = json['tax_amount'];
    barcode = json['barcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['headId'] = headId;
    data['cart_id'] = cartId;
    data['productId'] = productId;
    data['name'] = name;
    data['variant_name'] = variantName;
    data['variant_id'] = variantId;
    data['price'] = price;
    data['qty'] = qty;
    data['total'] = total;
    data['isSelectFlag'] = isSelectFlag;
    data['tax_rate'] = taxRate;
    data['taxlessPrice'] = taxlessPrice;
    data['userId'] = userId;
    data['userName'] = userName;
    data['orderTime'] = orderTime;
    data['status'] = status;
    data['printer_id'] = printerId;
    data['isVoid'] = isVoid;
    data['isVoidUserId'] = isVoidUserId;
    data['isVoidDateTime'] = isVoidDateTime;
    data['tax_id'] = taxId;
    data['tax_method'] = taxMethod;
    data['name_lang'] = nameLang;
    data['is_combo'] = isCombo;
    data['tax_amount'] = taxAmount;
    data['barcode'] = barcode;
    return data;
  }
}
