class LoginRequestModel {
  LoginRequestModel({
    required this.phoneno,
    required this.password,
  });

  late final String phoneno;
  late final String password;

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    phoneno = json['phoneno'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['phoneno'] = phoneno;
    _data['password'] = password;
    return _data;
  }
}

class LoginResponse {
  LoginResponse({
    required this.attributes,
    required this.responseList,
  });

  late final Attributes attributes;
  late final ResponseList responseList;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    attributes = Attributes.fromJson(json['attributes']);
    responseList = ResponseList.fromJson(json['responseList']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['attributes'] = attributes.toJson();
    _data['responseList'] = responseList.toJson();
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

  Attributes.fromJson(Map<String, dynamic> json) {
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
    required this.userId,
    required this.name,
    required this.phoneno,
    required this.secondaryNumber,
    required this.role,
    required this.adminId,
    required this.lastUpdateId,
  });

  late final int userId;
  late final String name;
  late final String phoneno;
  late final String secondaryNumber;
  late final int role;
  late final int adminId;
  late final int lastUpdateId;

  ResponseList.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    phoneno = json['phoneno'];
    secondaryNumber = json['secondary_number'];
    role = json['role'];
    adminId = json['admin_id'];
    lastUpdateId = json['last_update_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    _data['name'] = name;
    _data['phoneno'] = phoneno;
    _data['secondary_number'] = secondaryNumber;
    _data['role'] = role;
    _data['admin_id'] = adminId;
    _data['last_update_id'] = lastUpdateId;
    return _data;
  }
}
