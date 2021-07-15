import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HebrTheme {
  static ThemeData lightTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      textSelectionTheme:
          base.textSelectionTheme.copyWith(cursorColor: Colors.teal),
      colorScheme: base.colorScheme.copyWith(
        primary: Colors.white70,
        primaryVariant: Colors.white60,
        secondary: Colors.white,
        secondaryVariant: Colors.white70,
        onPrimary: Colors.black87,
        onSecondary: Colors.black,
        error: base.errorColor,
        onError: Colors.white,
        background: Colors.white10,
        onBackground: Colors.black,
        surface: Colors.white,
        onSurface: Colors.black,
        brightness: Brightness.light,
      ),
      bottomNavigationBarTheme: base.bottomNavigationBarTheme.copyWith(
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedIconTheme: base.iconTheme.copyWith(color: Colors.black54),
        selectedIconTheme: base.iconTheme.copyWith(color: Colors.black),
      ),
      appBarTheme: base.appBarTheme.copyWith(
        backwardsCompatibility: false,
        backgroundColor: Colors.white,
      ),
      iconTheme: base.iconTheme.copyWith(opacity: 0.5),
      textTheme: _buildShrineTextTheme(base.textTheme),
      inputDecorationTheme: base.inputDecorationTheme.copyWith(
        labelStyle: base.textTheme.caption,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.teal),
        ),
      ),
    );
  }

  static TextTheme _buildShrineTextTheme(TextTheme base) {
    return base
        .copyWith(
          headline5: base.headline5!.copyWith(
            fontWeight: FontWeight.w500,
          ),
          headline6: base.headline6!.copyWith(
            fontSize: 18.0,
          ),
          caption: base.caption!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
          bodyText1: base.bodyText1!.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
          bodyText2: base.bodyText2!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
          ),
        )
        .apply(
          fontFamily: GoogleFonts.cairo().fontFamily,
        );
  }

  static ThemeData darkTheme() {
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        primary: Colors.black87,
        primaryVariant: Colors.black,
        secondary: Colors.black87,
        secondaryVariant: Colors.black,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        error: base.errorColor,
        onError: Colors.white,
        background: Colors.white,
        onBackground: Colors.white12,
        surface: Colors.black,
        onSurface: Colors.white,
        brightness: Brightness.dark,
      ),
      bottomNavigationBarTheme: base.bottomNavigationBarTheme.copyWith(
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedIconTheme: base.iconTheme.copyWith(color: Colors.black54),
      ),
      iconTheme: base.iconTheme.copyWith(opacity: 0.5),
      inputDecorationTheme: base.inputDecorationTheme.copyWith(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.teal),
        ),
        labelStyle: base.textTheme.caption,
        isDense: true,
      ),
      textTheme: _buildShrineTextTheme(base.textTheme),
      appBarTheme: base.appBarTheme.copyWith(
        backwardsCompatibility: false,
        backgroundColor: Colors.black26,
      ),
    );
  }
}
