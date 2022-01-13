import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    checkUserLoggedIn();
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: []);
    super.initState();
   
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

  Future<void> checkUserLoggedIn() async{
    
    final _sharedPreferences = await SharedPreferences.getInstance();
    final _userLoggedIn= _sharedPreferences.getString('token');
    final name = _sharedPreferences.getString('name');
    if(_userLoggedIn==null || _userLoggedIn == false){
       _navigatePage();
    }else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomeScreen(user: name.toString(),)));
    }
  }
}
