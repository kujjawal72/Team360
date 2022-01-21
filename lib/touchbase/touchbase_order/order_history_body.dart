

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team360/base/response.dart';
import 'package:team360/touchbase/model/order_availability_in_inventory_response.dart';
import 'package:team360/touchbase/model/order_history_response.dart';
import 'package:team360/touchbase/touchbase_order/order_availability_in_inventory_dialog.dart';
import 'package:team360/touchbase/viewmodel/touchbase_viewmodel.dart';
import 'package:team360/util/my_colors.dart';
import 'package:team360/util/progress_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:team360/util/utils.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Response res = Provider.of<TouchBaseViewModel>(context).getOrderList;
    return Container(
      child: getOrderList(res, context),
    );
  }

  getOrderList(Response<dynamic> response, BuildContext context) {
    switch (response.status) {
      case Status.INITIAL:
        break;
      case Status.LOADING:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case Status.COMPLETED:
        final data = (response.data as OrderHistoryResponse).responseList;
        return ListView.builder(
          itemBuilder: (_, index) {
            return Container(
              margin: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 10),
              padding: const EdgeInsets.only(
                  left: 15, right: 10, top: 5, bottom: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: MyColor.dashboardCardShadowColor,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(
                        2.0, 2.0), // shadow direction: bottom right
                  ),
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(
                        -2.0, -2.0), // shadow direction: bottom right
                  )
                ],
              ),
              child: Column(
                children: [
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "₹"+data[index].salesAmount.toString() ,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  Align(
                    child: Padding(
                      padding:
                      const EdgeInsets.only(left: 8.0, bottom: 8),
                      child: Text(
                        "Products :"+data[index].orderProduct.map((e) => "${e.productName} (${e.outPrice.toInt()}x${e.qty})").join(", "),
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 8.0, bottom: 8),
                        child: Text(
                          "Date: "+data[index].orderDate,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      data[index].isFullfilled == 0?TextButton(
                        child: const Text("Fulfill this order",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),),
                        onPressed: (){
                          callInventoryListDialog(data[index].salesOrderId);
                        },
                      ):const TextButton(onPressed: null, child: Text("Order is Fulfilled"))
                    ],
                  ),
                ],
              ),
            );
          },
          itemCount: data.length,
          shrinkWrap: true,
        );
      case Status.ERROR:
        break;
    }
    return const Padding(padding: EdgeInsets.all(5));
  }

  Future<void> callInventoryListDialog(int orderId)async {
    try{
      Fimber.i("$orderId hfh");
      ProgressDialog.show(context);
      final call = await http.get(Uri.parse(baseUrl+"bakes_and_cakes/BakesAndCakes/getInventoryListBySalesOrder/$orderId"),headers: headers);
      Navigator.pop(context);
      final res = await returnResponse(call);
      final data = OrderAvailabilityInInventoryResponse.fromJson(res);
      for (var element in data.responseList) {
        var sb = "";
        for (var p in element.orderProduct) {
          if(p.qty > p.availableQty){
            sb += "${p.productName}: ${p.qty - p.availableQty}\n";
          }
        }
        element.lessProduct = sb.toString();
      }
      await OrderAvailabilityInInventoryDialog.show(context,data.responseList);
    }catch(e){
      Fimber.i("$e");
    }
  }
}
