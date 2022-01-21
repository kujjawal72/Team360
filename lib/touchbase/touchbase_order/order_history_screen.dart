
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team360/touchbase/viewmodel/touchbase_viewmodel.dart';

import 'create_touchbase_order.dart';
import 'order_history_body.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({Key? key,required this.retailerId}) : super(key: key);
  final int retailerId;

  @override
  Widget build(BuildContext context) {
    Provider.of<TouchBaseViewModel>(context,listen: false).getOrderListFunc(retailerId);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: const Body(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ChangeNotifierProvider<TouchBaseViewModel>(
                        create: (_) => TouchBaseViewModel(),
                        child: CreateSellOrder(retailerId: retailerId),
                      )));
        },
        tooltip: "Create Order",
      ),
    );
  }
}
