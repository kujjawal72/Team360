class SellProductToRetailerRequest {
  SellProductToRetailerRequest({
    required this.retailerId,
    required this.salesAmount,
    required this.products,
    required this.salesmanId,
  });
  late final int retailerId;
  String salesAmount = "0.0";
  late final List<Products> products;
  int salesmanId = 0;

  SellProductToRetailerRequest.fromJson(Map<String, dynamic> json){
    retailerId = json['retailer_id'];
    salesAmount = json['sales_amount'];
    products = List.from(json['products']).map((e)=>Products.fromJson(e)).toList();
    salesmanId = json['salesman_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['retailer_id'] = retailerId;
    _data['sales_amount'] = salesAmount;
    _data['products'] = products.map((e)=>e.toJson()).toList();
    _data['salesman_id'] = salesmanId;
    return _data;
  }
}

class Products {
  Products({
    required this.productId,
    required this.qty,
  });
  late final int productId;
  late final int qty;

  Products.fromJson(Map<String, dynamic> json){
    productId = json['product_id'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product_id'] = productId;
    _data['qty'] = qty;
    return _data;
  }
}