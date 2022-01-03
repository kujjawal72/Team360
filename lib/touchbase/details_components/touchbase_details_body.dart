import 'package:flutter/material.dart';
import 'package:team360/touchbase/details_components/check_out_dialog.dart';
import 'package:team360/touchbase/details_components/details_info_card.dart';
import 'package:team360/touchbase/details_components/edit_box_top_hint.dart';
import 'package:team360/touchbase/details_components/model.dart';
import 'package:team360/util/my_colors.dart';

class TouchbaseDetailsBoody extends StatefulWidget {
  const TouchbaseDetailsBoody({Key? key}) : super(key: key);

  @override
  State<TouchbaseDetailsBoody> createState() => _TouchbaseDetailsBoodyState();
}

class _TouchbaseDetailsBoodyState extends State<TouchbaseDetailsBoody> {
  final dummyData = dummy();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
      height: size.height,
      decoration: const BoxDecoration(
        color: MyColor.touchbaseDetailsPageColor,
        borderRadius: BorderRadius.zero,
      ),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 5, left: 20, right: 20),
              ),
              const Text(
                "Touchbase",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 5, left: 20, right: 20),
                decoration: const BoxDecoration(
                    color: Color(0xFFff0000),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1.0,
                        spreadRadius: 0.0,
                        offset:
                            Offset(2.0, 2.0), // shadow direction: bottom right
                      )
                    ]),
                child: const Text(
                  "12:32",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                  child: EditBoxTopHintWhiteRounded(
                hint: "Retailer full name",
              )),
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(5),
                alignment: Alignment.bottomCenter,
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
                child: Icon(Icons.person),
              )
            ],
          ),
          const Padding(padding: EdgeInsets.all(3)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                  child: EditBoxTopHintWhiteRounded(
                hint: "Retailer address",
              )),
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(5),
                alignment: Alignment.bottomCenter,
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
                child: Icon(Icons.location_on),
              )
            ],
          ),
          const Padding(padding: EdgeInsets.all(3)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                  child: EditBoxTopHintWhiteRounded(
                hint: "Owner's name",
              )),
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(5),
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                ),
                child: Icon(null),
              )
            ],
          ),
          const Padding(padding: EdgeInsets.all(3)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                  child: EditBoxTopHintWhiteRounded(
                hint: "Mobile No",
              )),
              Expanded(
                  child: EditBoxTopHintWhiteRounded(
                hint: "Email",
              )),
            ],
          ),
          Container(
              padding: const EdgeInsets.all(5),
              margin:
                  const EdgeInsets.only(top: 15, bottom: 10, left: 5, right: 5),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 3.0,
                      offset:
                          Offset(3.0, 3.0), // shadow direction: bottom right
                    ),
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.0,
                      offset:
                          Offset(-3.0, -3.0), // shadow direction: bottom right
                    )
                  ]),
              alignment: Alignment.center,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                      value: dummyData[index].completed,
                      title: Text(
                        dummyData[index].name,
                        style: const TextStyle(
                          fontSize: 16,
                          decorationStyle: TextDecorationStyle.solid,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(0),
                      dense: true,
                      onChanged: (newVal) {
                        setState(() {
                          dummyData[index].completed = newVal!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading);
                },
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: dummyData.length,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DetailsInfoCard(
                header: "\$LMTD",
                footer: "12,000.00",
              ),
              DetailsInfoCard(
                header: "\$MTD",
                footer: "22,000.00",
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DetailsInfoCard(
                header: "Lifetime value",
                footer: "92,000.00",
              ),
              DetailsInfoCard(
                header: "Payment Pending",
                footer: "19,000.00",
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DetailsInfoCard(
                header: "Credit",
                footer: "10,000.00",
              ),
              DetailsInfoCard(
                header: "Product purchase",
                footer: "40",
                icon: null,
              )
            ],
          ),
          InkWell(
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              margin: EdgeInsets.only(
                  left: size.width * 0.15,
                  right: size.width * 0.15,
                  top: 10,
                  bottom: 15),
              decoration: const BoxDecoration(
                  color: Color(0xFFff0000),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1.0,
                      offset: Offset(3.0, 3.0), // shadow direction: bottom right
                    ),
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1.0,
                      offset:
                      Offset(-1.0, -1.0), // shadow direction: bottom right
                    )
                  ]),
              child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Checkout",
                    style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
                  )),
            ),
            onTap: () {
              CheckoutFeedbackDialog.show(context);
            },
          )
        ],
        shrinkWrap: true,
      ),
    );
  }
}
