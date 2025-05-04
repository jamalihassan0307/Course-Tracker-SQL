import 'package:flutter/material.dart';

class AppColors {
  // Primary colors
  static const primary = Color(0xFF4A00E0);
  static const primaryLight = Color(0xFF8E2DE2);
  static const primaryDark = Color(0xFF3700B3);
  
  // Secondary colors
  static const accent = Color(0xFFFF4E98);
  static const accentLight = Color(0xFFFF85B9);

  // Background colors
  static const background = Color(0xFFF8F9FC);
  static const cardColor = Color(0xFFFFFFFF);
  static const scaffoldBackgroundColor = Color(0xFFF8F9FC);
  
  // Text colors
  static const textDark = Color(0xFF1A1A1A);
  static const textMedium = Color(0xFF4D4D4D);
  static const textLight = Color(0xFF8A8A8A);
  
  // Status colors
  static const success = Color(0xFF4CAF50);
  static const warning = Color(0xFFFFC107);
  static const error = Color(0xFFE53935);
  static const info = Color(0xFF2196F3);
  
  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryLight, primary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient accentGradient = LinearGradient(
    colors: [accent, accentLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
