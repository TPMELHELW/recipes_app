import 'package:flutter/material.dart';
import 'package:recipes_app/utils/theme/widget_themes/appbar_theme.dart';
import 'package:recipes_app/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:recipes_app/utils/theme/widget_themes/text_field_theme.dart';
import 'package:recipes_app/utils/theme/widget_themes/text_theme.dart';
import '../constants/colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: AppColors.grey,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    textTheme: AppTextTheme.lightTextTheme,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: BarTheme.lightAppBarTheme,
    elevatedButtonTheme: EleButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: AppColors.grey,
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    textTheme: AppTextTheme.darkTextTheme,
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: BarTheme.darkAppBarTheme,
    elevatedButtonTheme: EleButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TextFormFieldTheme.darkInputDecorationTheme,
  );
}
