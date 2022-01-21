class MarkAttendanceRequest {
  MarkAttendanceRequest({
    required this.attendanceTypeId,
    required this.salesmanId,
    required this.attendanceDate,
    required this.attendanceTime,
    required this.lastUpdateId,
  });
  late final int attendanceTypeId;
  int salesmanId = 0;
  late final String attendanceDate;
  late final String attendanceTime;
  int lastUpdateId = 0;

  MarkAttendanceRequest.fromJson(Map<String, dynamic> json){
    attendanceTypeId = json['attendance_type_id'];
    salesmanId = json['salesman_id'];
    attendanceDate = json['attendance_date'];
    attendanceTime = json['attendance_time'];
    lastUpdateId = json['last_update_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['attendance_type_id'] = attendanceTypeId;
    _data['salesman_id'] = salesmanId;
    _data['attendance_date'] = attendanceDate;
    _data['attendance_time'] = attendanceTime;
    _data['last_update_id'] = lastUpdateId;
    return _data;
  }
}

class MarkAttendanceResponse {
  MarkAttendanceResponse({
    required this.attributes
  });
  late final Attributes attributes;

  MarkAttendanceResponse.fromJson(Map<String, dynamic> json){
    attributes = Attributes.fromJson(json['attributes']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['attributes'] = attributes.toJson();
    return _data;
  }
}

class Attributes {
  Attributes({
    required this.statusDesc,
    required this.status,
  });
  late final String statusDesc;
  late final String status;

  Attributes.fromJson(Map<String, dynamic> json){
    statusDesc = json['status_desc'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status_desc'] = statusDesc;
    _data['status'] = status;
    return _data;
  }
}