import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team360/login/components/body.dart';
import 'package:team360/login/model/models.dart';
import 'package:team360/login/viewmodel/login_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Body(onLogin: (username,password) {
        Provider.of<LoginViewModel>(context,listen: false).doLogin(LoginRequestModel(phoneno: username, password: password));
      },),
    );
  }
}
