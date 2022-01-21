class OrderHistoryResponse {
  OrderHistoryResponse({
    required this.attributes,
    required this.responseList,
  });
  late final Attributes attributes;
  late final List<ResponseList> responseList;

  OrderHistoryResponse.fromJson(Map<String, dynamic> json){
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
    required this.salesOrderId,
    required this.retailerId,
    required this.salesManId,
    required this.salesAmount,
    required this.isPayment,
    required this.isFullfilled,
    required this.orderDate,
    required this.lastUpdateId,
    required this.lastUpdateTs,
    required this.orderProduct,
  });
  late final int salesOrderId;
  late final int retailerId;
  late final int salesManId;
  late final int salesAmount;
  late final int isPayment;
  late final int isFullfilled;
  late final String orderDate;
  late final int lastUpdateId;
  late final String lastUpdateTs;
  late final List<OrderProduct> orderProduct;

  ResponseList.fromJson(Map<String, dynamic> json){
    salesOrderId = json['sales_order_id'];
    retailerId = json['retailer_id'];
    salesManId = json['sales_man_id'];
    salesAmount = json['sales_amount'];
    isPayment = json['is_payment'];
    isFullfilled = json['is_fullfilled'];
    orderDate = json['order_date'];
    lastUpdateId = json['last_update_id'];
    lastUpdateTs = json['last_update_ts'];
    orderProduct = List.from(json['order_product']).map((e)=>OrderProduct.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sales_order_id'] = salesOrderId;
    _data['retailer_id'] = retailerId;
    _data['sales_man_id'] = salesManId;
    _data['sales_amount'] = salesAmount;
    _data['is_payment'] = isPayment;
    _data['is_fullfilled'] = isFullfilled;
    _data['order_date'] = orderDate;
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
    required this.inPrice,
    required this.outPrice,
    required this.qty,
  });
  late final int productId;
  late final String productName;
  late final double inPrice;
  late final double outPrice;
  late final int qty;

  OrderProduct.fromJson(Map<String, dynamic> json){
    productId = json['product_id'];
    productName = json['product_name'];
    inPrice = json['in_price'];
    outPrice = json['out_price'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product_id'] = productId;
    _data['product_name'] = productName;
    _data['in_price'] = inPrice;
    _data['out_price'] = outPrice;
    _data['qty'] = qty;
    return _data;
  }
}