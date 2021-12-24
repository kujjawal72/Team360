

import 'package:flutter/material.dart';
import 'package:team360/util/my_colors.dart';

class Background extends StatelessWidget {

  final Widget child;

  const Background({Key? key,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColor.appBackgroundColor,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(child: Image(image: Image.asset("assets/images/home_top.png").image),top: 0,left: 0),
          child
        ],
      ),
    );
  }
}
