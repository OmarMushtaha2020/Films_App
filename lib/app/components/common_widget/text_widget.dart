import 'dart:ui';

import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  String? title;
  double? fontSize;
  Color? color;
  FontWeight? fontWeight;

  TextWidget(
      {required String this.title,
        required double this.fontSize,
        required Color this.color,
        required FontWeight this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? "",

      style: TextStyle(

        fontSize: fontSize,
        color: color,

        fontWeight: fontWeight,
      ),
    );
  }
}
