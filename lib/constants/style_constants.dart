import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const headStyle = TextStyle(fontSize: 42, fontWeight: FontWeight.bold);
const buttonText = TextStyle(fontSize: 24, fontWeight: FontWeight.w700);
appBarBoxDecoration(String image) => BoxDecoration(
      image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
    );
const subHeadStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.w400);
const contentStyle = TextStyle(fontSize: 24);