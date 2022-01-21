

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:team360/base/response.dart';
import 'package:team360/home/components/attendance_dialog.dart';
import 'package:team360/home/components/dashboard_card.dart';
import 'package:team360/home/components/home_clock.dart';
import 'package:team360/home/components/task_list_card.dart';
import 'package:team360/home/model/attendance_response.dart';
import 'package:team360/home/model/attendance_type_list_model.dart';
import 'package:team360/home/model/salesman_dashboard_model.dart';
import 'package:team360/home/viewmodel/home_viewmodel.dart';
import 'package:team360/util/pair.dart';
import 'package:team360/util/utils.dart';
import 'package:http/http.dart' as http;
import 'dashboard_three_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = Provider.of<HomeViewModel>(context);
    Response homeData = provider.salesmanDashboardResponse;
    Response att = provider.getAttendance;
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: checkAttendance(att),
        ),
        GestureDetector(child: MyClock(width: size.width*0.2,height: size.height*0.2,),onTap: (){

        },),
        const Padding(
          padding: EdgeInsets.only(left: 18.0,top: 15),
          child: Text("Run Rate",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
        ),
        getCardWidget(homeData),
        const Padding(
          padding: EdgeInsets.only(left: 18.0,top: 10),
          child: Text("Accounts",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
        ),
        get3CardWidget(homeData),
        const Padding(
          padding: EdgeInsets.only(left: 18.0,top: 20),
          child: Text("Task List",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
        ),
        TaskListCard()
      ],
    );
  }

  Widget getCardWidget(Response<dynamic> homeData) {
    switch(homeData.status){

      case Status.INITIAL:
        break;
      case Status.LOADING:
        return const Center(child: CircularProgressIndicator());
      case Status.COMPLETED:
        final data = homeData.data as SalesmanDashboard;
        return DashboardCard(dailyRunRate: data.responseList.dailyRunRate.toString(), askingRunRate: data.responseList.askingRunRate.toString());
      case Status.ERROR:
        break;
    }
    return const Padding(padding: EdgeInsets.all(5));
  }

  Widget get3CardWidget(Response<dynamic> homeData) {
    switch(homeData.status){

      case Status.INITIAL:
        break;
      case Status.LOADING:
        break;
      case Status.COMPLETED:
        final data = homeData.data as SalesmanDashboard;
        return DashboardCardWithThreeCard(totalAccounts: '${data.responseList.totalAccounts}', activeAccount: '${data.responseList.totalActiveAccounts}',);
      case Status.ERROR:
        break;
    }
    return const Padding(padding: EdgeInsets.all(5));
  }

  checkAttendance(Response<dynamic> response) {
    switch(response.status){
      case Status.ERROR:
        Fluttertoast.showToast(msg: response.message??"");
        return const Text("Welcome",textAlign: TextAlign.center,style: TextStyle(fontSize: 18),);
      case Status.LOADING:
      case Status.INITIAL:
        return const Text("Welcome",textAlign: TextAlign.center,style: TextStyle(fontSize: 18),);
      case Status.COMPLETED:
        final data = (response.data as Pair<String,AttendanceResponse>);
        if(data.second.responseList?.attendanceTypeId == null){
          if(flag == 1){
            flag = 2;
            callDialog();
          }
        }
        return Text("Welcome ${data.first}\nLogging Time: ${data.second.responseList?.attendanceDate??""} ${data.second.responseList?.attendanceTime??""}",textAlign: TextAlign.center,style: const TextStyle(fontSize: 18),);
    }
  }
  int flag = 1;
  Future<void> callDialog() async{
    Fimber.i("test2");
    try{
      final res = await returnResponse(await http.get(Uri.parse(baseUrl+"bakes_and_cakes/BakesAndCakes/GetAttendanceTypes"),headers: headers));
      final data = AttendanceTypeListResponse.fromJson(res);
      await AttendanceDialog.show(context,data.responseList);
    }catch(e){
      Fimber.i("$e");
    }
  }
}
