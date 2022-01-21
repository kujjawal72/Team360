import 'dart:convert';

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:team360/touchbase/details_components/edit_box_top_hint.dart';
import 'package:team360/touchbase/model/inventory_list_response_model.dart' as ilrm;
import 'package:team360/touchbase/model/inventory_product_list_response.dart' as iplr;
import 'package:team360/touchbase/model/inventory_product_list_response.dart';
import 'package:team360/touchbase/model/sell_product_to_retailer_model.dart';
import 'package:team360/touchbase/touchbase_order/inventory_dialog.dart';
import 'package:team360/util/profile_manager.dart';
import 'package:team360/util/progress_dialog.dart';
import 'package:team360/util/utils.dart';

import 'inventory_product_dialog.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.retailerId}) : super(key: key);
  final int retailerId;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _productCountCont = TextEditingController();
  final _salesAmountCont = TextEditingController();
  final _updateQtyController = TextEditingController();

  final productsForOrder = List<iplr.ResponseList>.empty(growable: true);

  @override
  void initState() {
    super.initState();
    _productCountCont.text = "0";
    _salesAmountCont.text = "0.0";
  }

  @override
  void dispose() {
    _productCountCont.dispose();
    _salesAmountCont.dispose();
    _updateQtyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      child: ListView(
        shrinkWrap: true,
        children: [
          AppBar(
            title: const Text("Create Order"),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                    onPressed: () {
                      createOrderAsync();
                    },
                    icon: const Icon(
                      Icons.done,
                      size: 35,
                    )),
              )
            ],
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                }),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: EditBoxTopHintWhiteRounded(
                  hint: "No of products",
                  controller: _productCountCont,
                  enabled: false,
                )),
                const Padding(padding: EdgeInsets.all(8)),
                Expanded(
                    child: EditBoxTopHintWhiteRounded(
                  hint: "Sales amount",
                  enabled: false,
                  controller: _salesAmountCont,
                ))
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          getListWidget(),
          Center(
              child: TextButton.icon(
            onPressed: () {
              getInventories();
            },
            label: const Text(
              "Add Product",
              style: TextStyle(color: Colors.black),
            ),
            style:
                TextButton.styleFrom(backgroundColor: Colors.lightGreenAccent),
            icon: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          ))
        ],
      ),
    );
  }

  Future<void> getInventories() async {
    try {
      ProgressDialog.show(context);
      final inventory = await returnResponse(await http.get(
          Uri.parse(baseUrl + "bakes_and_cakes/BakesAndCakes/InventoryList"),
          headers: headers));
      Navigator.pop(context);
      final inventoryData = ilrm.InventoryListResponse.fromJson(inventory);
      final dialogRes =
          await InventoryDialog.show(context, inventoryData.responseList);
      if (dialogRes != null) {
        await getInventoryProducts(
            (dialogRes as ilrm.ResponseList).inventoryId);
      }
    } catch (e) {
      Fimber.i("$e");
    }
  }

  Future<void> getInventoryProducts(int inventoryId) async {
    try {
      ProgressDialog.show(context);
      final products = await returnResponse(await http.get(
          Uri.parse(baseUrl +
              "bakes_and_cakes/BakesAndCakes/ProductList/$inventoryId"),
          headers: headers));
      Navigator.pop(context);
      final productsData = InventoryProductListResponse.fromJson(products);
      final dialogRes =
          await InventoryProductDialog.show(context, productsData.responseList);
      if (dialogRes != null) {
        setState(() {
          productsForOrder.add((dialogRes as iplr.ResponseList));
          calculateNumberAndSaleAmount();
        });
      }
    } catch (e) {
      Fimber.i("$e");
    }
  }

  Widget getListWidget() {
    final list = List<Widget>.empty(growable: true);
    var i = 0;
    for (var element in productsForOrder) {
      list.add(Container(
        margin: const EdgeInsets.only(left: 18, right: 18, top: 5, bottom: 10),
        padding: const EdgeInsets.only(left: 15, right: 10, top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0), // shadow direction: bottom right
            ),
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(-2.0, -2.0), // shadow direction: bottom right
            )
          ],
        ),
        child: Column(
          children: [
            Align(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  element.productName,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              alignment: Alignment.centerLeft,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,),
                      child: Text(
                        "Qty: ${productsForOrder[i].buyingQty}",
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton.icon(onPressed: () async {
                      final res = await openDialog(element.productName,element.buyingQty);
                      if(res != null && (res as String).isNotEmpty){
                        setState(() {
                          element.buyingQty = int.parse(res);
                          calculateNumberAndSaleAmount();
                        });
                      }
                    }, label: const Text("Change"),icon: const Icon(Icons.edit,size: 20,))
                  ],
                ),
                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      productsForOrder.remove(element);
                      calculateNumberAndSaleAmount();
                    });
                  },
                  label: const Text("Remove",
                      style: TextStyle(color: Colors.redAccent)),
                  icon: const Icon(
                    Icons.remove,
                    color: Colors.red,
                    size: 18,
                  ),
                )
              ],
            ),
          ],
        ),
      ));
      i++;
    }
    return Column(
      children: list,
    );
  }

  calculateNumberAndSaleAmount() {
    int count = 0;
    double amount = 0.0;
    for (var element in productsForOrder) {
      amount += (element.outPrice*element.buyingQty);
      count++;
    }
    _productCountCont.text = "$count";
    _salesAmountCont.text = "$amount";
  }

  Future<void> createOrderAsync() async {
    ProgressDialog.show(context);
    final userId = await ProfileManager.getUserId();
    final request = SellProductToRetailerRequest(
        retailerId: widget.retailerId,
        salesAmount: _salesAmountCont.text,
        products: productsForOrder
            .map((e) => Products(qty: e.buyingQty, productId: e.productId))
            .toList(),
        salesmanId: userId);
    Fimber.i("${request.toJson()}");
    try {
      final createOrder = await returnResponse(await http.post(
          Uri.parse(baseUrl +
              "bakes_and_cakes_admin/BakesAndCakesAdmin/sellProductToRetailer"),
          headers: headers,
          body: jsonEncode(request.toJson())));
      Fimber.i("$createOrder");
      if (createOrder == null) {
        Fluttertoast.showToast(msg: "Failed to create order");
      } else {
        Fluttertoast.showToast(msg: "Order created successfully");
        Navigator.pop(context);
      }
    } catch (e) {
      Fimber.i("$e");
    }
    Navigator.pop(context);
  }

  Future<dynamic> openDialog(String productName, int buyingQty) async {
    _updateQtyController.text = "$buyingQty";
    return showDialog(context: context, builder: (context)=>AlertDialog(
      title: Text(productName),backgroundColor: Colors.white,
      content: TextField(
        controller: _updateQtyController,keyboardType: const TextInputType.numberWithOptions(),
        textInputAction: TextInputAction.done,autofocus: true,onSubmitted: (newVal){
        _updateQtyController.clear();
        Navigator.pop(context,newVal);
      },
      ),
      actions: [
        TextButton(onPressed: (){
          _updateQtyController.clear();
          Navigator.pop(context);
        }, child: const Text("CANCEL",style: TextStyle(color: Colors.grey),)),
        TextButton(onPressed: (){
          final newVal = _updateQtyController.text;
          _updateQtyController.clear();
          Navigator.pop(context,newVal);
        }, child: const Text("UPDATE",style: TextStyle(color: Colors.blue),)),
      ],
    ));
  }
}
