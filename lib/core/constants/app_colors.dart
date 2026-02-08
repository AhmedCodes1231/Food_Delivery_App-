import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFFF8A00); // Primary Orange
  static const Color primaryDark = Color(0xFFE67C00);
  static const Color primaryLight = Color(0xFFFFB259); // Softer Light Orange
  static const Color primaryExtraLight = Color(0xFFFFF1E6); // Background Tint

  static const Color secondary = Color(
    0xFF121223,
  ); // Darker Navy/Black for Auth Headers
  static const Color background = Color(0xFFFBFBFB); // Cleaner Off-white
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Color(0xFF8B8B8B); // Slightly darker grey for text
  static const Color lightGrey = Color(0xFFF2F2F2); // Lighter grey for inputs
  static const Color stroke = Color(0xFFEFEFEF); // Boundary lines

  static const Color error = Color(0xFFE53935);
  static const Color success = Color(0xFF00C566); // Vibrant Green

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, Color(0xFFFFAB40)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
