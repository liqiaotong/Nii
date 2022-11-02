import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../common/AColors.dart';
import '../utils/PageRouter.dart';
import '../widget/CommonView.dart';
import 'Register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: loginView(context));
  }

  Widget loginView(BuildContext context) {
    return CommonView.scrollView(Padding(
        padding: EdgeInsets.only(left: 30, right: 30, top: MediaQuery.of(context).padding.top),
        child: Column(children: [
          Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonView.text("Log in", 30, Colors.black, fontWeight: FontWeight.bold),
                  const SizedBox(height: 30),
                  CommonView.text("hello,friend! login and manager you device.", 15, AColors.c7d8184),
                  const SizedBox(height: 25),
                  CommonView.input(hintText: "Email", maxLength: 30, controller: emailController),
                  const SizedBox(height: 20),
                  CommonView.input(hintText: "Password", obscureText: true, maxLength: 30, controller: passwordController),
                  const SizedBox(height: 35),
                  CommonView.button("Let's start!", () {
                    _login();
                  })
                ],
              )),
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: const [
                    Image(width: 50, height: 50, fit: BoxFit.cover, image: AssetImage("images/nii_logo_100.png")),
                    SizedBox(width: 20),
                    Image(width: 50, height: 50, fit: BoxFit.cover, image: AssetImage("images/nii_logo_100.png"))
                  ]),
                  const SizedBox(height: 20),
                  RichText(
                      text: TextSpan(text: "Don't have an account?", style: const TextStyle(color: Colors.black, fontSize: 15), children: <TextSpan>[
                    TextSpan(
                        text: " Sign up ",
                        style: TextStyle(color: AColors.c487d6b, fontWeight: FontWeight.bold, fontSize: 15, decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _register();
                          })
                  ]))
                ],
              ))
        ])));
  }

  void _login() {
    print("${emailController.text}  ${passwordController.text}");
  }

  void _register() {
    Navigator.of(context!).push(PageRouter.createRoute(const Register()));
  }
}
