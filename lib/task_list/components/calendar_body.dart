import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:team360/home/model/models.dart';
import 'package:team360/util/my_colors.dart';
import 'package:team360/util/utils.dart';

class CalendarBody extends StatefulWidget {
  CalendarBody({Key? key}) : super(key: key);
  final dummys = TaskList.getDummy();

  @override
  State<CalendarBody> createState() => _CalendarBodyState();
}

class _CalendarBodyState extends State<CalendarBody> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              // Use `selectedDayPredicate` to determine which day is currently selected.
              // If this returns true, then `day` will be marked as selected.

              // Using `isSameDay` is recommended to disregard
              // the time-part of compared DateTime objects.
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                // Call `setState()` when updating the selected day
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            onPageChanged: (focusedDay) {
              // No need to call `setState()` here
              _focusedDay = focusedDay;
            },
          ),
          Container(
              margin: EdgeInsets.only(top: 5),
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
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Upcoming",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    ListView.builder(
                      itemBuilder: (_, index) {
                        return Container(
                          margin: EdgeInsets.all(5),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: Center(
                                      child: Text(
                                    "${index + 1}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  )),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 8.0, bottom: 3),
                                      child: Text(
                                        widget.dummys[index].name,
                                        style: const TextStyle(
                                            fontSize: 22, color: Colors.white),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        widget.dummys[index].time,
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: createSubTaskList(
                                          widget.dummys[index].subTasks),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: widget.dummys.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                    )
                  ],
                ),
              )),
        ],
        shrinkWrap: true,
      ),
    );
  }
}

List<Widget> createSubTaskList(List<SubTaskList> subTasks) {
  final List<Widget> myWidgets = [];
  subTasks.forEach((element) {
    myWidgets.add(Container(
        margin: EdgeInsets.only(top: 25, left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              element.name,
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            Text(
              element.time,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],
        )));
  });
  return myWidgets;
}
/*Align(
                    alignment: Alignment.topLeft,
                    child: Timeline.tileBuilder(
                      shrinkWrap: true,
                      builder: TimelineTileBuilder.fromStyle(
                        contentsAlign: ContentsAlign.basic,
                        indicatorStyle: IndicatorStyle.outlined,
                        connectorStyle: ConnectorStyle.dashedLine,
                        contentsBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Text(
                            'Timeline Event Timeline Event Timeline Event $index',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        itemCount: 50,
                      ),
                      physics: NeverScrollableScrollPhysics(),
                    ),
                  )*/
