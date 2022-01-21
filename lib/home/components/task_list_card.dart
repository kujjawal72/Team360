import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team360/base/response.dart';
import 'package:team360/home/components/item_task.dart';
import 'package:team360/home/model/salesman_task_by_date_model.dart';
import 'package:team360/home/model/salesman_dashboard_model.dart';
import 'package:team360/home/viewmodel/home_viewmodel.dart';

import '../../util/my_colors.dart';

class TaskListCard extends StatelessWidget {
  TaskListCard({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Response response = Provider.of<HomeViewModel>(context).salesmanTaskResponse;
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
      child: getWidget(response),
    );
  }

  Widget getWidget(Response<dynamic> response) {
    Fimber.i("${response.status}");
    switch(response.status){

      case Status.INITIAL:
        break;
      case Status.LOADING:
        return const Center(child: CircularProgressIndicator(),);
      case Status.COMPLETED:
        final data = response.data as SalesmanTaskByDateResponse;
        return ListView.builder(itemBuilder: (_,index){
          return ItemTask( data: data.responseList[index],);
        },itemCount: data.responseList.length,scrollDirection: Axis.vertical,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),);
      case Status.ERROR:
        break;
    }
    return const Padding(padding: EdgeInsets.all(5));
  }
}
