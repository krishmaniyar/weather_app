import 'package:flutter/material.dart';
import 'package:weather_app/pages/loading_screen.dart';
import 'package:weather_app/pages/home.dart';
import 'package:weather_app/pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => LoadingScreen(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
