class Payment {
  int? id;
  String? headId;
  String? paymentId;
  String? paymentName;
  String? amountPaid;
  String? tendered;
  String? userId;
  String? userName;
  String? date;
  String? cardType;
  String? transactionNo;

  Payment(
      {this.id,
        this.headId,
        this.paymentId,
        this.paymentName,
        this.amountPaid,
        this.tendered,
        this.userId,
        this.userName,
        this.date,
        this.cardType,
        this.transactionNo});

  Payment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    headId = json['headId'];
    paymentId = json['paymentId'];
    paymentName = json['paymentName'];
    amountPaid = json['amountPaid'];
    tendered = json['tendered'];
    userId = json['userId'];
    userName = json['userName'];
    date = json['date'];
    cardType = json['cardType'];
    transactionNo = json['transactionNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['headId'] = this.headId;
    data['paymentId'] = this.paymentId;
    data['paymentName'] = this.paymentName;
    data['amountPaid'] = this.amountPaid;
    data['tendered'] = this.tendered;
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['date'] = this.date;
    data['cardType'] = this.cardType;
    data['transactionNo'] = this.transactionNo;
    return data;
  }
}
