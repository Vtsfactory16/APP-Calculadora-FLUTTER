import 'package:flutter/material.dart';
import 'package:flutter_application_prueba/screens/Calculadora.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: Calculadora());
  }
}
