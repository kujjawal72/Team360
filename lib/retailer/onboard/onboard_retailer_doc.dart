import 'package:flutter/material.dart';
import 'package:team360/home/components/backgound.dart';
import 'package:team360/retailer/onboard/components/doc_body.dart';

class OnBoardRetailerDoc extends StatelessWidget {
  const OnBoardRetailerDoc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text("Upload Documents"),
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                }),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: DocBody()),
    );
  }
}
