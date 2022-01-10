

import 'package:shared_preferences/shared_preferences.dart';
import 'package:team360/login/model/models.dart';

class ProfileManager{
  static const String _userId = "userId";
  static const String _name = "userName";
  static const String _userPhoneNumber = "userPhoneNumber";
  static const String _userRole = "userRole";
  static const String _userAdminId = "userAdminId";

  static final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Future<void> createProfile(ResponseList response) async{
    final pref = await _prefs;
    pref.setInt(_userId, response.userId);
    pref.setString(_name, response.name);
    pref.setString(_userPhoneNumber, response.phoneno);
    pref.setInt(_userRole, response.role);
    pref.setInt(_userAdminId, response.adminId);

  }

  static Future<String> getName() async{
    final pref = await _prefs;
    return pref.getString(_name)??"";
  }

  static Future<int> getUserId() async{
    final pref = await _prefs;
    return pref.getInt(_userId)??0;
  }

  static Future<bool> logout() async{
    final pref = await _prefs;
    return pref.clear();
  }
}