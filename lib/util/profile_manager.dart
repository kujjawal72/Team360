

import 'package:shared_preferences/shared_preferences.dart';
import 'package:team360/login/models.dart';

class ProfileManager{
  final String _userId = "userId";
  final String _name = "userName";
  final String _userPhoneNumber = "userPhoneNumber";
  final String _userRole = "userRole";
  final String _userAdminId = "userAdminId";

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> createProfile(ResponseList response) async{
    final pref = await _prefs;
    pref.setInt(_userId, response.userId);
    pref.setString(_name, response.name);
    pref.setString(_userPhoneNumber, response.phoneno);
    pref.setInt(_userRole, response.role);
    pref.setInt(_userAdminId, response.adminId);

  }
}