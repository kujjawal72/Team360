class AttendanceResponse {
  AttendanceResponse({
    required this.attributes,
    required this.responseList,
  });
  late final Attributes attributes;
  late final ResponseList? responseList;

  AttendanceResponse.fromJson(Map<String, dynamic> json){
    attributes = Attributes.fromJson(json['attributes']);
    responseList = ResponseList.fromJson(json['responseList']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['attributes'] = attributes.toJson();
    _data['responseList'] = responseList?.toJson();
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

class ResponseList {
  ResponseList({
    required this.attendanceTypeId,
    required this.attendanceDate,
    required this.attendanceTime,
    required this.attendanceTypeName,
  });
  late final int attendanceTypeId;
  late final String attendanceDate;
  late final String attendanceTime;
  late final String attendanceTypeName;

  ResponseList.fromJson(Map<String, dynamic>? json){
    attendanceTypeId = json?['attendance_type_id'];
    attendanceDate = json?['attendance_date'];
    attendanceTime = json?['attendance_time'];
    attendanceTypeName = json?['attendance_type_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['attendance_type_id'] = attendanceTypeId;
    _data['attendance_date'] = attendanceDate;
    _data['attendance_time'] = attendanceTime;
    _data['attendance_type_name'] = attendanceTypeName;
    return _data;
  }
}