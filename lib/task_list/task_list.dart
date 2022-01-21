import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team360/task_list/components/body.dart';
import 'package:team360/task_list/viewmodel/task_viewmodel.dart';
import 'package:team360/util/utils.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {

  @override
  Widget build(BuildContext context) {
    Provider.of<TaskViewModel>(context,listen: false).getTaskByDateFunc(todayDate());
    return const Body();
  }
}
