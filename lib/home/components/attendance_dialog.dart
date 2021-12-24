import 'package:flutter/material.dart';
import 'package:team360/util/radio_group.dart';

class AttendanceDialog {
  static void show(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final dialog = Dialog(
      insetPadding: const EdgeInsets.all(10),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.6,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color(0x99000000)),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(10)),
            Image.asset(
              "assets/icons/calendar.png",
              width: size.width * 0.17,
              height: size.height * 0.17,
            ),
            const Text(
              "Attendance",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  letterSpacing: 2),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RadioGroup(data: [
                RadioModel("Market Working", 0),
                RadioModel("Leave", 1),
                RadioModel("Work From Home", 2)
              ]),
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
