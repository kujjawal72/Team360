class NearestRetailerResponse {
  NearestRetailerResponse({
    required this.attributes,
    required this.responseList,
  });
  late final Attributes attributes;
  late final List<ResponseList> responseList;

  NearestRetailerResponse.fromJson(Map<String, dynamic> json){
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
    required this.retailerId,
    required this.name,
    required this.ownerName,
    required this.logo,
    required this.phoneno,
    required this.whatsappNo,
    required this.email,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.comments,
    required this.city,
    required this.state,
    required this.pincode,
    required this.status,
    required this.lastUpdateTs,
  });
  late final int retailerId;
  late final String name;
  late final String ownerName;
  late final String logo;
  late final String phoneno;
  late final String whatsappNo;
  late final String email;
  late final String location;
  late final String latitude;
  late final String longitude;
  late final String comments;
  late final String city;
  late final String state;
  late final String pincode;
  late final int status;
  late final String lastUpdateTs;

  ResponseList.fromJson(Map<String, dynamic> json){
    retailerId = json['retailer_id'];
    name = json['name'];
    ownerName = json['owner_name'];
    logo = json['logo'];
    phoneno = json['phoneno'];
    whatsappNo = json['whatsapp_no'];
    email = json['email'];
    location = json['location'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    comments = json['comments'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
    status = json['status'];
    lastUpdateTs = json['last_update_ts'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['retailer_id'] = retailerId;
    _data['name'] = name;
    _data['owner_name'] = ownerName;
    _data['logo'] = logo;
    _data['phoneno'] = phoneno;
    _data['whatsapp_no'] = whatsappNo;
    _data['email'] = email;
    _data['location'] = location;
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    _data['comments'] = comments;
    _data['city'] = city;
    _data['state'] = state;
    _data['pincode'] = pincode;
    _data['status'] = status;
    _data['last_update_ts'] = lastUpdateTs;
    return _data;
  }
}