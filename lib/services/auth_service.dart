import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends ChangeNotifier {
  static late final SharedPreferences _prefs;

  // Ensure init is called before using AuthService
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> loginUser(String userName) async {
    try {
      await _prefs.setString('userName', userName);
    } catch (e) {
      print('Login Error: $e');
    }
  }

  Future<bool> isLoggedIn() async {
    return _prefs.containsKey('userName');
  }

  Future<String?> getUserName() async {
    return _prefs.getString('userName');
  }

  Future<void> logoutUser() async {
    await _prefs.remove('userName');
  }
}
