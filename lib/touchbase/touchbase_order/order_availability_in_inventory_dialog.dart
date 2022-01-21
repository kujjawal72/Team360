import 'package:flutter/material.dart';
import 'package:team360/touchbase/model/order_availability_in_inventory_response.dart';
import 'package:team360/util/my_colors.dart';

class OrderAvailabilityInInventoryDialog {
  static Future<dynamic> show(BuildContext context, List<ResponseList> data) {
    Size size = MediaQuery.of(context).size;
    final dialog = Dialog(
      insetPadding: const EdgeInsets.all(10),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.8,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.transparent),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(left: 10,right: 10,top: 5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Select an inventory to fulfill",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: const Icon(Icons.close,color: Colors.black87,))
              ],
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
                        color: data[index].lessProduct == ""?Colors.white:Colors.white70,
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
                                data[index].name,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          data[index].lessProduct == ""?Container(
                            padding: const EdgeInsets.all(8),
                          ):Column(
                            children: [
                              const Align(
                                child: Padding(
                                  padding:
                                  EdgeInsets.only(left: 8.0, bottom: 8),
                                  child: Text(
                                    "Missing Products",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                              ),
                              Align(
                                child: Padding(
                                  padding:
                                  const EdgeInsets.only(left: 12.0, bottom: 2),
                                  child: Text(
                                    data[index].lessProduct,
                                    style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      //Navigator.pop(context, data[index]);
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
      backgroundColor: Colors.lightBlueAccent,
      elevation: 15,
    );

    return showDialog(context: context, builder: (_) => dialog);
  }
}
