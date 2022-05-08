class SlotsData {
  int? status;
  String? message;
  List<Sloat>? data;
  int? otp;

  SlotsData({this.status, this.message, this.data, this.otp});

  SlotsData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Sloat>[];
      json['data'].forEach((v) {
        data!.add(new Sloat.fromJson(v));
      });
    }
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    data['otp'] = this.otp;
    return data;
  }
}

class Sloat {
  String? date;
  String? id;
  String? start;
  String? end;
  String? area;

  Sloat({this.date, this.id, this.start, this.end, this.area});

  Sloat.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    id = json['id'];
    start = json['start'];
    end = json['end'];
    area = json['area'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['id'] = this.id;
    data['start'] = this.start;
    data['end'] = this.end;
    data['area'] = this.area;
    return data;
  }
}

