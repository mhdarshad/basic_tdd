class Scedule {
  int? id;
  String? title;
  List<Date>? date;
  List<Appointments>? appointments;
  int? planId;
  int? staffId;
  int? memberCount;
  Map<String,dynamic>? days;
  List<Attaindence>? attaindence;
  String? room_id;
  String? trainername;

  Scedule(
      {this.id,
        this.title,
        this.date,
        this.appointments,
        this.planId,
        this.trainername,
        this.staffId,
        this.memberCount,
        this.attaindence,
        this.room_id,
        this.days});

  Scedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['Date'] != null) {
      date = <Date>[];
      json['Date'].forEach((v) {
        date!.add(Date.fromJson(v));
      });
    }
    if (json['attendance'] != null) {
      appointments = <Appointments>[];
      json['appointments'].forEach((v) {
        appointments!.add(Appointments.fromJson(v));
      });
    }
    if (json['attendance'] != null) {
      attaindence = <Attaindence>[];
      json['attendance'].forEach((v) {
        attaindence!.add(Attaindence.fromJson(v));
      });
    }
    planId = json['plan_id'];
    trainername = json['staff_name'];
    room_id = json['room_id'];
    staffId = json['staff_id'];
    memberCount = json['member_count'];
    if (json['Days'] != null) {
      days  = json['Days'].first;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    if (date != null) {
      data['Date'] = date!.map((v) => v.toJson()).toList();
    }
    if (attaindence != null) {
      data['appointments'] = appointments!.map((v) => v.toJson()).toList();
    }
    if (attaindence != null) {
      data['attendance'] = appointments!.map((v) => v.toJson()).toList();
    }
    data['plan_id'] = planId;
    data['room_id'] = staffId;
    data['staff_id'] = room_id;
    data['staff_name'] = trainername;
    data['member_count'] = memberCount;
    if (days != null) {
      data['Days'] = days;
    }
    return data;
  }
}

class Date {
  String? startDate;
  String? endDate;

  Date({this.startDate, this.endDate});

  Date.fromJson(Map<String, dynamic> json) {
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    return data;
  }
}

class Appointments {
  String? startTime;
  String? endTime;

  Appointments({this.startTime, this.endTime});

  Appointments.fromJson(Map<String, dynamic> json) {
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    return data;
  }
}

class Days {
  int? sun;
  int? mon;
  int? tue;
  int? wed;
  int? thu;
  int? fri;
  int? sat;

  Days({this.sun, this.mon, this.tue, this.wed, this.thu, this.fri, this.sat});

  Days.fromJson(Map<String, dynamic> json) {
    sun = json['sun'];
    mon = json['mon'];
    tue = json['tue'];
    wed = json['wed'];
    thu = json['thu'];
    fri = json['fri'];
    sat = json['sat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sun'] = sun;
    data['mon'] = mon;
    data['tue'] = tue;
    data['wed'] = wed;
    data['thu'] = thu;
    data['fri'] = fri;
    data['sat'] = sat;
    return data;
  }
}
class Attaindence {
  int? id;
  int? custId;
  Null? invoiceNo;
  int? batchId;
  String? date;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Attaindence(
      {this.id,
        this.custId,
        this.invoiceNo,
        this.batchId,
        this.date,
        this.userId,
        this.createdAt,
        this.updatedAt});

  Attaindence.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    custId = json['cust_id'];
    invoiceNo = json['invoice_no'];
    batchId = json['batch_id'];
    date = json['date'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cust_id'] = this.custId;
    data['invoice_no'] = this.invoiceNo;
    data['batch_id'] = this.batchId;
    data['date'] = this.date;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
