import 'package:flutter/material.dart';
import 'package:flutter_studying/pages/choose_location.dart';
import 'package:flutter_studying/pages/home.dart';
import 'package:flutter_studying/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (contex) => Loading(),
      '/home': (contex) => Home(),
      '/location': (contex) => ChooseLocation(),
    },
  ));
}

