
import 'package:flutter/material.dart';
import 'package:medtimer/screens/EstoqueScreen.dart';
import 'package:medtimer/screens/HistoricoScreen.dart';
import 'package:medtimer/screens/login_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: {
     '/estoque': (context) => EstoqueScreen(),
     '/historico': (context) => HistoricoScreen(),
  // etc...
},
    );
  }
}
