
import 'package:flutter/material.dart';
import 'package:team360/home/components/body.dart';
import 'package:team360/util/my_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: null,
      backgroundColor: Colors.transparent,//MyColor.appBackgroundColor,
      body: Body()
    );
  }
}
