// Sign Up onclick Function
import 'package:flutter/material.dart';
import 'package:tb_share_notes/constants/style_constants.dart';
import 'package:tb_share_notes/screens/home/home_screen.dart';
import 'package:tb_share_notes/utility/validator.dart';

void checkSignUp(BuildContext ctx, String _userName, String _eMail,
    String _password, String _confirmPassord) {
  if (_password == _confirmPassord) {
    Navigator.pushReplacement(
      ctx,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
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

TextFormField userNameTextField(TextEditingController controller) {
  return TextFormField(
    validator: validateUserName,
    controller: controller,
    keyboardType: TextInputType.text,
    decoration: const InputDecoration(
      border: OutlineInputBorder(),
      prefixIcon: Icon(Icons.person),
      hintText: "Username",
    ),
  );
}

// email text field
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
