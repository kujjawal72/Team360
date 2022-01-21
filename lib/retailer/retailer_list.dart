
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team360/home/viewmodel/home_viewmodel.dart';
import 'package:team360/retailer/components/body.dart';
import 'package:team360/retailer/onboard/onboard_retailer.dart';

class RetailerListScreen extends StatelessWidget {
  const RetailerListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<HomeViewModel>(context,listen: false).getRetailerListBySalesman();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: const Body(),
      floatingActionButton: FloatingActionButton(child: const Icon(Icons.add),onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const OnBoardRetailerScreen()));
      },tooltip: "Onboard Retailer",),
    );
  }
}