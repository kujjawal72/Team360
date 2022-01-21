
import 'package:fimber/fimber.dart';
import 'package:flutter/cupertino.dart';
import 'package:team360/base/response.dart';
import 'package:team360/touchbase/model/inventory_list_response_model.dart';
import 'package:team360/touchbase/model/inventory_product_list_response.dart';
import 'package:team360/touchbase/model/order_history_response.dart';
import 'package:team360/touchbase/model/sell_product_to_retailer_model.dart';
import 'package:team360/touchbase/model/touchbase_repository.dart';
import 'package:team360/util/profile_manager.dart';

class TouchBaseViewModel extends ChangeNotifier{
  final repo = TouchBaseRepository();


  Response _getInventoryList = Response.loading("");
  Response get getInventoryList => _getInventoryList;
  Future<void> getInventoryListFunc() async{
      try{
        final userId = await ProfileManager.getUserId();
        InventoryListResponse data = await repo.getInventoryList();
        _getInventoryList = Response.completed(data);
      }catch(e,stacktrace){
        _getInventoryList = Response.error(e.toString());
        Fimber.i("",ex: e,stacktrace: stacktrace);
      }
      notifyListeners();
  }

  Response _getInventoryProductList = Response.loading("");
  Response get getInventoryProductList => _getInventoryProductList;
  Future<void> getInventoryProductListFunc(int inventoryId) async{
      try{
        final userId = await ProfileManager.getUserId();
        InventoryProductListResponse data = await repo.getInventoryProductList(inventoryId);
        _getInventoryProductList = Response.completed(data);
      }catch(e,stacktrace){
        _getInventoryProductList = Response.error(e.toString());
        Fimber.i("",ex: e,stacktrace: stacktrace);
      }
      notifyListeners();
  }

  Response _sellProductToRetailer = Response.loading("");
  Response get sellProductToRetailer => _sellProductToRetailer;
  Future<void> sellProductToRetailerFunc(SellProductToRetailerRequest request) async{
      try{
        final userId = await ProfileManager.getUserId();
        request.salesmanId = userId;
        SellProductToRetailerRequest data = await repo.sellProductToRetailer(request);
        _sellProductToRetailer = Response.completed(data);
      }catch(e,stacktrace){
        _sellProductToRetailer = Response.error(e.toString());
        Fimber.i("",ex: e,stacktrace: stacktrace);
      }
      notifyListeners();
  }

  Response _getOrderList = Response.loading("");
  Response get getOrderList => _getOrderList;
  Future<void> getOrderListFunc(int retId) async{
      try{
        Fimber.i("66629687563765");
        final userId = await ProfileManager.getUserId();
        OrderHistoryResponse data = await repo.getOrderHistory(retId, userId);
        _getOrderList = Response.completed(data);
      }catch(e,stacktrace){
        _getOrderList = Response.error(e.toString());
        Fimber.i("",ex: e,stacktrace: stacktrace);
      }
      notifyListeners();
  }
}