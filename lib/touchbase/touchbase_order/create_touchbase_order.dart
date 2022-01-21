import 'package:flutter/material.dart';
import 'package:team360/home/components/backgound.dart';
import 'package:team360/touchbase/touchbase_order/body.dart';

class CreateSellOrder extends StatelessWidget {
  const CreateSellOrder({Key? key, required this.retailerId}) : super(key: key);
  final int retailerId;
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Body(retailerId: retailerId),
        appBar: null,
      ),
    );
  }
}
