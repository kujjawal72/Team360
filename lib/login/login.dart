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

  late LoginViewModel _loginViewModel;

  @override
  void initState() {
    _loginViewModel = Provider.of<LoginViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Body(
        onLogin: (username, password) {
          _loginViewModel.doLogin(
              LoginRequestModel(phoneno: username, password: password));
        },
      ),
    );
  }
}
