
import 'package:flutter/material.dart';

String appBarImage = "assets/images/appbar.png";
String shareNoteImage = "assets/images/shareNotes.png";
String splashImage = "assets/images/TechBlaze_logo.png";
String appName = "Share Notes";

var loginURL = Uri.parse("https://tb-share-note.herokuapp.com/api/login");
var signupURL = Uri.parse("https://tb-share-note.herokuapp.com/api/register");

IconData passwordVisibility = Icons.visibility;
IconData passwordVisibilityOff = Icons.visibility_off;
enum obscureText{
  password,
  confirmPassword
}