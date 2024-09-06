import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:softnet_school_portal/core/theme/app_colors.dart';

class AppFonts {
  static final TextStyle headline3 = GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static final TextStyle headline6 = GoogleFonts.poppins(
    fontSize: 23,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static final TextStyle bodyText1 = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  static final TextStyle bodyText2 = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );

  static final TextStyle button = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
