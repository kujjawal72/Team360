import 'package:flutter/material.dart';
import 'package:team360/util/my_colors.dart';

class CheckoutFeedbackDialog {
  static void show(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final dialog = Dialog(
      insetPadding: const EdgeInsets.all(10),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.7,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: MyColor.touchbaseDetailsPageColor),
        child: ListView(
          children: [
            const Padding(padding: EdgeInsets.all(10)),
            const Text(
              "All the tasks are not completed. please provide reason:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 5, right: 5),
              child: TextFormField(
                minLines: 10,
                maxLines: 15,
                style: TextStyle(fontSize: 20),
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  hintText: "Note down the reason........",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(14),
              margin: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: size.width * 0.1,
                  right: size.width * 0.1),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Color(0xFF3c3c3c),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2.0,
                        color: Colors.white,
                        offset: Offset(2.0, 2.0))
                  ]),
              child: const Text(
                "Submit",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 15,
    );

    showDialog(context: context, builder: (_) => dialog);
  }
}
