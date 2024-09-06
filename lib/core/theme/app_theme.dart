import 'package:flutter/material.dart';
import 'package:softnet_school_portal/core/theme/app_colors.dart';
import 'package:softnet_school_portal/core/utils/fonts/app_fonts.dart';

enum AppTheme { darkTheme, lightTheme }

final Map<AppTheme, ThemeData> appThemesData = {
  AppTheme.lightTheme: ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    dividerColor: AppColors.dividerColor,
    textTheme: TextTheme(
      displayLarge: AppFonts.headline3,
      titleLarge: AppFonts.headline6,
      bodyLarge: AppFonts.bodyText1,
      bodyMedium: AppFonts.bodyText2,
      labelLarge: AppFonts.button,
    ),
    appBarTheme: const AppBarTheme(
      color: AppColors.primaryColor,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primaryColor,
      textTheme: ButtonTextTheme.normal,
    ),
  ),
  AppTheme.darkTheme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColorDark,
    scaffoldBackgroundColor: const Color(0xFF121212),
    dividerColor: const Color(0xFF424242),
    textTheme: TextTheme(
      displayLarge: AppFonts.headline3.copyWith(color: AppColors.whiteColor),
      titleLarge: AppFonts.headline6.copyWith(color: AppColors.whiteColor),
      bodyLarge: AppFonts.bodyText1.copyWith(color: AppColors.whiteColor),
      bodyMedium: AppFonts.bodyText2.copyWith(color: AppColors.lightGrey),
      labelLarge: AppFonts.button,
    ),
    appBarTheme: const AppBarTheme(
      color: AppColors.primaryColorDark,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primaryColorDark,
      textTheme: ButtonTextTheme.primary,
    ),
  )
};
