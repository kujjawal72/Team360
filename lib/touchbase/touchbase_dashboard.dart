

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team360/home/components/backgound.dart';
import 'package:team360/home/viewmodel/home_viewmodel.dart';
import 'package:team360/touchbase/components/body.dart';

class TouchBaseDashboardScreen extends StatelessWidget {
  const TouchBaseDashboardScreen({Key? key, required this.retailerId}) : super(key: key);
  final int retailerId;

  @override
  Widget build(BuildContext context) {
    Fimber.i("$retailerId --retID");
    return ChangeNotifierProvider<HomeViewModel>(
      create: (_)=>HomeViewModel(),
      child: Background(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Body(retailerId: retailerId,),
          appBar: AppBar(
            title: const Text("Touchbase"),
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),onPressed: (){
              Navigator.pop(context);
            }
            ),backgroundColor: Colors.transparent,elevation: 0,
          ),
        ),
      ),
    );
  }
}