import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalVariables {
  
// Colors
  static const myBackgroundColor = Color(0xFFe2e2e2);
}

//  App Style Text

TextStyle appStyle(
    {Color color = Colors.black87,
    required FontWeight fw,
    required double size}) {
  return GoogleFonts.poppins(color: color, fontSize: size, fontWeight: fw);
}

TextStyle appStyleWithHeight(
    {Color color = Colors.black87,
    required FontWeight fw,
    required double height,
    required double size}) {
  return GoogleFonts.poppins(
      color: color, fontSize: size, fontWeight: fw, height: height);
}

// For Custom Spacer

class CustomSpacer extends StatelessWidget {
  const CustomSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 16,
    );
  }
}
