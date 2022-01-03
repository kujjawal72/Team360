
import 'package:flutter/material.dart';
import 'package:team360/util/my_colors.dart';

class CheckoutFeedbackDialog {
  static void show(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final dialog = Dialog(
      insetPadding: const EdgeInsets.all(10),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.6,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: MyColor.touchbaseDetailsPageColor),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(10)),

          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 15,
    );

    showDialog(context: context, builder: (_) => dialog);
  }
}