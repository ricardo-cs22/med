import 'package:flutter/material.dart';
import 'package:medtimer/data/app_data.dart';
import 'package:medtimer/widgets/header_widget.dart';
import 'package:medtimer/widgets/produto.dart';

class EstoqueScreen extends StatefulWidget {
  const EstoqueScreen({super.key});

  @override
  State<EstoqueScreen> createState() => _EstoqueScreenState();
}

class _EstoqueScreenState extends State<EstoqueScreen> {
  @override
  Widget build(BuildContext context) {
    final user = appData["usuarios"][0];
    final medicamentos = appData["medicamentos"];
    

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWidget(user: user),
            const SizedBox(height: 16),
           
            EstoqueList(medicamentos: medicamentos),
          ],
        ),
        
      ));
      
      
  }
}

