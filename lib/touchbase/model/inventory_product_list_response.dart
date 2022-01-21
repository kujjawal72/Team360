class InventoryProductListResponse {
  InventoryProductListResponse({
    required this.attributes,
    required this.responseList,
  });
  late final Attributes attributes;
  late final List<ResponseList> responseList;

  InventoryProductListResponse.fromJson(Map<String, dynamic> json){
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
    required this.productId,
    required this.productName,
    required this.productTypeId,
    required this.inPrice,
    required this.outPrice,
    required this.lastUpdateId,
    required this.lastUpdateTs,
    required this.qty,
  });
  late final int productId;
  late final String productName;
  late final int productTypeId;
  late final double inPrice;
  late final double outPrice;
  late final int lastUpdateId;
  late final String lastUpdateTs;
  late final int qty;
  int buyingQty = 1;

  ResponseList.fromJson(Map<String, dynamic> json){
    productId = json['product_id'];
    productName = json['product_name'];
    productTypeId = json['product_type_id'];
    inPrice = json['in_price'];
    outPrice = json['out_price'];
    lastUpdateId = json['last_update_id'];
    lastUpdateTs = json['last_update_ts'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product_id'] = productId;
    _data['product_name'] = productName;
    _data['product_type_id'] = productTypeId;
    _data['in_price'] = inPrice;
    _data['out_price'] = outPrice;
    _data['last_update_id'] = lastUpdateId;
    _data['last_update_ts'] = lastUpdateTs;
    _data['qty'] = qty;
    return _data;
  }
}