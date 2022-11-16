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
        secondary: Colors.white,
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
      scaffoldBackgroundColor: Colors.white,
      bottomNavigationBarTheme: base.bottomNavigationBarTheme.copyWith(
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedIconTheme: base.iconTheme.copyWith(color: Colors.black26),
        selectedIconTheme: base.iconTheme.copyWith(color: Colors.green),
      ),
      appBarTheme: base.appBarTheme.copyWith(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        titleTextStyle: base.textTheme.bodyText1!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      ),
      iconTheme: base.iconTheme.copyWith(opacity: 0.4),
      textTheme: _buildHebrTextTheme(
        base.textTheme.copyWith(
          bodyText2: base.textTheme.bodyText2!.copyWith(color: Colors.black38),
        ),
      ),
      inputDecorationTheme: base.inputDecorationTheme.copyWith(
        labelStyle: base.textTheme.caption,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.teal),
        ),
        prefixIconColor: Colors.grey.shade400,
      ),
    );
  }

  static TextTheme _buildHebrTextTheme(TextTheme base) {
    return base
        .copyWith(
          headline5: base.headline5!.copyWith(
            fontWeight: FontWeight.w500,
          ),
          headline6: base.headline6!.copyWith(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
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
            fontWeight: FontWeight.w600,
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
      textSelectionTheme:
          base.textSelectionTheme.copyWith(cursorColor: Colors.teal),
      colorScheme: base.colorScheme.copyWith(
        primary: Colors.black87,
        secondary: Colors.black87,
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
      scaffoldBackgroundColor: Colors.black87,
      bottomNavigationBarTheme: base.bottomNavigationBarTheme.copyWith(
        backgroundColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: base.iconTheme.copyWith(color: Colors.teal[100]),
      ),
      iconTheme: base.iconTheme.copyWith(color: Colors.white),
      inputDecorationTheme: base.inputDecorationTheme.copyWith(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade600),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade600),
        ),
        labelStyle: base.textTheme.caption,
        prefixIconColor: Colors.grey.shade400,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      ),
      textTheme: _buildHebrTextTheme(base.textTheme),
      backgroundColor: Colors.black,
      appBarTheme: base.appBarTheme.copyWith(
        backgroundColor: Colors.black26,
        elevation: 0.0,
        centerTitle: true,
        titleTextStyle: base.textTheme.bodyText1!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
