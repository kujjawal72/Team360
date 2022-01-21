import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team360/login/components/body.dart';
import 'package:team360/login/model/models.dart';
import 'package:team360/login/viewmodel/login_viewmodel.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (_)=>LoginViewModel(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Body(),
      ),
    );
  }
}
