// ignore: file_names
import 'package:flutter/material.dart';
import 'package:medtimer/data/app_data.dart';
import 'package:medtimer/widgets/header_widget.dart';
import 'package:medtimer/widgets/history_list.dart';

class HistoricoScreen extends StatefulWidget {
  const HistoricoScreen({super.key});

  @override
  State<HistoricoScreen> createState() => _HistoricoScreenState();
}

class _HistoricoScreenState extends State<HistoricoScreen> {
  

  @override
  Widget build(BuildContext context) {
     final user = appData["usuarios"][0];
    final medicamentos = appData["medicamentos"];
    final categorias = appData["categorias"];
    return  Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWidget(user: user),
            const SizedBox(height: 16),
  
            HistoryList(medicamentos: medicamentos),
          ],
        ),
        
      ),
     
      );
}}