import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team360/home/components/backgound.dart';
import 'package:team360/home/viewmodel/home_viewmodel.dart';
import 'package:team360/touchbase/touchbase_order/create_touchbase_order.dart';
import 'package:team360/touchbase/viewmodel/touchbase_viewmodel.dart';

import 'details_components/touchbase_details_body.dart';

class TouchBaseDetails extends StatefulWidget {
  const TouchBaseDetails({
    Key? key,
    required this.retailerId,
    required this.touchbaseId,
  }) : super(key: key);
  final touchbaseId;
  final retailerId;

  @override
  State<TouchBaseDetails> createState() => _TouchBaseDetailsState();
}

class _TouchBaseDetailsState extends State<TouchBaseDetails> {
  @override
  Widget build(BuildContext context) {
    Provider.of<HomeViewModel>(context, listen: false)
        .getTouchbaseDetailsFunc(widget.retailerId, widget.touchbaseId);
    Fimber.i("${widget.touchbaseId}");
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ChangeNotifierProvider<TouchBaseViewModel>(
                          create: (_) => TouchBaseViewModel(),
                          child: CreateSellOrder(retailerId: widget.retailerId),
                        )));
          },
          tooltip: "Create Order",
        ),
        appBar: AppBar(
          title: const Text("Touchbase"),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: TouchbaseDetailsBoody(retailerId: widget.retailerId),
      ),
    );
  }
}
