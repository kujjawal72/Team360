

import 'package:flutter/material.dart';
import 'package:team360/home/model/models.dart';
import 'package:team360/task_list/components/item_task.dart';
import 'package:team360/util/my_colors.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  final dummys = TaskList.getDummy();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 15),
      padding: const EdgeInsets.only(left: 10,right: 10, bottom: 5, top: 5),
      height: size.height,
      decoration: const BoxDecoration(
        color: Color(0xe6bfb7f0),
        borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
        boxShadow: [
          BoxShadow(
            color: MyColor.dashboardCardShadowColor,
            blurRadius: 10.0,
            spreadRadius: 0.0,
            offset: Offset(15.0, 15.0), // shadow direction: bottom right
          )
        ],
      ),
      child: ListView.builder(itemBuilder: (_,index){
        return ItemTask(data: dummys[index]);
      },itemCount: dummys.length,scrollDirection: Axis.vertical,shrinkWrap: true,),
    );
  }
}
