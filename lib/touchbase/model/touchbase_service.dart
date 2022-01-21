
import 'dart:convert';
import 'dart:io';
import 'package:fimber/fimber.dart';
import 'package:http/http.dart' as http;
import 'package:team360/base/base_exception.dart';
import 'package:team360/touchbase/model/sell_product_to_retailer_model.dart';
import 'package:team360/util/utils.dart';

class TouchBaseService{
  String _getInventoryList() => "bakes_and_cakes/BakesAndCakes/InventoryList";

  String _getProductList(int inventoryId) => "bakes_and_cakes/BakesAndCakes/ProductList/$inventoryId";

  String _sellProductToRetailer() => "bakes_and_cakes_admin/BakesAndCakesAdmin/sellProductToRetailer";

  Future getInventoryList() async{
      dynamic mResponse;
      try{
        final url = baseUrl+_getInventoryList();
        final response = await http.get(Uri.parse(url),headers: headers);
        mResponse = returnResponse(response);
      } on SocketException{
        throw FetchDataException('No Internet');
      }
      return mResponse;
  }

  Future getInventoryProductList(int inventoryId) async{
      dynamic mResponse;
      try{
        final url = baseUrl+_getProductList(inventoryId);
        final response = await http.get(Uri.parse(url),headers: headers);
        mResponse = returnResponse(response);
      } on SocketException{
        throw FetchDataException('No Internet');
      }
      return mResponse;
  }

  Future sellProductToRetailer(SellProductToRetailerRequest request) async{
      dynamic mResponse;
      try{
        final json = request.toJson();
        final response = await http.post(Uri.parse(baseUrl+_sellProductToRetailer()),body: jsonEncode(json),headers: headers);
        mResponse = returnResponse(response);
      } on SocketException{
        throw FetchDataException('No Internet');
      }
      return mResponse;
  }

  String _orderHistory(int retId,int userId) => "bakes_and_cakes/BakesAndCakes/salesOrderListByRetailrIdAndSalesManId/$retId/$userId";

  Future getOrderHistory(int retId, int userId) async{
      dynamic mResponse;
      try{
        final url = baseUrl+_orderHistory(retId,userId);
        final response = await http.get(Uri.parse(url),headers: headers);
        mResponse = returnResponse(response);
      } on SocketException{
        throw FetchDataException('No Internet');
      }
      return mResponse;
  }

}