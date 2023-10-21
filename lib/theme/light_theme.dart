import 'package:flutter/material.dart';
import 'package:managerapp/theme/app_theme.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: AppTheme.colorPrimaryTheme,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: AppBarTheme(
    color: AppTheme.colorPrimaryTheme,
    elevation: 0,
    toolbarTextStyle: const TextTheme(
      titleLarge: TextStyle(
        color: AppTheme.colorWhite,
        fontSize: 20,
      ),
    ).bodyMedium,
    titleTextStyle: const TextTheme(
      titleLarge: TextStyle(
        color: AppTheme.colorWhite,
        fontSize: 20,
      ),
    ).titleLarge,
  ),
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: AppTheme.colorAccentTheme),
);
