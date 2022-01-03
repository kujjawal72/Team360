import 'package:flutter/material.dart';
import 'package:team360/home/components/backgound.dart';

import 'details_components/touchbase_details_body.dart';

class TouchbaseDetails extends StatelessWidget {
  const TouchbaseDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Sanjoy’s Touchbase"),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),onPressed: (){
            Navigator.pop(context);
          }
          ),backgroundColor: Colors.transparent,elevation: 0,
        ),
        body: TouchbaseDetailsBoody(),
      ),
    );
  }
}
