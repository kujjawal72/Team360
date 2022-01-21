import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:team360/home/components/backgound.dart';
import 'package:team360/retailer/onboard/components/doc_body.dart';

import 'model.dart';

class OnBoardRetailerDoc extends StatelessWidget {
  final AddRetailerRequest request;
  const OnBoardRetailerDoc({Key? key, required this.request}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Fimber.i("$request");
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
          body: DocBody(request: request,)),
    );
  }
}
