import 'package:barber/src/core/ui/helpers/colors_constants.dart';
import 'package:barber/src/core/ui/helpers/fonts_constants.dart';
import 'package:flutter/material.dart';

sealed class BabershopTheme {
  static const _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
    borderSide: BorderSide(
      color: ColorsConstants.gray,
    ),
  );

  static ThemeData themeData = ThemeData(
    fontFamily: FontsConstants.fontFamily,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: ColorsConstants.brow,
        ),
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          fontFamily: FontsConstants.fontFamily,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        )),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      labelStyle: const TextStyle(
        color: ColorsConstants.gray,
      ),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      errorBorder: _defaultInputBorder.copyWith(
        borderSide: const BorderSide(
          color: ColorsConstants.red,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsConstants.brow,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: ColorsConstants.brow, width: 1),
        foregroundColor: ColorsConstants.brow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}
