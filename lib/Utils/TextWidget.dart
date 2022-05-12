import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  TextWidget(this.text, {this.fontSize, this.bold = false});
  String text;
  double fontSize;
  bool bold;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      style: GoogleFonts.oxygen(
          fontSize: fontSize,
          fontWeight: this.bold ? FontWeight.w700 : FontWeight.w100),
    );
  }
}

// Text(
//                     "Welcome Back",
//                     softWrap: true,
//                     style: GoogleFonts.oxygen(
//                         fontSize: 30, fontWeight: FontWeight.w700),
//                   ),