class TillManagment {
  int? autoId;
  String? uuid;
  String? mongoId;
  int? sync;
  String? date;
  String? userId;
  String? userName;
  String? openAmount;
  String? status;
  Null? closeAmount;
  String? openDateTime;
  Null? closeDateTime;
  int? dayId;

  TillManagment(
      {this.autoId,
        this.uuid,
        this.mongoId,
        this.sync,
        this.date,
        this.userId,
        this.userName,
        this.openAmount,
        this.status,
        this.closeAmount,
        this.openDateTime,
        this.closeDateTime,
        this.dayId});

  TillManagment.fromJson(Map<String, dynamic> json) {
    autoId = json['autoId'];
    uuid = json['uuid'];
    mongoId = json['mongo_id'];
    sync = json['sync'];
    date = json['date'];
    userId = json['user_id'];
    userName = json['user_name'];
    openAmount = json['open_amount'];
    status = json['status'];
    closeAmount = json['close_amount'];
    openDateTime = json['open_dateTime'];
    closeDateTime = json['close_dateTime'];
    dayId = json['dayId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['autoId'] = this.autoId;
    data['uuid'] = this.uuid;
    data['mongo_id'] = this.mongoId;
    data['sync'] = this.sync;
    data['date'] = this.date;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['open_amount'] = this.openAmount;
    data['status'] = this.status;
    data['close_amount'] = this.closeAmount;
    data['open_dateTime'] = this.openDateTime;
    data['close_dateTime'] = this.closeDateTime;
    data['dayId'] = this.dayId;
    return data;
  }
}
