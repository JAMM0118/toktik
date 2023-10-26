import 'package:flutter/material.dart';

class AppTheme{

  ThemeData getTheme() => ThemeData(
    useMaterial3: true, // esto usa el nuevo material design
    brightness: Brightness.dark  // esto pone la app en modo oscuro
  );

}