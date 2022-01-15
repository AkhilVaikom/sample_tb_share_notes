import 'package:flutter/material.dart';
import 'package:tb_share_notes/constants/color/my_material_color.dart';

String appName = "Share Notes";

// URL
var loginURL = Uri.parse("https://tb-share-note.herokuapp.com/api/login");
var signupURL = Uri.parse("https://tb-share-note.herokuapp.com/api/register");

// Decoration
var buttonShape = MaterialStateProperty.all(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));
const textBorderDecoration = OutlineInputBorder(
  borderSide: BorderSide(color: myTeal, width: 2.0),
);
appBarBoxDecoration(String image) => BoxDecoration(
      image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
    );

// Icons

IconData passwordVisibility = Icons.visibility;
IconData passwordVisibilityOff = Icons.visibility_off;

// Enum
enum obscureText { password, confirmPassword }

class ImageName {
  static const String appBarImage = "assets/images/appbar.png";
  static const String shareNoteImage = "assets/images/shareNotes.png";
  static const String tbLogo = "assets/images/TechBlaze_logo.png";
  static const String splashImage = "assets/images/img3.png";
}

class CommonTextStyle {
  static const headStyle =
      TextStyle(fontSize: 42, fontWeight: FontWeight.bold, color: myTeal);
  static const buttonText =
      TextStyle(fontSize: 24, fontWeight: FontWeight.w700);
  static const subHeadStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w400);
  static const contentStyle = TextStyle(fontSize: 18);
}
