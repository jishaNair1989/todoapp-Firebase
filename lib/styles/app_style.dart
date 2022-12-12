import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  // ===>>> COLORS
  static const Color redColor = Color(0xFFD32F2F);
  static const Color homeColor = Color(0x00000000);
  static final Color greenColor = Colors.green.shade800;
  static List<Color> cardColor = [
    Colors.white,
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.blueGrey.shade100,
  ];

  // ===>>> HEIGHT SPACES
  static const appHeight_5 = SizedBox(height: 5.0);
  static const appHeight_10 = SizedBox(height: 10.0);
  static const appHeight_30 = SizedBox(height: 30.0);

  // ===>>> WIDTH SPACES
  static const appWidth_10 = SizedBox(width: 10.0);

  // ===>>> TEXT STYLES
  static TextStyle appTitleStyle = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
  );

  static TextStyle mainTitleStyle = GoogleFonts.roboto(
    color: Colors.black,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );

  static TextStyle contentStyle = GoogleFonts.nunito(
    fontSize: 18.0,
    fontWeight: FontWeight.normal,
  );

  static TextStyle dateTitleStyle = GoogleFonts.roboto(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );
}
