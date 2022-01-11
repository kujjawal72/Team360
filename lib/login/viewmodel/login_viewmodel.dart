

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:team360/base/response.dart';
import 'package:team360/login/model/login_repository.dart';
import 'package:team360/login/model/models.dart';

class LoginViewModel with ChangeNotifier{
  Response _loginResponse = Response.initial("");
  final repo = LoginRepository();


  Response get loginResponse => _loginResponse;

  /// Call the media service and gets the data of requested media data of
  /// an artist.
  Future<void> doLogin(LoginRequestModel request) async {
    _loginResponse = Response.loading("Signing");
    notifyListeners();
    try {
      LoginResponse response = await repo.doLogin(request);
      _loginResponse = Response.completed(response);
    } catch (e,stacktrace) {
      _loginResponse = Response.error(e.toString());
      Fimber.i("Login Failed",ex: e,stacktrace: stacktrace);
    }
    notifyListeners();
  }
  @override
  void dispose() {
    _loginResponse = Response.initial("Disposing");
    super.dispose();
  }

}