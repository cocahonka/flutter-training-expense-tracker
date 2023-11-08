import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

extension Constants on Never {
  static final kDateFormatter = DateFormat.yMd();

  static final kColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 54, 244, 120),
  );
  static final kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 54, 244, 120),
  );

  static final kBaseLightTheme = ThemeData().copyWith(
    useMaterial3: true,
    textTheme: GoogleFonts.latoTextTheme(
      ThemeData().textTheme.copyWith(
            titleLarge: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
    ),
  );

  static final kBaseDarkTheme = ThemeData.dark().copyWith(
    useMaterial3: true,
    textTheme: GoogleFonts.latoTextTheme(
      ThemeData().textTheme.copyWith(
            titleLarge: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
    ),
  );

  static final kLightTheme = kBaseLightTheme.copyWith(
    colorScheme: kColorScheme,
    textTheme: kBaseLightTheme.textTheme.copyWith(
      titleLarge: kBaseLightTheme.textTheme.titleLarge!.copyWith(
        color: kColorScheme.onSecondaryContainer,
      ),
    ),
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: kColorScheme.onPrimaryContainer,
      foregroundColor: kColorScheme.primaryContainer,
    ),
    cardTheme: const CardTheme().copyWith(
      color: kColorScheme.secondaryContainer,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kColorScheme.primaryContainer,
      ),
    ),
  );

  static final kDarkTheme = kBaseDarkTheme.copyWith(
    colorScheme: kDarkColorScheme,
    textTheme: kBaseDarkTheme.textTheme.copyWith(
      titleLarge: kBaseDarkTheme.textTheme.titleLarge!.copyWith(
        color: kDarkColorScheme.onSecondaryContainer,
      ),
    ),
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: kDarkColorScheme.onPrimaryContainer,
      foregroundColor: kDarkColorScheme.primaryContainer,
    ),
    cardTheme: const CardTheme().copyWith(
      color: kDarkColorScheme.secondaryContainer,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kDarkColorScheme.primaryContainer,
      ),
    ),
  );
}

extension StringX on String {
  String capitalise() => (length > 0) ? this[0].toUpperCase() + substring(1) : this;
}
