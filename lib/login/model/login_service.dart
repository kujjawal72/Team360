

import 'dart:convert';
import 'dart:io';

import 'package:fimber/fimber.dart';
import 'package:team360/base/base_exception.dart';
import 'package:http/http.dart' as http;
import 'package:team360/login/model/models.dart';
import 'package:team360/util/utils.dart';

class LoginService{
  final String loginRequestUrl = "bakes_and_cakes/BakesAndCakes/salesmanlogin";

  Future doLogin(LoginRequestModel request) async {
    dynamic loginResponse;
    try{
      final json = request.toJson();
      final response = await http.post(Uri.parse(baseUrl+loginRequestUrl),body: jsonEncode(json),headers: headers);
      loginResponse = returnResponse(response);
    }on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return loginResponse;
  }

}