import 'dart:convert';
import 'dart:io';

import 'package:fimber/fimber.dart';
import 'package:http/http.dart' as http;
import 'package:team360/base/base_exception.dart';
import 'package:team360/home/model/mark_attendance_request_model.dart';
import 'package:team360/retailer/onboard/model.dart';
import 'package:team360/util/utils.dart';

class HomeService {
  String _salesmanDashboardByUserId(int userId) =>
      baseUrl + "bakes_and_cakes/BakesAndCakes/salesmanDashboard/$userId";

  String _getRetailerList(int userId) =>
      baseUrl +
      "bakes_and_cakes/BakesAndCakes/retailerListBySalesManId/$userId";

  String _getTaskByDateAndUserId(int userId, String date) =>
      baseUrl +
      "bakes_and_cakes/BakesAndCakes/Tasktypelistbysalesmanid" +
      "/$userId" +
      "/$date";

  String _uploadImageToS3(int userId) =>
      "http://ec2-18-221-89-14.us-east-2.compute.amazonaws.com/flaskapp/aws_portal_upload/awsResourceUploadController/uploadToS3Bucket/$userId";

  String _addRetailerUrl() => "bakes_and_cakes/BakesAndCakes/addRetailer";

  String _getAttendance(int userId) => "bakes_and_cakes/BakesAndCakes/GetSalesmanAttendence/$userId";

  Future uploadImage(int userId,String filePath) async {
    dynamic mResponse;
    try {
      final req =  http.MultipartRequest('POST',Uri.parse(_uploadImageToS3(userId)));
      final pic = await http.MultipartFile.fromPath("file", filePath);
      req.files.add(pic);
      var res = await req.send();
      mResponse = returnResponse(await http.Response.fromStream(res));
    } on SocketException {
      throw FetchDataException('No Internet');
    }
    return mResponse;
  }

  Future getSalesmanDashboard(int userId) async {
    dynamic salesDashboardResponse;
    try {
      final response = await http
          .get(Uri.parse(_salesmanDashboardByUserId(userId)), headers: headers);
      salesDashboardResponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return salesDashboardResponse;
  }

  Future getRetailerList(int userId) async {
    dynamic mResponse;
    try {
      final response =
          await http.get(Uri.parse(_getRetailerList(userId)), headers: headers);
      mResponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet');
    }
    return mResponse;
  }

  Future getSalesmanTaskByDateAndUserId(int userId, String date) async {
    dynamic mResponse;
    try {
      Fimber.i("$userId $date");
      final response = await http.get(
          Uri.parse(_getTaskByDateAndUserId(userId, date)),
          headers: headers);
      mResponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet');
    }
    return mResponse;
  }

  Future addRetailerService(AddRetailerRequest request) async{
      dynamic mResponse;
      try{
        final json = request.toJson();
        final response = await http.post(Uri.parse(baseUrl+_addRetailerUrl()),body: jsonEncode(json),headers: headers);
        mResponse = returnResponse(response);
      } on SocketException{
        throw FetchDataException('No Internet');
      }
      return mResponse;
  }

  Future getAttendance(int userId) async{
      dynamic mResponse;
      try{
        final response = await http.get(Uri.parse(baseUrl+_getAttendance(userId)),headers: headers);
        mResponse = returnResponse(response);
      } on SocketException{
        throw FetchDataException('No Internet');
      }
      return mResponse;
  }

  String _getAttendanceTypeUrl() => "bakes_and_cakes/BakesAndCakes/GetAttendanceTypes";

  Future getAttendanceType() async{
      dynamic mResponse;
      try{
        final response = await http.get(Uri.parse(baseUrl+_getAttendanceTypeUrl()),headers: headers);
        mResponse = returnResponse(response);
      } on SocketException{
        throw FetchDataException('No Internet');
      }
      return mResponse;
  }

  String _markAttendanceUrl() => "bakes_and_cakes/BakesAndCakes/addsalesmanattendance";

  Future markAttendance(MarkAttendanceRequest request) async{
      dynamic mResponse;
      try{
        final json = request.toJson();
        Fimber.i("$json");
        final response = await http.post(Uri.parse(baseUrl+_markAttendanceUrl()),headers: headers,body: jsonEncode(json));
        mResponse = returnResponse(response);
      } on SocketException{
        throw FetchDataException('No Internet');
      }
      return mResponse;
  }

  String _getTouchbaseDetails(int retailerId, int touchbaseId) => "bakes_and_cakes/BakesAndCakes/retailerDetailsByRetailerId/$retailerId/$touchbaseId";

  Future getTouchBaseDetails(int retailerId, int touchbaseId) async{
      dynamic mResponse;
      try{
        final response = await http.get(Uri.parse(baseUrl+_getTouchbaseDetails(retailerId,touchbaseId)),headers: headers);
        mResponse = returnResponse(response);
      } on SocketException{
        throw FetchDataException('No Internet');
      }
      return mResponse;
  }
}
