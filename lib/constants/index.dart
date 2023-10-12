import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const mainColor = Colors.indigo;
  static const String appBarTitle = 'Ortalama Hesaplama';
  static final TextStyle appBarTitleStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: mainColor);

  static const OutlineInputBorder textFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: mainColor, width: 2));

  static final TextStyle dersSayisiStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: mainColor);
  static final TextStyle ortalamaStyle = GoogleFonts.quicksand(
      fontSize: 50, fontWeight: FontWeight.w800, color: mainColor);
}
