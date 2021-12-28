import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tb_share_notes/constants/string_constants.dart';
import 'package:tb_share_notes/screens/home/home_screen.dart';
import 'package:tb_share_notes/screens/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: []);
    super.initState();
    _navigatePage();
  }

  _navigatePage() async {
    await Future.delayed(const Duration(milliseconds: 3500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(splashImage),
            //fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
