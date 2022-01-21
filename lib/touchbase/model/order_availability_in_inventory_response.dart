class OrderAvailabilityInInventoryResponse {
  OrderAvailabilityInInventoryResponse({
    required this.attributes,
    required this.responseList,
  });
  late final Attributes attributes;
  late final List<ResponseList> responseList;

  OrderAvailabilityInInventoryResponse.fromJson(Map<String, dynamic> json){
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
    required this.orderProduct,
  });
  late final int inventoryId;
  late final String name;
  late final String phone;
  late final String address;
  late final int lastUpdateId;
  late final String lastUpdateTs;
  late final List<OrderProduct> orderProduct;
  String lessProduct = "";



  ResponseList.fromJson(Map<String, dynamic> json){
    inventoryId = json['inventory_id'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    lastUpdateId = json['last_update_id'];
    lastUpdateTs = json['last_update_ts'];
    orderProduct = List.from(json['order_product']).map((e)=>OrderProduct.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['inventory_id'] = inventoryId;
    _data['name'] = name;
    _data['phone'] = phone;
    _data['address'] = address;
    _data['last_update_id'] = lastUpdateId;
    _data['last_update_ts'] = lastUpdateTs;
    _data['order_product'] = orderProduct.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class OrderProduct {
  OrderProduct({
    required this.productId,
    required this.productName,
    required this.qty,
    required this.availableQty,
  });
  late final int productId;
  late final String productName;
  late final int qty;
  late final int availableQty;

  OrderProduct.fromJson(Map<String, dynamic> json){
    productId = json['product_id'];
    productName = json['product_name'];
    qty = json['qty'];
    availableQty = json['available_qty'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product_id'] = productId;
    _data['product_name'] = productName;
    _data['qty'] = qty;
    _data['available_qty'] = availableQty;
    return _data;
  }
}