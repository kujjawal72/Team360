

import 'package:fimber/fimber.dart';
import 'package:team360/home/model/salesman_task_by_date_model.dart';
import 'package:team360/task_list/model/model1.dart';
import 'package:team360/task_list/model/task_services.dart';

class TaskRepository{
  final _taskService = TaskService();

  Future<SalesmanTaskTypeListResponse> getTaskByDate(int userId,String date) async{
    Fimber.i("$userId -- $date");
    return SalesmanTaskTypeListResponse.fromJson(await _taskService.getTaskByDate(userId, date));
  }

}