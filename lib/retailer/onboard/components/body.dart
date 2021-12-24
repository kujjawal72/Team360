import 'package:flutter/material.dart';
import 'package:team360/retailer/onboard/components/edit_box_white_rounded.dart';
import 'package:team360/retailer/onboard/onboard_retailer_doc.dart';
import 'package:team360/util/my_colors.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

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
      child: ListView(
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
            child: Text(
              "Let’s help you meet up your retailer",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: EditBoxWhiteRounded(
                  hint: "Enter retailer full name",
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey,
                        blurRadius: 3.0,
                        spreadRadius: 0.0,
                        offset:
                            Offset(3.0, 3.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(Icons.add_a_photo),
                      Text(
                        "Logo",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      )
                    ],
                  )),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: EditBoxWhiteRounded(
                  hint: "Pincode",
                ),
              ),
              Container(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey,
                        blurRadius: 3.0,
                        spreadRadius: 0.0,
                        offset:
                            Offset(3.0, 3.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.add_location),
                      Text(
                        " Add ",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      )
                    ],
                  )),
            ],
          ),
          Row(children: [
            Expanded(
              child: EditBoxWhiteRounded(
                hint: "City",
                margin: EdgeInsets.only(left: 3, right: 10, top: 10, bottom: 5),
              ),
            ),
            Expanded(
              child: EditBoxWhiteRounded(
                hint: "State",
                margin: EdgeInsets.only(left: 10, right: 3, top: 10, bottom: 5),
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: EditBoxWhiteRounded(
              hint: "Address",
            ),
          ),
          EditBoxWhiteRounded(
            hint: "Owner's name",
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const OnBoardRetailerDoc()));
            },
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
                      offset: Offset(5.0, 5.0), // shadow direction: bottom right
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(2))),
              child: const Center(
                  child: Text(
                "Add documents",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
            ),
          )
        ],
        shrinkWrap: true,
      ),
    );
  }
}
