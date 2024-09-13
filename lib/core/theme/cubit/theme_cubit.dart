import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnet_school_portal/core/locator/locator.dart';
import 'package:softnet_school_portal/core/theme/app_theme.dart';
import 'package:softnet_school_portal/core/utils/services/storage_service.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final StorageService _storageService = locator<StorageService>();
  ThemeCubit() : super(ThemeState());

  void toggoleTheme(AppTheme appTheme) async {
    emit(ThemeState(theme: appThemesData[appTheme]!));
    _storageService.setData('theme', appTheme.toString());
  }

  Future<void> _loadTheme() async {
    final themeString = _storageService.getData('theme');
    final appTheme = AppTheme.values.firstWhere(
      (e) => e.toString() == themeString,
      orElse: () => AppTheme.darkTheme,
    );
    emit(ThemeState(theme: appThemesData[appTheme]!));
  }

  setInitialTheme() async {
    return await _loadTheme();
  }
}
