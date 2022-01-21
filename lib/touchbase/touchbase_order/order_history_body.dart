

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team360/base/response.dart';
import 'package:team360/touchbase/model/order_history_response.dart';
import 'package:team360/touchbase/viewmodel/touchbase_viewmodel.dart';
import 'package:team360/util/my_colors.dart';

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
    Fimber.i("${response.status}");
    switch (response.status) {
      case Status.INITIAL:
        break;
      case Status.LOADING:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case Status.COMPLETED:
        final data = response.data as OrderHistoryResponse;
        return ListView.builder(
          itemBuilder: (_, index) {
            return Container(
              margin: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 10),
              padding:
              const EdgeInsets.only(left: 15, right: 10, top: 5, bottom: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: MyColor.dashboardCardShadowColor,
                    blurRadius: 5.0,
                    spreadRadius: 0.0,
                    offset:
                    Offset(5.0, 5.0), // shadow direction: bottom right
                  )
                ],
              ),
              child: Column(
                children: [

                ],
              ),
            );
          },
          itemCount: data.responseList.length,
          shrinkWrap: true,
        );
      case Status.ERROR:
        break;
    }
    return const Padding(padding: EdgeInsets.all(5));
  }
}
