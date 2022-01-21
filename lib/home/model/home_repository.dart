
import 'package:team360/base/file_upload_response.dart';
import 'package:team360/home/model/attendance_type_list_model.dart';
import 'package:team360/home/model/home_services.dart';
import 'package:team360/home/model/attendance_response.dart';
import 'package:team360/home/model/mark_attendance_request_model.dart';
import 'package:team360/home/model/salesman_dashboard_model.dart';
import 'package:team360/retailer/model/models.dart';
import 'package:team360/retailer/onboard/model.dart';
import 'package:team360/touchbase/model/touchbase_response.dart';

import 'salesman_task_by_date_model.dart';

class HomeRepository {
  final HomeService _homeService = HomeService();

  Future<SalesmanDashboard> getSalesmanDashboard(int userId) async {
    dynamic response = await _homeService.getSalesmanDashboard(userId);

    return SalesmanDashboard.fromJson(response);
  }

  Future<RetailerListResponse> getRetailerList(int userId) async{
    return RetailerListResponse.fromJson(await _homeService.getRetailerList(userId));
  }

  Future<SalesmanTaskByDateResponse> getSalesmanTaskByDateAndUserId(int userId,String date) async{
    return SalesmanTaskByDateResponse.fromJson(await _homeService.getSalesmanTaskByDateAndUserId(userId, date));
  }

  Future<FileUploadResponse> uploadImageFile(int userId,String filePath) async{
    return FileUploadResponse.fromJson(await _homeService.uploadImage(userId, filePath));
  }

  Future<dynamic> addRetailer(AddRetailerRequest request) async {
    dynamic response = await _homeService.addRetailerService(request);
    return response;
  }

  Future<AttendanceResponse> getAttendance(int userId) async{
    return AttendanceResponse.fromJson(await _homeService.getAttendance(userId));
  }

  Future<AttendanceTypeListResponse> getAttendanceType() async{
    return AttendanceTypeListResponse.fromJson(await _homeService.getAttendanceType());
  }

  Future<MarkAttendanceResponse> markAttendance(MarkAttendanceRequest request) async{
    return MarkAttendanceResponse.fromJson(await _homeService.markAttendance(request));
  }

  Future<TouchBaseResponse> getTouchbaseDetails(int retailerId,int touchbaseId) async{
    return TouchBaseResponse.fromJson(await _homeService.getTouchBaseDetails(retailerId, touchbaseId));
  }
}