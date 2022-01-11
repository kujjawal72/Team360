

import 'package:fimber/fimber.dart';
import 'package:flutter/cupertino.dart';
import 'package:team360/base/response.dart';
import 'package:team360/home/model/home_repository.dart';
import 'package:team360/home/model/model2.dart';
import 'package:team360/home/model/models.dart';
import 'package:team360/retailer/model/models.dart';
import 'package:team360/util/profile_manager.dart';

class HomeViewModel extends ChangeNotifier{
  Response _salesmanDashboardResponse = Response.loading("");
  Response get salesmanDashboardResponse => _salesmanDashboardResponse;

  Response _getRetailerListResponse = Response.loading("");
  Response get getRetailerListResponse => _getRetailerListResponse;

  Response _salesmanTaskResponse = Response.loading("");
  Response get salesmanTaskResponse => _salesmanTaskResponse;

  final repo = HomeRepository();

  Future<void> getSalesmanDashboard() async {
    try {
      final userId = await ProfileManager.getUserId();
      SalesmanDashboard response = await repo.getSalesmanDashboard(userId);
      _salesmanDashboardResponse = Response.completed(response);
    } catch (e,stacktrace) {
      _salesmanDashboardResponse = Response.error(e.toString());
      Fimber.i("Failed to get data",ex: e,stacktrace: stacktrace);
    }
    notifyListeners();
  }

  Future<void> getRetailerListBySalesman() async{
    try{
      final userId = await ProfileManager.getUserId();
      RetailerListResponse data = await repo.getRetailerList(userId);
      _getRetailerListResponse = Response.completed(data);
    }catch(e,stacktrace){
      _getRetailerListResponse = Response.error(e.toString());
      Fimber.i("",ex: e,stacktrace: stacktrace);
    }
    notifyListeners();
  }

  Future<void> getSalesmanTaskByDate(String date) async{
      try{
        final userId = await ProfileManager.getUserId();
        SalesmanTaskByDateResponse data = await repo.getSalesmanTaskByDateAndUserId(userId, "2021-12-21");
        _salesmanTaskResponse = Response.completed(data);
      }catch(e,stacktrace){
        _salesmanTaskResponse = Response.error(e.toString());
        Fimber.i("",ex: e,stacktrace: stacktrace);
      }
      notifyListeners();
  }
}