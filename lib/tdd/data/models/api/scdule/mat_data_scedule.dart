class SceduleMat {
  String? classDate;
  int? index;
  int? classId;
  int? roomId;
  String? roomName;
  String? className;
  String? status;

  SceduleMat(
      {this.classDate,
        this.index,
        this.classId,
        this.roomId,
        this.roomName,
        this.className,
        this.status});

  SceduleMat.fromJson(Map<String, dynamic> json) {
    classDate = json['class_date'];
    index = json['index'];
    classId = json['class_id'];
    roomId = json['room_id'];
    roomName = json['room_name'];
    className = json['class_name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['class_date'] = this.classDate;
    data['index'] = this.index;
    data['class_id'] = this.classId;
    data['room_id'] = this.roomId;
    data['room_name'] = this.roomName;
    data['class_name'] = this.className;
    data['status'] = this.status;
    return data;
  }
}
