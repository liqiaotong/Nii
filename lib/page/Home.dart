import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: loginView(),
      ),
    );
  }

  Widget loginView(){
    return const Text("home page");
  }

}