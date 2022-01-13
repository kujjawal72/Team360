import 'package:flutter/material.dart';
import 'package:team360/home/components/backgound.dart';
import 'package:team360/retailer/onboard/components/body.dart';

class OnBoardRetailerScreen extends StatelessWidget {
  const OnBoardRetailerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: const Text("Onboard Retailer"),
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                }),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: const Body()),
    );
  }
}
