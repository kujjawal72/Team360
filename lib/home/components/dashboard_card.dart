import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team360/util/my_colors.dart';

class DashboardCard extends StatelessWidget {
  final String dailyRunRate;
  final String askingRunRate;
  const DashboardCard({Key? key,required this.dailyRunRate,required this.askingRunRate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(29),
        boxShadow: const [
          BoxShadow(
            color: MyColor.dashboardCardShadowColor,
            blurRadius: 10.0,
            spreadRadius: 0.0,
            offset: Offset(10.0, 10.0), // shadow direction: bottom right
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
              width: size.width * 0.9,
              decoration: BoxDecoration(
                color: MyColor.dashboardCardColor,
                borderRadius: BorderRadius.circular(29),
              ),
              child: buildTextInsideCard(
                  "Daily Run Rate",
                  const Icon(Icons.attach_money),
                  Text(
                    dailyRunRate,
                    style: const TextStyle(fontSize: 20),
                  )),
            ),
            flex: 1,
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
              width: size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(29),
              ),
              child: buildTextInsideCard(
                  "Asking Run Rate",
                  const Icon(Icons.attach_money),
                  Text(
                    askingRunRate,
                    style: const TextStyle(fontSize: 20),
                  )),
            ),
            flex: 1,
          )
        ],
      ),
    );
  }
}

Widget? buildTextInsideCard(String header, Icon icon, Widget label) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        header,
        style: const TextStyle(fontSize: 14),
      ),
      Row(
        children: [icon, label],
      )
    ],
  );
}
