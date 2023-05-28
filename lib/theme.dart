import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(color: Colors.red),
    primaryColor: Colors.orange,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red)));

ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.green,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green)));

// Future<void> saveData(bool value) async {
//   final prefs = await SharedPreferences.getInstance();
//   prefs.setBool("DarkThem", value);
// }

// Future<bool> readData() async {
//   final prefs = await SharedPreferences.getInstance();
//   return prefs.getBool("DarkThem") ?? false;
// }
