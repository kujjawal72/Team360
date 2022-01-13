
import 'package:team360/base/file_upload_response.dart';
import 'package:team360/home/model/home_services.dart';
import 'package:team360/home/model/models.dart';
import 'package:team360/retailer/model/models.dart';

import 'model2.dart';

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
}