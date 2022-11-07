import 'package:flutter/material.dart';

import '../../utils/PageRouter.dart';
import '../../widget/CommonView.dart';
import '../base/BaseViewModel.dart';
import '../page/Home.dart';

class LoginModel extends BaseViewModel {

  @override
  void init() {}

  @override
  void destroy() {}

  void login(String? email, String? password) {
    // if (email == null || email.isEmpty) {
    //   CommonView.toast("邮箱不能为空");
    //   return;
    // }
    // if (password == null || password.isEmpty) {
    //   CommonView.toast("密码不能为空");
    //   return;
    // }
    Navigator.of(context!).push(PageRouter.createRoute(Home()));
  }
}
