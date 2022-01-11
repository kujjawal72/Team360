import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team360/base/response.dart';
import 'package:team360/home/viewmodel/home_viewmodel.dart';
import 'package:team360/retailer/model/models.dart';
import 'package:team360/util/my_colors.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Response retResponse = Provider.of<HomeViewModel>(context).getRetailerListResponse;
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.0),
      child: getRetailerList(retResponse),
    );
  }

  getRetailerList(Response<dynamic> retResponse) {
    Fimber.i("${retResponse.status}");
    switch(retResponse.status){

      case Status.INITIAL:
        break;
      case Status.LOADING:
        return const Center(child: CircularProgressIndicator(),);
      case Status.COMPLETED:
        final data = retResponse.data as RetailerListResponse;
        return ListView.builder(
          itemBuilder: (_, index) {
            return Container(
              margin:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              padding:
              const EdgeInsets.only(left: 15, right: 10, top: 5, bottom: 5),
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
                            image: NetworkImage(data.responseList[index].logo),
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
                                  data.responseList[index].name,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  data.responseList[index].location,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  data.responseList[index].email,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  data.responseList[index].phoneno,
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
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          width: 13,
                          height: 13,
                          decoration: BoxDecoration(
                              color: data.responseList[index].status == 0
                                  ? Colors.red
                                  : Colors.lightGreen,
                              borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                        ),
                        data.responseList[index].status == 0
                            ? const Text(
                          "Pending",
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        )
                            : const Text(
                          "Approved",
                          style:
                          TextStyle(color: Colors.green, fontSize: 15),
                        )
                      ],
                    ),
                  )
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
