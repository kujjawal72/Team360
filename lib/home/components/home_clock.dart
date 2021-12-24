

import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';

import '../../util/my_colors.dart';

class MyClock extends StatelessWidget {
  final double width;
  final double height;
  const MyClock({Key? key,required this.width,required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterAnalogClock(
      dateTime: DateTime.now(),
      dialPlateColor: MyColor.watchPlateColor,
      hourHandColor: Colors.black,
      minuteHandColor: Colors.black,
      secondHandColor: Colors.black,
      numberColor: Colors.black,
      borderColor: MyColor.watchPlateColor,
      tickColor: Colors.black,
      centerPointColor: MyColor.watchCenterButtonColor,
      showBorder: true,
      showTicks: false,
      showMinuteHand: true,
      showSecondHand: true,
      showNumber: true,
      borderWidth: 5,
      hourNumberScale: .90,
      hourNumbers: const ['', '', '3', '', '', '6', '', '', '9', '', '', '12'],
      isLive: true,
      width: width,
      height: height,
      decoration: const BoxDecoration(),
      child: null,
    );
  }
}
