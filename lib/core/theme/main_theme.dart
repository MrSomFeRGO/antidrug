import 'package:antidrugs/gen/colors.gen.dart';
import 'package:antidrugs/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

final mainTheme = ThemeData(
  fontFamily: FontFamily.openSans,
  textTheme: TextTheme(
    labelMedium: const TextStyle(
      fontFamily: FontFamily.openSans,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    labelSmall: const TextStyle(
      fontFamily: FontFamily.openSans,
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.white,
    ),
    labelLarge: const TextStyle(
      fontFamily: FontFamily.openSans,
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: Colors.white,
    ),
    titleSmall: const TextStyle(
      fontFamily: FontFamily.openSans,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Colors.black,
    ),
    titleMedium: const TextStyle(
      fontFamily: FontFamily.openSans,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: ColorName.black,
    ),
    titleLarge: const TextStyle(
      fontFamily: FontFamily.openSans,
      fontWeight: FontWeight.w700,
      fontSize: 16,
      color: ColorName.black,
    ),
    displayMedium: TextStyle(
      fontFamily: FontFamily.openSans,
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: ColorName.blue.withOpacity(0.75),
    ),
    bodySmall: TextStyle(
      fontFamily: FontFamily.openSans,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: const Color(0xff333333).withOpacity(0.7),
    ),
    bodyMedium: const TextStyle(
      fontFamily: FontFamily.openSans,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: ColorName.black,
    ),
    bodyLarge: const TextStyle(
      fontFamily: FontFamily.openSans,
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: ColorName.black,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorName.blue.withOpacity(0.5), width: 2.0),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorName.blue.withOpacity(0.5), width: 2.0),
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding:
          const EdgeInsets.only(left: 20.0, bottom: 20.0, top: 20.0),
      hintStyle: TextStyle(
        fontFamily: FontFamily.openSans,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: ColorName.black.withOpacity(0.75),
      )),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll(ColorName.blue.withOpacity(0.6)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ))),
  ),
  checkboxTheme: const CheckboxThemeData(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)))),
  appBarTheme: AppBarTheme(
    color: ColorName.blue.shade50,
    centerTitle: true,
    titleTextStyle: const TextStyle(
      fontFamily: FontFamily.openSans,
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: ColorName.black,
    ),
    shadowColor: Colors.transparent,
  ),
  scrollbarTheme: ScrollbarThemeData(
    thickness: MaterialStateProperty.all(10),
    radius: const Radius.circular(10),
  ),
);
