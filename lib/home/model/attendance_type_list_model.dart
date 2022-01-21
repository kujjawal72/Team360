class AttendanceTypeListResponse {
  AttendanceTypeListResponse({
    required this.attributes,
    required this.responseList,
  });
  late final Attributes attributes;
  late final List<ResponseList> responseList;

  AttendanceTypeListResponse.fromJson(Map<String, dynamic> json){
    attributes = Attributes.fromJson(json['attributes']);
    responseList = List.from(json['responseList']).map((e)=>ResponseList.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['attributes'] = attributes.toJson();
    _data['responseList'] = responseList.map((e)=>e.toJson()).toList();
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
    required this.attendanceTypeName,
    required this.lastUpdateId,
    required this.lastUpdateTs,
  });
  late final int attendanceTypeId;
  late final String attendanceTypeName;
  late final int lastUpdateId;
  late final String lastUpdateTs;

  ResponseList.fromJson(Map<String, dynamic> json){
    attendanceTypeId = json['attendance_type_id'];
    attendanceTypeName = json['attendance_type_name'];
    lastUpdateId = json['last_update_id'];
    lastUpdateTs = json['last_update_ts'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['attendance_type_id'] = attendanceTypeId;
    _data['attendance_type_name'] = attendanceTypeName;
    _data['last_update_id'] = lastUpdateId;
    _data['last_update_ts'] = lastUpdateTs;
    return _data;
  }
}