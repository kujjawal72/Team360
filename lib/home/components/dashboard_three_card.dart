import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team360/util/my_colors.dart';

class DashboardCardWithThreeCard extends StatelessWidget {
  const DashboardCardWithThreeCard({Key? key}) : super(key: key);

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
              width: size.width * 0.9,
              decoration: BoxDecoration(
                color: const Color(0xFFDADADA),
                borderRadius: BorderRadius.circular(29),
              ),
              child: Row(

                children: [
                  Flexible(
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 3),
                        width: size.width * 0.9,
                        decoration: BoxDecoration(
                          color: const Color(0xff67f1ea),
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: buildTextInsideCard("Total Accounts", "100")),
                    flex: 1,
                  ),
                  Flexible(
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 3),
                        width: size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: buildTextInsideCard("Active Accounts", "50")),
                    flex: 1,
                  ),
                ],
              )),
            flex: 2,
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
              width: size.width * 0.9,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(29),
              ),
                child: buildTextInsideCard("Conversion %", "50%")),
            flex: 1,
          )
        ],
      ),
    );
  }
}

Widget? buildTextInsideCard(String header, String footer){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(header,style: const TextStyle(fontSize: 14),),
      Text(footer,style: const TextStyle(fontSize: 20),),
    ],
  );

}
