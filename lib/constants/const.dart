import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  Color black = Colors.black;
  Color green = Colors.green;
  Color boldGreen = const Color.fromARGB(255, 6, 110, 9);
  Color grey = Colors.grey;
  Color scaffold = const Color.fromARGB(255, 242, 232, 232);
  Text textMethod(
      String data, double fontSize, FontWeight fontWeight, Color color) {
    return Text(
      data,
      style: GoogleFonts.italiana(
          fontSize: fontSize, fontWeight: fontWeight, color: color),
    );
  }
}
