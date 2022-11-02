import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../entity/User.dart';

class UserManager {

  static User? user;

  static Future<User?> getUser() async {
    if (user == null) {
      String? localUser =
          (await SharedPreferences.getInstance()).getString("user");
      if (localUser != null) {
        user = jsonDecode(localUser);
      }
    }
    return user;
  }

  static saveUser(User user) async {
    UserManager.user = user;
    (await SharedPreferences.getInstance()).setString("user", jsonEncode(user));
  }

  static Future<bool> isLogin() async {
    return (await getUser()) != null;
  }

}
