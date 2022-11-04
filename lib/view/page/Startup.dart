import 'dart:async';

import 'package:Nii/view/base/BaseView.dart';
import 'package:flutter/material.dart';
import '../../common/Config.dart';
import '../../manager/UserManager.dart';
import '../../utils/PageRouter.dart';
import '../../widget/CommonView.dart';
import 'Home.dart';
import 'Login.dart';

class Startup extends BaseView {

  Startup({super.key});

  @override
  void init(BuildContext context) {
    _startup();
  }

  @override
  Widget buildWidget(BuildContext context) => startupView();


  Widget startupView() {
    return Center(
        child: Stack(children: [
          Align(
              child: FractionallySizedBox(
                  heightFactor: 0.5,
                  child: Column(children: [
                    const Image(width: 100, height: 100, fit: BoxFit.cover, image: AssetImage("images/nii_logo_100.png")),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonView.text("Nii", 18, Colors.black, fontWeight: FontWeight.bold)
                  ]))),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(padding: const EdgeInsets.only(bottom: 20), child: CommonView.text("© Copyright 2022 Nii", 12, Colors.black87)))
        ]));
  }

  Future<void> _startup() async {
    Future<void> timeout() async {
      if (Config.isNeedLogin) {
        if (await UserManager.isLogin()) {
          Navigator.of(context!).pushAndRemoveUntil(PageRouter.createRoute(Home()), (route) => false);
        } else {
          Navigator.of(context!).pushAndRemoveUntil(PageRouter.createRoute(Login()), (route) => false);
        }
      } else {
        Navigator.of(context!).pushAndRemoveUntil(PageRouter.createRoute(Home()), (route) => false);
      }
    }
    Future.delayed(Duration(seconds: Config.startupTime), () {
      timeout();
    });
  }

}


