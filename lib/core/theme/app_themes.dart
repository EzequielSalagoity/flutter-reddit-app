import 'package:flutter/material.dart';
import 'package:flutter_reddit_app/core/constants/ui_values.dart';

ThemeData customLightTheme() {
  TextTheme lightThemeTextTheme(TextTheme base) {
    return TextTheme(
      bodyLarge: TextStyle( 
          // 14 / 600
          fontFamily: font_1,
          fontSize: 15,//17.0,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          color: color_9.withOpacity(0.7),
          height: 1.445),
      bodyMedium: TextStyle( // texto tarjeta
          // 12 / 500
          fontFamily: font_1,
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          color: color_9.withOpacity(0.7),
          height: 1.2),
      headlineSmall: const TextStyle( // titulo userName
          // 10 / 500
          fontFamily: font_1,
          fontSize: 10.0,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          color: color_5,
          height: 1.355),
    );
  } 

  final ThemeData lightTheme = ThemeData.light();
    
  return lightTheme.copyWith(
    textTheme: lightThemeTextTheme(lightTheme.textTheme),
    backgroundColor: color_background,
    primaryColor: color_1,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      })
  );
}
