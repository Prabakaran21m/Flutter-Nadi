import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLine;
  final EdgeInsets? margin, padding;
  final Decoration? decoration;
  final Function()? onClick;

  final Alignment? alignment;

  AppText(this.text,
      {this.style,
      this.textAlign,
      this.maxLine,
      this.margin,
      this.padding,
      this.decoration,
      this.onClick,
      this.alignment});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
          decoration: decoration,
          padding: padding,
          margin: margin,
          alignment: alignment,
          child: Text(
            text,
            style: style,
            textAlign: textAlign,
            maxLines: maxLine,
          )),
    );
  }
}
