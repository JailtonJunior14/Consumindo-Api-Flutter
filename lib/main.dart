import 'dart:convert';

import 'package:app/api/api.dart';
import 'package:app/models/post_model.dart';
import 'package:app/pages/home_page.dart';
import 'package:flutter/material.dart';
void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consumo APIs',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage(),
    );
  }
}

