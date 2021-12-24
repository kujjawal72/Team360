

import 'package:flutter/material.dart';
import 'package:team360/touchbase/components/body.dart';

class TouchBaseDashboardScreen extends StatelessWidget {
  const TouchBaseDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Body(),
    );
  }
}