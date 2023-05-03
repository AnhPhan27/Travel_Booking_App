import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'CabinetGrotesk',
    appBarTheme: appBar(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

AppBarTheme appBar() {
  return const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        fontFamily: 'CabinetGrotesk',
        color: Color(0XFF8B8B8B),
        fontSize: 18,
      ));
}
