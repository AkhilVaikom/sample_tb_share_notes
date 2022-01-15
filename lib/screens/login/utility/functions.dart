import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:tb_share_notes/constants/route/route.dart';
import 'package:tb_share_notes/constants/utility/validator.dart';
import 'package:tb_share_notes/constants/variables/string_constants.dart';



// Login Button Function
void login({required BuildContext context, required String email, required String password, required bool loading}) async {
    Map data = {'email': email, 'password': password};
    final sharedPreferences = await SharedPreferences.getInstance();
   // var jsonData;
    var response = await http.post(loginURL, body: data);
    if (response.statusCode == 200) {
     var jsonData = json.decode(response.body.toString());
     var userName = jsonData['data']['name'].toString();
     await sharedPreferences.setString('token', jsonData['data']['token']);
     print(userName);
     await sharedPreferences.setString('name', userName);
     Navigator.of(context).pushReplacementNamed(AppRouter.home, arguments: {'userName': userName});
      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(
      //         builder: (BuildContext context) => const HomeScreen()),
      //     (Route<dynamic> route) => false);
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
  TextFormField emailTextField({required TextEditingController emailController}) {
    return TextFormField(
      autocorrect: true,
      validator: validateEmailAddress,
      style: CommonTextStyle.contentStyle,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration:  const InputDecoration(
         focusedBorder:  textBorderDecoration,
            enabledBorder:  textBorderDecoration,
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.email),
        hintText: "Email",
      ),
    );
  }
