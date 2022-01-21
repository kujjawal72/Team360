import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:team360/base/response.dart';
import 'package:team360/task_list/components/item_task.dart';
import 'package:team360/task_list/model/model1.dart';
import 'package:team360/task_list/viewmodel/task_viewmodel.dart';
import 'package:team360/util/my_colors.dart';
import 'package:team360/util/utils.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Response listResponse = Provider.of<TaskViewModel>(context).getTaskByDate;
    return Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 15),
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
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
        child: _getListOrProgress(listResponse));
  }

  _getListOrProgress(Response<dynamic>? listResponse) {
    switch (listResponse?.status) {
      case Status.INITIAL:
      case Status.LOADING:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case Status.COMPLETED:
        final data =
            (listResponse!.data as SalesmanTaskTypeListResponse).responseList;
        return ListView.builder(
          itemBuilder: (_, index) {
            return ItemTask(data: data[index]);
          },
          itemCount: data.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
        );
      case null:
      case Status.ERROR:
        Fluttertoast.showToast(msg: "Failed to fetch your task list");
        return Container();
    }
  }
}
