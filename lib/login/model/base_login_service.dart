

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:team360/base/base_exception.dart';
import 'package:team360/login/model/models.dart';

abstract class BaseLoginService{
  final String baseUrl = "---";


  final String loginRequestUrl = "/bakes_and_cakes/BakesAndCakes/salesmanlogin";
  final headers = {
    'Content-Type': 'application/json'
  };

  Future<dynamic> doLogin(LoginRequestModel request);

  dynamic returnResponse(http.Response response) async {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}