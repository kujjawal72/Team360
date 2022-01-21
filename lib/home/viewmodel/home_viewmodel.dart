import 'package:fimber/fimber.dart';
import 'package:flutter/cupertino.dart';
import 'package:team360/base/response.dart';
import 'package:team360/home/model/attendance_type_list_model.dart';
import 'package:team360/home/model/home_repository.dart';
import 'package:team360/home/model/mark_attendance_request_model.dart';
import 'package:team360/home/model/salesman_task_by_date_model.dart';
import 'package:team360/home/model/attendance_response.dart';
import 'package:team360/home/model/salesman_dashboard_model.dart';
import 'package:team360/retailer/model/models.dart';
import 'package:team360/retailer/onboard/model.dart';
import 'package:team360/touchbase/model/touchbase_response.dart';
import 'package:team360/util/pair.dart';
import 'package:team360/util/profile_manager.dart';

class HomeViewModel extends ChangeNotifier {
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
    } catch (e, stacktrace) {
      _salesmanDashboardResponse = Response.error(e.toString());
      Fimber.i("Failed to get data", ex: e, stacktrace: stacktrace);
    }
    notifyListeners();
  }

  Future<void> getRetailerListBySalesman() async {
    try {
      final userId = await ProfileManager.getUserId();
      RetailerListResponse data = await repo.getRetailerList(userId);
      _getRetailerListResponse = Response.completed(data);
    } catch (e, stacktrace) {
      _getRetailerListResponse = Response.error(e.toString());
      Fimber.i("", ex: e, stacktrace: stacktrace);
    }
    notifyListeners();
  }

  Future<void> getSalesmanTaskByDate(String date) async {
    try {
      final userId = await ProfileManager.getUserId();
      SalesmanTaskByDateResponse data =
          await repo.getSalesmanTaskByDateAndUserId(userId, date);
      _salesmanTaskResponse = Response.completed(data);
    } catch (e, stacktrace) {
      _salesmanTaskResponse = Response.error(e.toString());
      Fimber.i("", ex: e, stacktrace: stacktrace);
    }
    notifyListeners();
  }

  Response _uploadImageResponse = Response.initial("");

  Response get uploadImageResponse => _uploadImageResponse;

  Future<void> uploadImageFile(String filePath) async {
    _uploadImageResponse = Response.loading("");
    notifyListeners();
    Fimber.i(filePath);
    try {
      final userId = await ProfileManager.getUserId();
      final data = await repo.uploadImageFile(userId, filePath);
      _uploadImageResponse = Response.completed(data);
    } catch (e, stacktrace) {
      _uploadImageResponse = Response.error(e.toString());
      Fimber.i("", ex: e, stacktrace: stacktrace);
    }
    notifyListeners();
  }

  Response _addReatilerResponse = Response.initial("");
  Response get addReatilerResponse => _addReatilerResponse;
  Future<void> addReatilerResponseFunc(AddRetailerRequest request,DocumetType documetType) async{
      try{
        final userId = await ProfileManager.getUserId();
        request.salesmanId = userId;
        final uploadedFile = await repo.uploadImageFile(userId, documetType.documentLink);
        documetType.documentLink = uploadedFile.responseList[0].FilePath;
        request.documetType = [documetType];

        dynamic data = await repo.addRetailer(request);
        _addReatilerResponse = Response.completed(data);
      }catch(e,stacktrace){
        _addReatilerResponse = Response.error(e.toString());
        Fimber.i("",ex: e,stacktrace: stacktrace);
      }
      notifyListeners();
  }

  Response _getAttendance = Response.loading("");
  Response get getAttendance => _getAttendance;
  Future<void> getAttendanceFunc() async{
      try{
        final userId = await ProfileManager.getUserId();
        final name = await ProfileManager.getName();
        AttendanceResponse data = await repo.getAttendance(userId);
        _getAttendance = Response.completed(Pair(name,data));
      }catch(e,stacktrace){
        _getAttendance = Response.error(e.toString());
        Fimber.i("",ex: e,stacktrace: stacktrace);
      }
      notifyListeners();
  }

  Response _getAttendanceTypeList = Response.loading("");
  Response get getAttendanceTypeList => _getAttendanceTypeList;
  Future<void> getAttendanceTypeListFunc() async{
      try{
        AttendanceTypeListResponse data = await repo.getAttendanceType();
        _getAttendanceTypeList = Response.completed(data);
      }catch(e,stacktrace){
        _getAttendanceTypeList = Response.error(e.toString());
        Fimber.i("",ex: e,stacktrace: stacktrace);
      }
      notifyListeners();
  }

  Future<void> markAttendanceFunc(MarkAttendanceRequest request) async{
      try{
        final userId = await ProfileManager.getUserId();
        request.salesmanId = userId;
        request.lastUpdateId = userId;
        MarkAttendanceResponse data = await repo.markAttendance(request);
        getAttendanceFunc();
      }catch(e,stacktrace){
        _getAttendance = Response.error("Failed to mark attendance");
        Fimber.i("",ex: e,stacktrace: stacktrace);
      }
      notifyListeners();
  }

  Response _getTouchbaseDetails = Response.loading("");
  Response get getTouchbaseDetails => _getTouchbaseDetails;
  Future<void> getTouchbaseDetailsFunc(int retailerId,int touchbaseId) async{
      try{
        final userId = await ProfileManager.getUserId();
        TouchBaseResponse data = await repo.getTouchbaseDetails(retailerId, touchbaseId);
        Fimber.i("jjhvgssuyv");
        _getTouchbaseDetails = Response.completed(data);
      }catch(e,stacktrace){
        _getTouchbaseDetails = Response.error(e.toString());
        Fimber.i("",ex: e,stacktrace: stacktrace);
      }
      notifyListeners();
  }

}
