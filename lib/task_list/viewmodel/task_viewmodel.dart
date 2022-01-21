

import 'package:fimber/fimber.dart';
import 'package:flutter/cupertino.dart';
import 'package:team360/base/response.dart';
import 'package:team360/home/model/salesman_task_by_date_model.dart';
import 'package:team360/task_list/model/model1.dart';
import 'package:team360/task_list/model/task_repository.dart';
import 'package:team360/util/profile_manager.dart';

class TaskViewModel extends ChangeNotifier{
  final repo = TaskRepository();

  Response _getTaskByDate = Response.loading("");
  Response get getTaskByDate => _getTaskByDate;
  Future<void> getTaskByDateFunc(String date) async{
      try{
        final userId = await ProfileManager.getUserId();
        SalesmanTaskTypeListResponse data = await repo.getTaskByDate(userId, date);
        _getTaskByDate = Response.completed(data);
      }catch(e,stacktrace){
        _getTaskByDate = Response.error(e.toString());
        Fimber.i("",ex: e,stacktrace: stacktrace);
      }
      notifyListeners();
  }

  Response _getTaskByDate2 = Response.loading("");
  Response get getTaskByDate2 => _getTaskByDate2;
  Future<void> getTaskByDateFunc2(String date) async{
    try{
      final userId = await ProfileManager.getUserId();
      SalesmanTaskTypeListResponse data = await repo.getTaskByDate(userId, date);
      _getTaskByDate2 = Response.completed(data);
    }catch(e,stacktrace){
      _getTaskByDate2 = Response.error(e.toString());
      Fimber.i("",ex: e,stacktrace: stacktrace);
    }
    notifyListeners();
  }
}