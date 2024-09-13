import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:softnet_school_portal/core/theme/app_colors.dart';
import 'package:softnet_school_portal/core/utils/fonts/app_fonts.dart';

enum AppTheme { darkTheme, lightTheme }

final Map<AppTheme, ThemeData> appThemesData = {
  AppTheme.lightTheme: ThemeData.light(useMaterial3: true).copyWith(
    primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.bgLight,
    dividerColor: AppColors.dividerColor,
      canvasColor: AppColors.secondaryLight,
    textTheme: TextTheme(
      displayLarge: AppFonts.headline3,
      titleLarge: AppFonts.headline6,
      bodyLarge: AppFonts.bodyText1,
      bodyMedium: AppFonts.bodyText2,
      labelLarge: AppFonts.button,
    ),
  
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.all(12),
        filled: true,
        fillColor: Color(0xFFD9D9D9),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorColor),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      )),
  AppTheme.darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
    primaryColor: AppColors.primaryColorDark,
      scaffoldBackgroundColor: AppColors.bgDark,
      canvasColor: AppColors.secondaryDark,
    dividerColor: const Color(0xFF424242),
    textTheme: TextTheme(
      displayLarge: AppFonts.headline3.copyWith(color: AppColors.whiteColor),
      titleLarge: AppFonts.headline6.copyWith(color: AppColors.whiteColor),
      bodyLarge: AppFonts.bodyText1.copyWith(color: AppColors.whiteColor),
      bodyMedium: AppFonts.bodyText2.copyWith(color: AppColors.lightGrey),
      labelLarge: AppFonts.button,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.all(12),
        filled: true,
        fillColor: Color(0xFF424242),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorColor),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      )
  )
};
