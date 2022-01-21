
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team360/home/viewmodel/home_viewmodel.dart';
import 'package:team360/retailer/components/body.dart';
import 'package:team360/retailer/onboard/onboard_retailer.dart';

class RetailerListScreen extends StatefulWidget {
  const RetailerListScreen({Key? key}) : super(key: key);

  @override
  State<RetailerListScreen> createState() => _RetailerListScreenState();
}

class _RetailerListScreenState extends State<RetailerListScreen> {

  @override
  Widget build(BuildContext context) {
    Fimber.i("building widget");
    Provider.of<HomeViewModel>(context,listen: false).getRetailerListBySalesman();
    return RefreshIndicator(
      onRefresh: () async{
        setState(() {
          Fimber.i("Setting state");
        });
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: const Body(),
        floatingActionButton: FloatingActionButton(child: const Icon(Icons.add,color: Colors.deepPurpleAccent,),elevation: 30,backgroundColor: Colors.amberAccent,onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const OnBoardRetailerScreen()));
        },tooltip: "Onboard Retailer",),
      ),
    );
  }
}