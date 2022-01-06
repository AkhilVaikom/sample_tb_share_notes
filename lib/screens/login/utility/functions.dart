import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:tb_share_notes/constants/string_constants.dart';
import 'package:tb_share_notes/constants/style_constants.dart';
import 'package:tb_share_notes/screens/home/home_screen.dart';
import 'package:tb_share_notes/utility/validator.dart';




// Login Button 
void login(BuildContext context, String email, String password) async {
    Map data = {'email': email, 'password': password};
    final sharedPreferences = await SharedPreferences.getInstance();
    var jsonData;
    var response = await http.post(loginURL, body: data);
    if (response.statusCode == 200) {
      jsonData = json.decode(response.body.toString());
     await sharedPreferences.setString('token', jsonData['data']['token']);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) => const HomeScreen()),
          (Route<dynamic> route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login Failed"),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  
  // Email Text field
  TextFormField emailTextField(TextEditingController emailController) {
    return TextFormField(
      autocorrect: true,
      validator: validateEmailAddress,
      style: contentStyle,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.email),
        hintText: "Email",
      ),
    );
  }
