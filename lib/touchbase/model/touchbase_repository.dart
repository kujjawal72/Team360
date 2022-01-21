

import 'package:fimber/fimber.dart';
import 'package:team360/touchbase/model/inventory_list_response_model.dart';
import 'package:team360/touchbase/model/inventory_product_list_response.dart';
import 'package:team360/touchbase/model/order_history_response.dart';
import 'package:team360/touchbase/model/sell_product_to_retailer_model.dart';
import 'package:team360/touchbase/model/touchbase_service.dart';

class TouchBaseRepository{
  final _touchBaseService = TouchBaseService();

  Future<InventoryListResponse> getInventoryList() async{
    return InventoryListResponse.fromJson(await _touchBaseService.getInventoryList());
  }

  Future<InventoryProductListResponse> getInventoryProductList(int inventoryId) async{
    return InventoryProductListResponse.fromJson(await _touchBaseService.getInventoryProductList(inventoryId));
  }

  Future<dynamic> sellProductToRetailer(SellProductToRetailerRequest request) async{
    return await _touchBaseService.sellProductToRetailer(request);
  }
  Future<OrderHistoryResponse> getOrderHistory(int retId, int userId) async{
    return OrderHistoryResponse.fromJson(await _touchBaseService.getOrderHistory(retId,userId));
  }

}