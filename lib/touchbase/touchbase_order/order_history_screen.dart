
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team360/home/components/backgound.dart';
import 'package:team360/touchbase/viewmodel/touchbase_viewmodel.dart';
import 'package:team360/util/my_colors.dart';

import 'create_touchbase_order.dart';
import 'order_history_body.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({Key? key,required this.retailerId}) : super(key: key);
  final int retailerId;

  @override
  Widget build(BuildContext context) {
    Provider.of<TouchBaseViewModel>(context,listen: false).getOrderListFunc(retailerId);
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: const Body(),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text("Order History"),backgroundColor: Colors.transparent,elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add,color: Colors.deepPurpleAccent,),elevation: 30,backgroundColor: Colors.amberAccent,
          onPressed: () async {
            final res = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ChangeNotifierProvider<TouchBaseViewModel>(
                          create: (_) => TouchBaseViewModel(),
                          child: CreateSellOrder(retailerId: retailerId),
                        )));
            Provider.of<TouchBaseViewModel>(context,listen: false).getOrderListFunc(retailerId);
          },
          tooltip: "Create Order",
        ),
      ),
    );
  }
}
