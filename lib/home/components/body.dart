

import 'package:flutter/material.dart';
import 'package:team360/home/components/attendance_dialog.dart';
import 'package:team360/home/components/dashboard_card.dart';
import 'package:team360/home/components/home_clock.dart';
import 'package:team360/home/components/task_list_card.dart';

import 'dashboard_three_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 15.0),
          child: Text("Good Afternoon\nMr. Ujjawal Dubey\nLoging Time : 10.00AM",textAlign: TextAlign.center,style: TextStyle(fontSize: 18),),
        ),
        GestureDetector(child: MyClock(width: size.width*0.2,height: size.height*0.2,),onTap: (){
          AttendanceDialog.show(context);
        },),
        const Padding(
          padding: EdgeInsets.only(left: 18.0,top: 15),
          child: Text("Run Rate",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
        ),
        const DashboardCard(),
        const Padding(
          padding: EdgeInsets.only(left: 18.0,top: 10),
          child: Text("Accounts",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
        ),
        const DashboardCardWithThreeCard(),
        const Padding(
          padding: EdgeInsets.only(left: 18.0,top: 20),
          child: Text("Task List",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
        ),
        TaskListCard()
      ],
    );
  }
}
