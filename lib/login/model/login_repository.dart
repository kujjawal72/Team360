

import 'package:team360/login/model/base_login_service.dart';
import 'package:team360/login/model/login_service.dart';
import 'package:team360/login/model/models.dart';

class LoginRepository {
  final BaseLoginService _loginService = LoginService();

  Future<LoginResponse> doLogin(LoginRequestModel request) async {
    dynamic response = await _loginService.doLogin(request);

    return LoginResponse.fromJson(response);
  }
}
