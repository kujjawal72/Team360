

import 'dart:convert';

import 'package:team360/base/base_exception.dart';

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 12, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 12, kToday.day);
typedef String2VoidCallback = void Function(String,String);

const String baseUrl = "---XXXXXXX___--";
const headers = {
  'Content-Type': 'application/json'
};

dynamic returnResponse(response) async {
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