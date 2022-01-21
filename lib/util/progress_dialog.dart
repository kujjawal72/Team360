

import 'package:flutter/material.dart';

class ProgressDialog {
  static Future<dynamic> show(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final dialog = WillPopScope(child: Dialog(
      insetPadding: const EdgeInsets.all(10),
      child: Container(
        width: size.width * 0.1,
        height: size.height*0.1,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.transparent),
        child: const Center(child: CircularProgressIndicator()),
      ),
      backgroundColor: Colors.transparent,
      elevation: 15,
    ), onWillPop: ()=>Future.value(false));

    return showDialog(context: context, builder: (_) => dialog,barrierDismissible: false,);
  }
}
