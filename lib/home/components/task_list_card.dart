import 'package:flutter/material.dart';
import 'package:team360/home/components/item_task.dart';
import 'package:team360/home/model/models.dart';

import '../../util/my_colors.dart';

class TaskListCard extends StatelessWidget {
  TaskListCard({Key? key}) : super(key: key);
  final List<TaskList> dummys = TaskList.getDummy();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 30),
      padding: const EdgeInsets.only(left: 25,right: 25, bottom: 50, top: 10),
      width: size.width * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
        boxShadow: [
          BoxShadow(
            color: MyColor.dashboardCardShadowColor,
            blurRadius: 10.0,
            spreadRadius: 0.0,
            offset: Offset(10.0, 10.0), // shadow direction: bottom right
          )
        ],
      ),
      child: ListView.builder(itemBuilder: (_,index){
        return ItemTask( data: dummys[index],);
      },itemCount: dummys.length,scrollDirection: Axis.vertical,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),),
    );
  }
}
