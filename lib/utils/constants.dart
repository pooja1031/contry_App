import 'package:flutter/material.dart';

class AppConstants {
  // Colors
  static const Color primaryColor = Color.fromARGB(255, 146, 148, 150);
  static const Color accentColor = Color(0xFFFFC107);
  static const Color backgroundColor = Color(0xFFEFEFEF);
  static const Color textColor = Color(0xFF333333);
  
  // Font Sizes
  static const double headingFontSize = 24.0;
  static const double subheadingFontSize = 20.0;
  static const double bodyFontSize = 16.0;
static const TextStyle standardTextStyle = TextStyle(
    fontSize: bodyFontSize,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  // Screen Size
  static const double defaultPadding = 16.0;

                 // URL List for countries
  static const List<String> countryUrls = [
    'https://restcountries.com/v3.1/translation/germany',
    'https://restcountries.com/v3.1/translation/india',
    'https://restcountries.com/v3.1/translation/israel',
    'https://restcountries.com/v3.1/translation/lanka',
    'https://restcountries.com/v3.1/translation/italy',
    'https://restcountries.com/v3.1/translation/china',
    'https://restcountries.com/v3.1/translation/korea',
  ];
}
