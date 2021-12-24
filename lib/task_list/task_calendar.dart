import 'package:flutter/material.dart';
import 'package:team360/home/components/backgound.dart';
import 'package:team360/task_list/components/calendar_body.dart';

class TaskCalendarScreen extends StatelessWidget {
  const TaskCalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text("My Tasks"),backgroundColor: Colors.transparent,elevation: 0,
          ),
          body: CalendarBody()),
    );
  }
}
