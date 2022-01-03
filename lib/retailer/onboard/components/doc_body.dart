import 'package:flutter/material.dart';
import 'package:team360/retailer/onboard/components/edit_box_white_rounded.dart';
import 'package:team360/util/my_colors.dart';

class DocBody extends StatelessWidget {
  const DocBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 15),
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
        height: size.height,
        decoration: const BoxDecoration(
          color: Color(0xffc5c1d8),
          borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
          boxShadow: [
            BoxShadow(
              color: MyColor.dashboardCardShadowColor,
              blurRadius: 10.0,
              spreadRadius: 0.0,
              offset: Offset(15.0, 15.0), // shadow direction: bottom right
            )
          ],
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.center,
                      child: const Text(
                        "Welcome Onboard!",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      )),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(5),
                    child: const Text(
                      "Let’s help you meet up your retailer",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  Row(
                    children: [

                      Image.asset(
                        "assets/icons/documents.png",
                        width: 70,
                        height: 70,
                      ),
                      Expanded(
                          child: EditBoxWhiteRounded(
                        hint: "GSTIN",
                      ))
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  Row(
                    children: [
                      Image.asset(
                        "assets/icons/documents.png",
                        width: 70,
                        height: 70,
                      ),
                      Expanded(
                          child: EditBoxWhiteRounded(
                        hint: "Trade License",
                      ))
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  Row(
                    children: [
                      Image.asset(
                        "assets/icons/documents.png",
                        width: 70,
                        height: 70,
                      ),
                      Expanded(
                          child: EditBoxWhiteRounded(
                        hint: "Udyog Adhar",
                      ))
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(18),
                  decoration: const BoxDecoration(
                      color: MyColor.onBoardBtnColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey,
                          blurRadius: 5.0,
                          spreadRadius: 0.0,
                          offset: Offset(
                              5.0, 5.0), // shadow direction: bottom right
                        )
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(2))),
                  child: const Center(
                      child: Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              )
            ]));
  }
}
