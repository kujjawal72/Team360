import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:team360/home/model/attendance_type_list_model.dart';
import 'package:team360/home/model/mark_attendance_request_model.dart';
import 'package:team360/home/viewmodel/home_viewmodel.dart';
import 'package:team360/util/my_colors.dart';
import 'package:team360/util/radio_group.dart';
import 'package:team360/util/utils.dart';

class AttendanceDialog {
  static Future<dynamic> show(BuildContext context, List<ResponseList> responseList) {
    Size size = MediaQuery.of(context).size;
    int typeId = 0;
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
              child: RadioGroup(
                data: responseList
                    .map((e) =>
                        RadioModel(e.attendanceTypeName, e.attendanceTypeId))
                    .toList(),
                s2v: (name, id) {
                  typeId = int.parse(id);
                  Fimber.i("changed typeId = $typeId");
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Fimber.i("pressed typeId = $typeId");
                if (typeId == 0) {
                  Fluttertoast.showToast(msg: "Please select an option");
                } else {
                  Provider.of<HomeViewModel>(context, listen: false)
                      .markAttendanceFunc(MarkAttendanceRequest(
                          attendanceTypeId: typeId,
                          salesmanId: 0,
                          attendanceDate: todayDate(),
                          attendanceTime: todayTime(),
                          lastUpdateId: 0));
                  Navigator.pop(context);
                }
              },
              child:
                  const Text("Give Attendance", style: TextStyle(fontSize: 15)),
              style: ElevatedButton.styleFrom(
                primary: MyColor.signInButton,
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 15,
    );

    return showDialog(context: context, builder: (_) => dialog);
  }
}
