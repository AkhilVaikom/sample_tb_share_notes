import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

var loginURL = Uri.parse("https://tb-share-note.herokuapp.com/api/login");

void login(BuildContext context, String email, String password) async {
  Map data = {'email': email, 'password': password};
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance(); 
  var jsonData=null;
  var response = await http.post(loginURL,body: data);
  if(response.statusCode==200){
    jsonData=json.decode(response.body);
  }
}
