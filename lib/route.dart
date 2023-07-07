


import 'package:flutter/material.dart';
import 'package:sqlite_flutter_learn/screen/add_calcu_screen.dart';
import 'package:sqlite_flutter_learn/screen/home_screen.dart';
import 'package:sqlite_flutter_learn/screen/note_detail_screen.dart';

class Routes{
  static const String home = '/home';
  static const String addCalculator = '/addCalculator';
  static const String noteDetailScreen = '/noteDetailScreen';
  static final Map<String,WidgetBuilder> route = {
    home : (context) => const HomeScreen(),
    addCalculator : (context) => const CreateNewCalculatorScreen(),

    noteDetailScreen : (context) => const NoteDetailScreen()
  };
}