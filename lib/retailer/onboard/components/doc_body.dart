import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:team360/base/response.dart';
import 'package:team360/home/viewmodel/home_viewmodel.dart';
import 'package:team360/retailer/onboard/model.dart';
import 'package:team360/touchbase/details_components/edit_box_top_hint.dart';
import 'package:team360/util/my_colors.dart';
import 'package:team360/util/radio_group.dart';

class DocBody extends StatefulWidget {
  final AddRetailerRequest request;

  const DocBody({Key? key, required this.request}) : super(key: key);

  @override
  State<DocBody> createState() => _DocBodyState();
}

class _DocBodyState extends State<DocBody> {
  final _inputController = TextEditingController();

  final data = [
    RadioModel("GSTIN", 1),
    RadioModel("Trade License", 1),
    RadioModel("Udyog Aadhaar", 1)
  ];

  RadioModel? _currentValue;

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    Response registerResponse =
        Provider
            .of<HomeViewModel>(context)
            .addReatilerResponse;
    return ListView(
      children: [
        Container(
            margin:
            const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 15),
            padding:
            const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
            height: size.height * 0.85,
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
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          )),

                      const Padding(padding: EdgeInsets.all(5)),
                      const Align(child: Text("Please select a document type",
                        style: TextStyle(fontSize: 16),),
                        alignment: Alignment.centerLeft,),
                      ListView.builder(
                        itemBuilder: (_, index) {
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Theme(
                                  data: ThemeData(
                                      brightness: Brightness.dark,
                                      unselectedWidgetColor: Colors.white),
                                  child: Transform.scale(
                                    scale: 1.2,
                                    child: Radio(
                                      value: data[index],
                                      groupValue: _currentValue,
                                      onChanged: (RadioModel? newValue) {
                                        setState(() {
                                          _currentValue = newValue!;
                                        });
                                      },
                                      activeColor: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 9,
                                fit: FlexFit.tight,
                                child: TextButton(
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        data[index].title,
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      )),
                                  onPressed: () {
                                    setState(() {
                                      _currentValue = data[index];
                                    });
                                  },
                                ),
                              )
                            ],
                          );
                        },
                        itemCount: data.length,
                        shrinkWrap: true, scrollDirection: Axis.vertical,
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      getDocumentEditField(),
                      const Padding(padding: EdgeInsets.all(10)),
                      getDocumentUploadField()
                    ],
                  ),
                  getButtonOrProgress(registerResponse)
                ])),
      ],
    );
  }

  getButtonOrProgress(Response<dynamic> registerResponse) {
    switch (registerResponse.status) {
      case Status.INITIAL:
        return InkWell(
          onTap: () {
            Fimber.i(widget.request.logo);
            onRegisterClick();
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
                  "Register",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
          ),
        );
      case Status.LOADING:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case Status.COMPLETED:
        Fluttertoast.showToast(msg: "Registered successfully");
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          Navigator.of(context)
            ..pop()..pop();
        });
        return Container();
      case Status.ERROR:
        Fluttertoast.showToast(msg: "Failed to register");
        return InkWell(
          onTap: () {
            Fimber.i(widget.request.logo);
            onRegisterClick();
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
                  "Register",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
          ),
        );
    }
  }

  Widget getDocumentEditField() {
    if ((_currentValue?.id ?? 0) == 0) {
      return Container();
    }
    _inputController.text = "0";
    return EditBoxTopHintWhiteRounded(
      hint: "${_currentValue!.title} number",
      controller: _inputController,
    );
  }

  Widget getDocumentUploadField() {
    if ((_currentValue?.id ?? 0) == 0) {
      return Container();
    }

    return InkWell(
      onTap: () {
        _pickDocFile();
      },
      child: Column(
        children: [
          Container(padding: const EdgeInsets.all(8),alignment: Alignment.centerLeft,child: Text(localFilePath.split("/").last)),
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3.0,
                  spreadRadius: 0.0,
                  offset: Offset(3.0, 3.0), // shadow direction: bottom right
                )
              ],
            ),
            child: Row(
              children: [
                const Padding(padding: EdgeInsets.all(3)),
                const Icon(Icons.cloud_upload_rounded),
                const Padding(padding: EdgeInsets.all(8)),
                Text("Upload ${_currentValue!.title} (pdf/image)")
              ],
            ),
          )
        ],
      ),
    );
  }

  String localFilePath = "";

  _pickDocFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        localFilePath = result.files.single.path!;
      });
    } else {

    }
  }

  void onRegisterClick() {

    if(_currentValue == null){
      Fluttertoast.showToast(msg: "Please select a document type");
      return;
    }
    if(_inputController.text.isEmpty || _inputController.text == "0"){
      Fluttertoast.showToast(msg: "Please enter ${_currentValue?.title??""} number");
      return;
    }
    if(localFilePath.isEmpty){
      Fluttertoast.showToast(msg: "Please upload ${_currentValue?.title??""} file");
      return;
    }

   /* Provider.of<HomeViewModel>(context, listen: false)
        .addReatilerResponseFunc(widget.request, DocumetType(
        documentsTypeId: _currentValue!.id,
        documentLink: localFilePath,
        documentNo: int.parse(_inputController.text)));*/
  }
}
