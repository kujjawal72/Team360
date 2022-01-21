import 'dart:convert';
import 'dart:io';

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:team360/base/file_upload_response.dart';
import 'package:team360/base/response.dart';
import 'package:team360/home/viewmodel/home_viewmodel.dart';
import 'package:team360/touchbase/model/salesman_touchbase_request_model.dart';
import 'package:team360/touchbase/model/salesman_touchbase_response_model.dart';
import 'package:team360/util/profile_manager.dart';
import 'package:team360/util/progress_dialog.dart';
import 'package:team360/util/utils.dart';

import '../touchbase_details.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.retailerId}) : super(key: key);
  final int retailerId;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  XFile? _image;
  ImagePicker? _picker = ImagePicker();
  double latitude = 0;
  double longitude = 0;

  _imgFromCamera() async {
    XFile? image =
        await _picker?.pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      if (image != null) {
        Provider.of<HomeViewModel>(context, listen: false)
            .uploadImageFile(image.path);
        _image = image;
      }
    });
  }

  @override
  void dispose() {
    _image = null;
    _picker = null;
    uploadedImagePath = null;
    super.dispose();
  }

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
      Fluttertoast.showToast(
          msg:
              'Location permissions are permanently denied, we cannot request permissions.');
      return;
    }

    var position = await GeolocatorPlatform.instance.getCurrentPosition();
    Fluttertoast.showToast(msg: "Location found");
    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
    });
  }

  _imgFromGallery() async {
    XFile? image =
        await _picker?.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      if (image != null) {
        Provider.of<HomeViewModel>(context, listen: false)
            .uploadImageFile(image.path);
        _image = image;
      }
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

  String? uploadedImagePath = "";

  Widget _getImageStatus() {
    Response imageUploadResponse =
        Provider.of<HomeViewModel>(context).uploadImageResponse;
    switch (imageUploadResponse.status) {
      case Status.ERROR:
        Fluttertoast.showToast(msg: "Failed to upload image");
        return Container(
            padding: const EdgeInsets.all(30),
            margin: const EdgeInsets.all(4),
            decoration:
                const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            child: Image.asset(
              "assets/icons/selfie.png",
              width: 80,
              height: 80,
            ));
      case Status.INITIAL:
        return Container(
            padding: const EdgeInsets.all(30),
            margin: const EdgeInsets.all(4),
            decoration:
                const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            child: Image.asset(
              "assets/icons/selfie.png",
              width: 80,
              height: 80,
            ));
      case Status.LOADING:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case Status.COMPLETED:
        uploadedImagePath = (imageUploadResponse.data as FileUploadResponse)
            .responseList[0]
            .FilePath;

        return CircleAvatar(
          backgroundImage: FileImage(File(_image?.path ?? "")),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 8),
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
      height: size.height,
      decoration: const BoxDecoration(
        color: Color(0xe6252139),
        borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 1.0,
            spreadRadius: 0.0,
            offset: Offset(1.0, 1.0), // shadow direction: bottom right
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              alignment: Alignment.center,
              child: const Text(
                "Welcome Touchbase",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            height: 145,
            width: 145,
            margin: const EdgeInsets.only(bottom: 22),
            child: InkWell(
              onTap: () => _showPicker(context),
              child: _getImageStatus(),
            ),
          ),
          InkWell(
            onTap: () => _getUserLocation(),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              margin: const EdgeInsets.all(5),
              child: Container(
                padding: const EdgeInsets.all(30),
                margin: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  "assets/icons/location_big.png",
                  width: 80,
                  height: 80,
                ),
              ),
            ),
          ),
          InkWell(
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(
                  left: 30, right: 30, top: 10, bottom: 5),
              decoration: const BoxDecoration(
                  color: Color(0xFF28c800),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Check-In",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            onTap: () {
              if (uploadedImagePath?.isEmpty ?? true) {
                Fluttertoast.showToast(msg: "Please upload a selfie");
              } else if (latitude == 0) {
                Fluttertoast.showToast(msg: "Please select your location");
              } else {
                getNearestRetailerList();
              }
              /*Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TouchbaseDetails()),
              );*/
            },
          )
        ],
      ),
    );
  }

  Future<void> getNearestRetailerList() async {
    try {
      ProgressDialog.show(context);
      final userId = await ProfileManager.getUserId();
      final body = SalesmanTouchBaseRequest(
          salesmanId: userId,
          latitude: latitude.toString(),
          longitude: longitude.toString(),
          lastUpdateId: userId,
          salesmanSelfyImage: uploadedImagePath ?? "",
          startTime: todayTime(),
          retailerId: widget.retailerId);
      Fimber.i("${body.toJson()}");
      final touchbaseRes = await returnResponse(await http.post(
          Uri.parse(
              baseUrl + "bakes_and_cakes/BakesAndCakes/salesmantouchbasepost"),
          headers: headers,
          body: jsonEncode(body)));
      final touchbaseData = SalesmanTouchBaseResponse.fromJson(touchbaseRes);
      final touchbaseId = touchbaseData.responseList.salesmanTouchbaseId;
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider<HomeViewModel>(
                  create: (_) => HomeViewModel(),
                  child: TouchBaseDetails(
                      retailerId: widget.retailerId, touchbaseId: touchbaseId),
                )),
      );
    } catch (e) {
      Fimber.i("$e");
    }
  }
}
