import 'dart:io';

import 'package:fimber/fimber.dart';
import 'package:http/http.dart' as http;
import 'package:team360/base/base_exception.dart';
import 'package:team360/util/utils.dart';

class HomeService {
  String _salesmanDashboardByUserId(int userId) => baseUrl + "bakes_and_cakes/BakesAndCakes/salesmanDashboard/$userId";

  String _getRetailerList(int userId) => baseUrl + "bakes_and_cakes/BakesAndCakes/retailerListBySalesManId/$userId";

  String _getTaskByDateAndUserId(int userId,String date) => baseUrl + "bakes_and_cakes/BakesAndCakes/Tasktypelistbysalesmanid"+"/$userId"+"/$date";

  Future getSalesmanDashboard(int userId) async {
    dynamic salesDashboardResponse;
    try {
      final response = await http.get(Uri.parse(_salesmanDashboardByUserId(userId)), headers: headers);
      salesDashboardResponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return salesDashboardResponse;
  }

  Future getRetailerList(int userId) async{
      dynamic mResponse;
      try{
        final response = await http.get(Uri.parse(_getRetailerList(userId)),headers: headers);
        mResponse = returnResponse(response);
      } on SocketException{
        throw FetchDataException('No Internet');
      }
      return mResponse;
  }

  Future getSalesmanTaskByDateAndUserId(int userId,String date) async{
      dynamic mResponse;
      try{
        Fimber.i("$date");
        final response = await http.get(Uri.parse(_getTaskByDateAndUserId(userId, date)),headers: headers);
        mResponse = returnResponse(response);
      } on SocketException{
        throw FetchDataException('No Internet');
      }
      return mResponse;
  }
}
