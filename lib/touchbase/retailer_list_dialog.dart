import 'package:flutter/material.dart';
import 'package:team360/util/my_colors.dart';

import 'model/retailer_list_model.dart';

class RetailerListDialog {
  static Future<dynamic> show(BuildContext context, List<ResponseList> data) {
    Size size = MediaQuery.of(context).size;
    final dialog = Dialog(
      insetPadding: const EdgeInsets.all(10),
      child: Container(
        width: size.width * 0.9,
        height: size.height*0.8,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.transparent),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(10)),
            const Text(
              "Select Nearest Retailer",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  letterSpacing: 2),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemBuilder: (_, index) {
                  return InkWell(
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 10),
                      padding: const EdgeInsets.only(
                          left: 15, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: MyColor.dashboardCardShadowColor,
                            blurRadius: 5.0,
                            spreadRadius: 0.0,
                            offset: Offset(
                                3.0, 3.0), // shadow direction: bottom right
                          ),
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                            spreadRadius: 0.0,
                            offset: Offset(
                                -3.0, -3.0), // shadow direction: bottom right
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                  flex: 2,
                                  child: Image(
                                    image: NetworkImage(data[index].logo),
                                    height: 100,
                                    fit: BoxFit.fitWidth,
                                  )),
                              Flexible(
                                flex: 7,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data[index].name,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          data[index].location,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        Text(
                                          data[index].email,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        Text(
                                          data[index].phoneno,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  children: [
                                    InkWell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Image.asset(
                                          "assets/icons/call.png",
                                          width: 30,
                                          height: 30,
                                        ),
                                      ),
                                      onTap: () {},
                                      splashColor: Colors.lightBlueAccent,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Image.asset(
                                        "assets/icons/whatsapp.png",
                                        width: 30,
                                        height: 30,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Image.asset(
                                        "assets/icons/location.png",
                                        width: 30,
                                        height: 30,
                                      ),
                                    ),
                                  ],
                                ),
                                flex: 1,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  width: 13,
                                  height: 13,
                                  decoration: BoxDecoration(
                                      color: data[index].status == 0
                                          ? Colors.red
                                          : Colors.lightGreen,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                                data[index].status == 0
                                    ? const Text(
                                        "Pending",
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 15),
                                      )
                                    : const Text(
                                        "Approved",
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 15),
                                      )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context,data[index]);
                    },
                  );
                },
                itemCount: data.length,
                shrinkWrap: true,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 15,
    );

    return showDialog(context: context, builder: (_) => dialog);
  }
}
