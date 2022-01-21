class InventoryListResponse {
  InventoryListResponse({
    required this.attributes,
    required this.responseList,
  });
  late final Attributes attributes;
  late final List<ResponseList> responseList;

  InventoryListResponse.fromJson(Map<String, dynamic> json){
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
    required this.inventoryId,
    required this.name,
    required this.phone,
    required this.address,
    required this.lastUpdateId,
    required this.lastUpdateTs,
  });
  late final int inventoryId;
  late final String name;
  late final String phone;
  late final String address;
  late final int lastUpdateId;
  late final String lastUpdateTs;

  ResponseList.fromJson(Map<String, dynamic> json){
    inventoryId = json['inventory_id'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    lastUpdateId = json['last_update_id'];
    lastUpdateTs = json['last_update_ts'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['inventory_id'] = inventoryId;
    _data['name'] = name;
    _data['phone'] = phone;
    _data['address'] = address;
    _data['last_update_id'] = lastUpdateId;
    _data['last_update_ts'] = lastUpdateTs;
    return _data;
  }
}