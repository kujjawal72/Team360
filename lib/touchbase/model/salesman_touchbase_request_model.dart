class SalesmanTouchBaseRequest {
  SalesmanTouchBaseRequest({
    required this.salesmanId,
    required this.latitude,
    required this.longitude,
    required this.lastUpdateId,
    required this.salesmanSelfyImage,
    required this.startTime,
    required this.retailerId,
  });
  late final int salesmanId;
  late final String latitude;
  late final String longitude;
  late final int lastUpdateId;
  late final String salesmanSelfyImage;
  late final String startTime;
  late final int retailerId;

  SalesmanTouchBaseRequest.fromJson(Map<String, dynamic> json){
    salesmanId = json['salesman_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    lastUpdateId = json['last_update_id'];
    salesmanSelfyImage = json['salesman_selfy_image'];
    startTime = json['start_time'];
    retailerId = json['retailer_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['salesman_id'] = salesmanId;
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    _data['last_update_id'] = lastUpdateId;
    _data['salesman_selfy_image'] = salesmanSelfyImage;
    _data['start_time'] = startTime;
    _data['retailer_id'] = retailerId;
    return _data;
  }
}