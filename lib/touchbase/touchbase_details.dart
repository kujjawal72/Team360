import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team360/home/components/backgound.dart';
import 'package:team360/home/viewmodel/home_viewmodel.dart';
import 'package:team360/touchbase/touchbase_order/create_touchbase_order.dart';
import 'package:team360/touchbase/viewmodel/touchbase_viewmodel.dart';

import 'details_components/timer_widget.dart';
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
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            final res = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ChangeNotifierProvider<TouchBaseViewModel>(
                          create: (_) => TouchBaseViewModel(),
                          child: CreateSellOrder(retailerId: widget.retailerId),
                        )));
            Provider.of<HomeViewModel>(context, listen: false)
                .getTouchbaseDetailsFunc(widget.retailerId, widget.touchbaseId);
            setState(() {

            });
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
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10,top: 14,bottom: 14),
              padding: const EdgeInsets.only(
                  top: 5, bottom: 5, left: 20, right: 20),
              decoration: const BoxDecoration(
                  color: Color(0xFFff0000),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1.0,
                      spreadRadius: 0.0,
                      offset:
                      Offset(2.0, 2.0), // shadow direction: bottom right
                    ),
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1,
                      spreadRadius: 0.0,
                      offset:
                      Offset(-2.0, -2.0), // shadow direction: bottom right
                    )
                  ]),
              child: const TimerWidget(),
            )
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: TouchbaseDetailsBoody(retailerId: widget.retailerId,touchbaseId: widget.touchbaseId),
      ),
    );
  }
}
