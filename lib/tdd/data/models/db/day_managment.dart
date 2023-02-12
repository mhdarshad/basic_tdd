class DayManagement {
  int? autoId;
  String? uuid;
  String? mongoId;
  int? sync;
  String? date;
  String? openDateAndTime;
  String? userId;
  String? userName;
  String? status;
  String? closeDateAndTime;

  DayManagement(
      {this.autoId,
        this.uuid,
        this.mongoId,
        this.sync,
        this.date,
        this.openDateAndTime,
        this.userId,
        this.userName,
        this.status,
        this.closeDateAndTime});

  DayManagement.fromJson(Map<String, dynamic> json) {
    autoId = json['autoId'];
    uuid = json['uuid'];
    mongoId = json['mongo_id'];
    sync = json['sync'];
    date = json['date'];
    openDateAndTime = json['open_date_and_time'];
    userId = json['user_id'];
    userName = json['user_name'];
    status = json['status'];
    closeDateAndTime = json['close_date_and_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['autoId'] = this.autoId;
    data['uuid'] = this.uuid;
    data['mongo_id'] = this.mongoId;
    data['sync'] = this.sync;
    data['date'] = this.date;
    data['open_date_and_time'] = this.openDateAndTime;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['status'] = this.status;
    data['close_date_and_time'] = this.closeDateAndTime;
    return data;
  }
}
