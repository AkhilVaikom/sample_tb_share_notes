import 'package:flutter/material.dart';
import 'package:tb_share_notes/constants/variables/string_constants.dart';

//textField widgets
Widget commonTextField({required TextEditingController controller}) {
  return TextFormField(
    controller: controller,
    style: CommonTextStyle.contentStyle,
    decoration: const InputDecoration(
      focusedBorder: textBorderDecoration,
      enabledBorder: textBorderDecoration,
      hintText: "Title:",
      border: OutlineInputBorder(),
      // fillColor: Colors.redAccent,
    ),
  );
}

//card widgets
Widget commonCardWidgets(
    {required Size size,
    required FocusNode myFocusNode,
    required bool descTextFocus}) {
  return Card(
    elevation: 1,
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: Colors.white70, width: 1),
      borderRadius: BorderRadius.circular(20),
    ),
    margin: const EdgeInsets.all(20),
    child: SizedBox(
      height: size.height * .5,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                focusNode: myFocusNode,
                autofocus: descTextFocus,
                style: CommonTextStyle.contentStyle,
                decoration: const InputDecoration(border: InputBorder.none),
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
