
import 'dart:io';
import 'package:fimber/fimber.dart';
import 'package:http/http.dart' as http;
import 'package:team360/base/base_exception.dart';
import 'package:team360/util/utils.dart';

class TaskService{
  String _getTaskByDateUrl(int userId, String date) => "bakes_and_cakes/BakesAndCakes/Tasktypelistbysalesmanid/$userId/$date";//-> 2/2021-12-20

  Future getTaskByDate(int userId,String date) async{
      dynamic mResponse;
      try{
        final url = baseUrl+_getTaskByDateUrl(userId, date);
        Fimber.i("$url");
        final response = await http.get(Uri.parse(url),headers: headers);
        mResponse = returnResponse(response);
      } on SocketException{
        throw FetchDataException('No Internet');
      }
      return mResponse;
  }

}