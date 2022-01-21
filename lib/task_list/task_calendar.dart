import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team360/home/components/backgound.dart';
import 'package:team360/task_list/components/calendar_body.dart';
import 'package:team360/task_list/viewmodel/task_viewmodel.dart';
import 'package:team360/util/utils.dart';

class TaskCalendarScreen extends StatelessWidget {
  const TaskCalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<TaskViewModel>(context,listen: false).getTaskByDateFunc2(todayDate());
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text("My Tasks"),backgroundColor: Colors.transparent,elevation: 0,
          ),
          body: const CalendarBody()),
    );
  }
}
