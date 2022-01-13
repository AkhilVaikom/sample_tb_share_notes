// Sign Up onclick Function
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tb_share_notes/constants/string_constants.dart';
import 'package:tb_share_notes/constants/style_constants.dart';
import 'package:tb_share_notes/screens/home/home_screen.dart';
import 'package:tb_share_notes/utility/validator.dart';

void checkSignUp(BuildContext ctx, String _userName, String _eMail,
    String _password, String _confirmPassord) async {
  Map data = {
    'name': _userName,
    'email': _eMail,
    'password': _password,
    'confirm_password': _confirmPassord
  };
  String _msg;
  final sharedPreferences = await SharedPreferences.getInstance();
  if (_password == _confirmPassord) {
    //var jsonData;
    var response = await http.post(signupURL, body: data);
    if (response.statusCode == 200) {
     var jsonData = json.decode(response.body);
      _msg = jsonData['message'].toString();
      await sharedPreferences.setString('token', jsonData['data']['token']);
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(_msg),
          behavior: SnackBarBehavior.fixed,
        ),
      );
      Navigator.of(ctx).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) => const HomeScreen()),
          (Route<dynamic> route) => false);
    } else {
      ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(
          content: Text("Registration Failed"),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }

    // Navigator.pushReplacement(
    //   ctx,
    //   MaterialPageRoute(builder: (context) => const HomeScreen()),
    // );
  } else {
    ScaffoldMessenger.of(ctx).showSnackBar(
      const SnackBar(
        content: Text(
            "Password & Confirm Password did not match \nPlease try again..."),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

// username text field

TextFormField userNameTextField({required TextEditingController controller}) {
  return TextFormField(
    validator: validateUserName,
    controller: controller,
    keyboardType: TextInputType.text,
    decoration: const InputDecoration(
      focusedBorder: textBorderDecoration,
      enabledBorder: textBorderDecoration,
      border: OutlineInputBorder(),
      prefixIcon: Icon(Icons.person),
      hintText: "Username",
    ),
  );
}

// email text field
TextFormField emailTextField({required TextEditingController emailController}) {
  return TextFormField(
    autocorrect: true,
    validator: validateEmailAddress,
    style: contentStyle,
    controller: emailController,
    keyboardType: TextInputType.emailAddress,
    decoration: const InputDecoration(
      focusedBorder: textBorderDecoration,
      enabledBorder: textBorderDecoration,
      border: OutlineInputBorder(),
      prefixIcon: Icon(Icons.email),
      hintText: "Email",
    ),
  );
}
