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
            CategoryGrid(categorias: categorias),
            const SizedBox(height: 16),
            HistoryList(medicamentos: medicamentos),
          ],
        ),
        
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.medical_services), label: 'Remédios'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Agenda'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Eu'),
        ],
        selectedItemColor: const Color(0xFF5B8DEE),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,));
      
  }
}
