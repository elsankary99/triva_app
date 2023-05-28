import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:triva_number/app.dart';

void main() async {
  runApp(ProviderScope(child: MyApp()));
}
