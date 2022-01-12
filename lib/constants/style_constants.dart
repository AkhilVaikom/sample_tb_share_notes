
import 'package:flutter/material.dart';
import 'package:tb_share_notes/constants/my_material_color.dart';

const headStyle = TextStyle(fontSize: 42, fontWeight: FontWeight.bold,color: myTeal);
const buttonText = TextStyle(fontSize: 24, fontWeight: FontWeight.w700);
appBarBoxDecoration(String image) => BoxDecoration(
      image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
    );
const subHeadStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.w400);
const contentStyle = TextStyle(fontSize: 18);
var buttonShape = MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));