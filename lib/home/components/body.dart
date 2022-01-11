

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team360/base/response.dart';
import 'package:team360/home/components/attendance_dialog.dart';
import 'package:team360/home/components/dashboard_card.dart';
import 'package:team360/home/components/home_clock.dart';
import 'package:team360/home/components/task_list_card.dart';
import 'package:team360/home/model/models.dart';
import 'package:team360/home/viewmodel/home_viewmodel.dart';
import 'package:team360/util/profile_manager.dart';

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
    Response homeData = Provider.of<HomeViewModel>(context).salesmanDashboardResponse;
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: FutureBuilder<String>(
            future: ProfileManager.getName(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot){
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Text("Good Afternoon\n\nLogging Time : 10.00AM",textAlign: TextAlign.center,style: TextStyle(fontSize: 18),);
                default:
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Text("Good Afternoon\n${snapshot.data}\nLoging Time : 10.00AM",textAlign: TextAlign.center,style: const TextStyle(fontSize: 18),);
                  }
              }
            },
          ),
        ),
        GestureDetector(child: MyClock(width: size.width*0.2,height: size.height*0.2,),onTap: (){
          AttendanceDialog.show(context);
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
}
