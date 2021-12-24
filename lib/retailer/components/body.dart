import 'package:flutter/material.dart';
import 'package:team360/retailer/model/models.dart';
import 'package:team360/util/my_colors.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  final dummys = Retailer.dummys;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.0),
      child: ListView.builder(
        itemBuilder: (_, index) {
          return Container(
            margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
            padding: EdgeInsets.only(left: 15,right: 10,top: 5,bottom: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: MyColor.dashboardCardShadowColor,
                  blurRadius: 10.0,
                  spreadRadius: 0.0,
                  offset: Offset(10.0, 10.0), // shadow direction: bottom right
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
                          image: NetworkImage(dummys[index].shopLogo),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dummys[index].name,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                dummys[index].address,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text(
                                dummys[index].email,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text(
                                dummys[index].mobile,
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
                            onTap: (){},splashColor: Colors.lightBlueAccent,
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
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        width: 13,
                        height: 13,
                        decoration: BoxDecoration(
                            color: dummys[index].status == "0"
                                ? Colors.red
                                : Colors.lightGreen,
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),
                      dummys[index].status == "0"
                          ? const Text(
                              "Pending",
                              style: TextStyle(color: Colors.red, fontSize: 15),
                            )
                          : const Text(
                              "Approved",
                              style: TextStyle(color: Colors.green, fontSize: 15),
                            )
                    ],
                  ),
                )
              ],
            ),
          );
        },
        itemCount: dummys.length,
        shrinkWrap: true,
      ),
    );
  }
}
