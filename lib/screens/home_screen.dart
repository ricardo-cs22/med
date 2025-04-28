import 'package:flutter/material.dart';
import 'package:medtimer/data/app_data.dart';
import 'package:medtimer/widgets/bottom_navigation.dart';
import '../widgets/header_widget.dart';
import '../widgets/category_grid.dart';
import '../widgets/history_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = appData["usuarios"][0];
    final medicamentos = appData["medicamentos"];
    final categorias = appData["categorias"];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWidget(user: user),
            const SizedBox(height: 16),
            
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text("Categorias",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            CategoryGrid(categorias: categorias),
            const SizedBox(height: 16),
             Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text("Historico",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            HistoryList(medicamentos: medicamentos),
          ],
        ),
        
      ),
    );
      
  }
}
