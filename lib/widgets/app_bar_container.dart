import 'package:flutter/material.dart';
import 'package:tb_share_notes/constants/variables/string_constants.dart';
class AppBarContainer extends StatelessWidget {
  const AppBarContainer({
    Key? key,
    required this.height,
    required this.width,
    required this.image
  }) : super(key: key);
  final double height;
  final double width;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * .4,
      width: width,
      decoration: appBarBoxDecoration(image),
    );
  }
}
