import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../common/AColors.dart';
import '../../widget/CommonView.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterState();
}

class _RegisterState extends State {
  TextEditingController nameController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: registerView(context));
  }

  Widget registerView(BuildContext context) {
    double stateBarHeight = MediaQuery.of(context).padding.top + 55;

    return Stack(children: [
      CommonView.scrollView(Container(
        padding: EdgeInsets.only(top: stateBarHeight, bottom: stateBarHeight, left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonView.text("Sign up for Nii", 25, Colors.black, fontWeight: FontWeight.bold),
            const SizedBox(height: 25),
            CommonView.text(
                "learn from the best courses using perfect practice orientation,auto evaluation anget skilled,Happy Learning "
                "ahead!",
                15,
                AColors.ca7a7a7),
            const SizedBox(height: 30),
            CommonView.input(hintText: "Name", maxLength: 30, controller: nameController),
            const SizedBox(height: 20),
            CommonView.input(hintText: "Email", maxLength: 30, controller: emailController),
            // const SizedBox(height: 20),
            // CommonView.input(hintText: "Mobile Number", maxLength: 30, controller: phoneController),
            const SizedBox(height: 20),
            CommonView.input(hintText: "Password", obscureText: true, maxLength: 30, controller: passwordController),
            const SizedBox(height: 20),
            CommonView.input(hintText: "Re-type Password", obscureText: true, maxLength: 30, controller: rePasswordController),
            const SizedBox(height: 35),
            CommonView.button("Register", () {
              _register();
            }),
            const SizedBox(height: 35),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(text: "Already have an account?", style: const TextStyle(color: Colors.black, fontSize: 15), children: <TextSpan>[
                  TextSpan(
                      text: " Log in ",
                      style: TextStyle(color: AColors.c487d6b, fontWeight: FontWeight.bold, fontSize: 15, decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          _turnToLogin();
                        })
                ]))
          ],
        ),
      )),
      Align(
          alignment: Alignment.topLeft,
          child: CommonView.title(context, backFunction: () {
            _turnToLogin();
          }))
    ]);
  }

  void _register() {
    print("Name:${nameController.text}  Email:${emailController.text}  Password:${passwordController.text}  "
        "Re Password:${rePasswordController.text}");
  }


  void _turnToLogin() {
    Navigator.of(context).pop();
  }
}
