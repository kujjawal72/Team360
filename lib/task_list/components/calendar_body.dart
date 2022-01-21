import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:team360/base/response.dart';
import 'package:team360/home/model/salesman_dashboard_model.dart';
import 'package:team360/task_list/model/model1.dart';
import 'package:team360/task_list/viewmodel/task_viewmodel.dart';
import 'package:team360/util/my_colors.dart';
import 'package:team360/util/utils.dart';

class CalendarBody extends StatefulWidget {
  const CalendarBody({Key? key}) : super(key: key);

  @override
  State<CalendarBody> createState() => _CalendarBodyState();
}

class _CalendarBodyState extends State<CalendarBody> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    Response response = Provider.of<TaskViewModel>(context).getTaskByDate2;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28), topRight: Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: MyColor.dashboardCardShadowColor,
            blurRadius: 25.0,
            spreadRadius: 0.0,
            offset: Offset(-25.0, -25.0), // shadow direction: bottom right
          )
        ],
      ),
      child: ListView(
        children: [
          TableCalendar(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            headerStyle: const HeaderStyle(
                titleCentered: true, formatButtonVisible: false),
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                // Call `setState()` when updating the selected day
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  Provider.of<TaskViewModel>(context,listen: false).getTaskByDateFunc2(_selectedDay.toString().split(" ")[0]);
                });
              }
            },
            onPageChanged: (focusedDay) {
              // No need to call `setState()` here
              _focusedDay = focusedDay;
            },
          ),
          Container(
              margin: const EdgeInsets.only(top: 5),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 1.0,
                    spreadRadius: 0.0,
                    offset:
                        Offset(-1.0, -1.0), // shadow direction: bottom right
                  )
                ],
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Tasks",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    getListOrProgress(response)
                  ],
                ),
              )),
        ],
        shrinkWrap: true,
      ),
    );
  }

  getListOrProgress(Response<dynamic> response) {
    switch(response.status){

      case Status.INITIAL:
      case Status.LOADING:
        return const Center(child: CircularProgressIndicator(),);
      case Status.COMPLETED:
        final data = (response.data as SalesmanTaskTypeListResponse).responseList;
        return ListView.builder(
          itemBuilder: (_, index) {
            return Container(
              margin: const EdgeInsets.all(5),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      margin: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white),
                      child: Center(
                          child: Text(
                            "${index + 1}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, top: 10.0, bottom: 0),
                          child: Text(
                            data[index].taskType,
                            style: const TextStyle(
                                fontSize: 22, color: Colors.white),
                          ),
                        ),

                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: createSubTaskList(
                              data[index].tasks),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: data.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        );
      case Status.ERROR:
        Fluttertoast.showToast(msg: "Failed to fetch tasks");
        return Container();
    }
  }
}

List<Widget> createSubTaskList(List<Tasks> subTasks) {
  final List<Widget> myWidgets = [];
  for (var element in subTasks) {
    myWidgets.add(Container(
        margin: const EdgeInsets.only(top: 25, left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              element.taskName,
              style: const TextStyle(fontSize: 22, color: Colors.white),
            ),
            Text(
              element.taskTime,
              style: const TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],
        )));
  }
  return myWidgets;
}
