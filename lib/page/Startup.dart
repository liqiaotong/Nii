import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nii/module/UserManager.dart';
import 'package:nii/page/Login.dart';
import 'package:nii/page/Register.dart';
import 'package:nii/utils/PageRouter.dart';
import 'package:nii/widget/CommonView.dart';
import '../common/Config.dart';
import 'Home.dart';

class Startup extends StatefulWidget {
  const Startup({super.key});

  @override
  State<StatefulWidget> createState() => _StartupState();
}

class _StartupState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: startupView(context));
  }

  @override
  void initState() {
    super.initState();
    _startup();
  }

  Widget startupView(BuildContext context) {
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
          Navigator.of(context!).pushAndRemoveUntil(PageRouter.createRoute(const Home()), (route) => false);
        } else {
          Navigator.of(context!).pushAndRemoveUntil(PageRouter.createRoute(const Login()), (route) => false);
        }
      } else {
        Navigator.of(context!).pushAndRemoveUntil(PageRouter.createRoute(const Home()), (route) => false);
      }
    }
    Future.delayed(Duration(seconds: Config.startupTime), () {
      timeout();
    });
  }
}
