
import 'package:flutter/material.dart';
import 'package:team360/retailer/components/body.dart';
import 'package:team360/retailer/onboard/onboard_retailer.dart';

class RetailerListScreen extends StatelessWidget {
  const RetailerListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Body(),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => OnBoardRetailerScreen()));
      },tooltip: "Onboard Retailer",),
    );
  }
}