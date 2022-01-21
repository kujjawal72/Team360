class SalesmanTouchBaseResponse {
  SalesmanTouchBaseResponse({
    required this.attributes,
    required this.responseList,
  });
  late final Attributes attributes;
  late final ResponseList responseList;

  SalesmanTouchBaseResponse.fromJson(Map<String, dynamic> json){
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
    required this.salesmanTouchbaseId,
  });
  late final int salesmanTouchbaseId;

  ResponseList.fromJson(Map<String, dynamic> json){
    salesmanTouchbaseId = json['salesman_touchbase_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['salesman_touchbase_id'] = salesmanTouchbaseId;
    return _data;
  }
}