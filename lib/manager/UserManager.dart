import 'dart:convert';

import 'package:Nii/utils/ASharedPreferences.dart';

import '../entity/User.dart';

class UserManager {

  static User? user;

  static Future<User?> getUser() async {
    if (user == null) {
      String? localUser = await ASharedPreferences.getString("user");
      if (localUser != null && localUser.isNotEmpty) {
        try {
          user = jsonDecode(localUser);
        } catch (e) {
          user = null;
          logout();
        }
      }
    }
    return user;
  }

  static saveUser(User user) async {
    UserManager.user = user;
    await ASharedPreferences.setString("user", jsonEncode(user));
  }

  static Future<bool> isLogin() async {
    return (await getUser()) != null;
  }

  static Future logout() async {
    await ASharedPreferences.setString("user", "");
  }

}
