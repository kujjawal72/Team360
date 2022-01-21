import 'dart:io';

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:team360/base/file_upload_response.dart';
import 'package:team360/base/response.dart';
import 'package:team360/home/viewmodel/home_viewmodel.dart';
import 'package:team360/retailer/onboard/components/edit_box_white_rounded.dart';
import 'package:team360/retailer/onboard/model.dart';
import 'package:team360/retailer/onboard/onboard_retailer_doc.dart';
import 'package:team360/util/my_colors.dart';
import 'package:team360/util/profile_manager.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  XFile? _image;
  final ImagePicker _picker = ImagePicker();

  _imgFromCamera() async {
    XFile? image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      if(image != null){
        Provider.of<HomeViewModel>(context, listen: false)
            .uploadImageFile(image.path);
        _image = image;
      }
    });
  }

  _imgFromGallery() async {
    XFile? image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      if(image != null){
        Provider.of<HomeViewModel>(context, listen: false)
            .uploadImageFile(image.path);
        _image = image;
      }
    });
  }



  String uploadedImagePath = "";

  Widget getImageStatus() {
    Response? imageUploadResponse =
        Provider.of<HomeViewModel>(context).uploadImageResponse;
    switch (imageUploadResponse.status) {
      case Status.ERROR:
        Fluttertoast.showToast(msg: "Failed to upload image");
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(Icons.add_a_photo),
            Text(
              "Logo",
              style: TextStyle(color: Colors.black, fontSize: 12),
            )
          ],
        );
      case Status.INITIAL:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(Icons.add_a_photo),
            Text(
              "Logo",
              style: TextStyle(color: Colors.black, fontSize: 12),
            )
          ],
        );
      case Status.LOADING:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case Status.COMPLETED:
        uploadedImagePath = (imageUploadResponse.data as FileUploadResponse)
            .responseList[0]
            .FilePath;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.file(
              File(_image?.path ?? ""),
              width: 40,
              height: 40,
            ),
            const Text(
              "Logo",
              style: TextStyle(color: Colors.black, fontSize: 12),
            )
          ],
        );
    }
  }

  double latitude = 0;
  double longitude = 0;
  String pincode = "0";
  String city = "";
  String state = "";
  String addressLine1 = "";
  final request = AddRetailerRequest();

  void _getUserLocation() async {

    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: "Please enable location");
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: "You have denied the permission");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(msg: 'Location permissions are permanently denied, we cannot request permissions.');
      return;
    }

    var position = await GeolocatorPlatform.instance.getCurrentPosition();
    Fimber.i("${position.latitude} buf ${position.longitude}");
    final placeMark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
      pincode = placeMark[0].postalCode ?? "0";
      city = placeMark[0].subAdministrativeArea ?? "";
      state = placeMark[0].administrativeArea ?? "";
      addressLine1 = placeMark[0].locality ?? "";
      _cityController.text = city;
      _pinCodeController.text = pincode;
      _stateController.text = state;
      _addressController.text = addressLine1;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  final _nameController = TextEditingController();
  final _cityController = TextEditingController();
  final _pinCodeController = TextEditingController();
  final _stateController = TextEditingController();
  final _ownerNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _whatsappController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _cityController.dispose();
    _pinCodeController.dispose();
    _stateController.dispose();
    _ownerNameController.dispose();
    _addressController.dispose();
    _whatsappController.dispose();
    _emailController.dispose();
    uploadedImagePath = "";
    _image = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(children: [
      Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 15),
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
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
              child: const Text(
                "Let’s help you meet up your retailer",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: EditBoxWhiteRounded(
                    hint: "Enter retailer full name",
                    controller: _nameController,
                  ),
                ),
                InkWell(
                  child: Container(
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
                            offset: Offset(
                                3.0, 3.0), // shadow direction: bottom right
                          )
                        ],
                      ),
                      child: getImageStatus()),
                  onTap: () {
                    _showPicker(context);
                  },
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: EditBoxWhiteRounded(
                    hint: "Pincode",
                    controller: _pinCodeController,
                    maxLength: 6,
                    keyboardType: TextInputType.number,
                  ),
                ),
                InkWell(
                  child: Container(
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
                            offset: Offset(
                                3.0, 3.0), // shadow direction: bottom right
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(Icons.add_location),
                          Text(
                            " Add ",
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          )
                        ],
                      )),
                  onTap: () {
                    _getUserLocation();
                  },
                ),
              ],
            ),
            Row(children: [
              Expanded(
                child: EditBoxWhiteRounded(
                  hint: "City",
                  controller: _cityController,
                  margin: const EdgeInsets.only(
                      left: 3, right: 10, top: 10, bottom: 5),
                ),
              ),
              Expanded(
                child: EditBoxWhiteRounded(
                  hint: "State",
                  controller: _stateController,
                  margin: const EdgeInsets.only(
                      left: 10, right: 3, top: 10, bottom: 5),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: EditBoxWhiteRounded(
                hint: "Address",
                controller: _addressController,
              ),
            ),
            EditBoxWhiteRounded(
              hint: "Owner's name",
              keyboardType: TextInputType.name,
              controller: _ownerNameController,
            ),
            EditBoxWhiteRounded(
              hint: "Whatsapp number",
              controller: _whatsappController,
              maxLength: 10,
              keyboardType: TextInputType.phone,
              margin: const EdgeInsets.only(
                  left: 3, right: 5, top: 10, bottom: 5),
            ),
            EditBoxWhiteRounded(
              hint: "Email",
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              margin: const EdgeInsets.only(
                  left: 5, right: 3, top: 10, bottom: 5),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OnBoardRetailerDoc(
                          request: request,
                        )));
                return;
                if (uploadedImagePath.isEmpty) {
                  Fluttertoast.showToast(msg: "Please upload an image");
                  return;
                } else if (_nameController.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Please enter retailer name");
                  return;
                } else if (_cityController.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Please enter city");
                  return;
                } else if (_pinCodeController.text.length < 6) {
                  Fluttertoast.showToast(msg: "Please enter correct pin code");
                  return;
                } else if (_stateController.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Please enter state");
                  return;
                } else if (_addressController.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Please enter street address");
                  return;
                } else if (_ownerNameController.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Please enter business owner name");
                  return;
                } else if (_whatsappController.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Please enter whatsapp number");
                  return;
                } else if (_emailController.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Please enter email");
                  return;
                }
                request.retailerName = _nameController.text;
                request.logo = uploadedImagePath;
                request.latitude = latitude.toString();
                request.longitude = longitude.toString();
                request.pincode = _pinCodeController.text;
                request.city = _cityController.text;
                request.statte = _stateController.text;
                request.address = _addressController.text;
                request.ownerName = _ownerNameController.text;
                request.email = _emailController.text;
                request.whatsappNo = _whatsappController.text;

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OnBoardRetailerDoc(
                              request: request,
                            )));
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
                        offset:
                            Offset(5.0, 5.0), // shadow direction: bottom right
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
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
          ],
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ),
    ]);
  }
}
