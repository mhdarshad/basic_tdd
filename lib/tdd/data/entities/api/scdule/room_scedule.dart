class RoomSceduels {
  List<RoomDetails>? roomDetails;
  List<RoomSpotDetails>? roomSpotDetails;

  RoomSceduels({this.roomDetails, this.roomSpotDetails});

  RoomSceduels.fromJson(Map<String, dynamic> json) {
    if (json['room_details'] != null) {
      roomDetails = <RoomDetails>[];
      json['room_details'].forEach((v) {
        roomDetails!.add(RoomDetails.fromJson(v));
      });
    }
    if (json['room_spot_details'] != null) {
      roomSpotDetails = <RoomSpotDetails>[];
      json['room_spot_details'].forEach((v) {
        roomSpotDetails!.add(RoomSpotDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.roomDetails != null) {
      data['room_details'] = this.roomDetails!.map((v) => v.toJson()).toList();
    }
    if (this.roomSpotDetails != null) {
      data['room_spot_details'] =
          this.roomSpotDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RoomDetails {
  int? sno;
  String? floorNo;
  String? rowNo;
  String? columnNo;
  int? locationId;
  String? layout;
  String? matCount;

  RoomDetails(
      {this.sno,
        this.floorNo,
        this.rowNo,
        this.columnNo,
        this.locationId,
        this.layout,
        this.matCount});

  RoomDetails.fromJson(Map<String, dynamic> json) {
    sno = json['Sno'];
    floorNo = json['Floor_No'];
    rowNo = json['Row_No'];
    columnNo = json['Column_No'];
    locationId = json['location_id'];
    layout = json['layout'];
    matCount = json['Mat_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Sno'] = this.sno;
    data['Floor_No'] = this.floorNo;
    data['Row_No'] = this.rowNo;
    data['Column_No'] = this.columnNo;
    data['location_id'] = this.locationId;
    data['layout'] = this.layout;
    data['Mat_count'] = this.matCount;
    return data;
  }
}

class RoomSpotDetails {
  int? id;
  String? roomSno;
  String? index;
  String? top;
  String? left;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? matStatus;
  String? bookingCusId;
  String? custName;

  RoomSpotDetails(
      {this.id,
        this.roomSno,
        this.index,
        this.top,
        this.left,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.matStatus,
        this.bookingCusId,
        this.custName});

  RoomSpotDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomSno = json['room_sno'];
    index = json['index'];
    top = json['top'];
    left = json['left'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    matStatus = json['mat_status'];
    bookingCusId = json['booking_cus_id'];
    custName = json['cust_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['room_sno'] = this.roomSno;
    data['index'] = this.index;
    data['top'] = this.top;
    data['left'] = this.left;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['mat_status'] = this.matStatus;
    data['booking_cus_id'] = this.bookingCusId;
    data['cust_name'] = this.custName;
    return data;
  }
}

